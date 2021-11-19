import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nhat_thuan/src/blocs/coin_bloc/coin_bloc.dart';
import 'package:nhat_thuan/src/blocs/coin_bloc/coin_event.dart';
import 'package:nhat_thuan/src/blocs/coin_bloc/coin_state.dart';
import 'package:nhat_thuan/src/constants/name_routes_constants.dart';
import 'package:nhat_thuan/src/models/coins.dart';
import 'package:nhat_thuan/src/routes/route_genertor.dart';
import 'package:nhat_thuan/src/screens/detail_screen/detail_screen.dart';
import 'package:nhat_thuan/src/screens/home_screen/home_screen.dart';
import 'package:nhat_thuan/src/screens/search_screen/search_screen.dart';
import 'package:nhat_thuan/src/services/coin_service/coin_service.dart';
import 'package:nhat_thuan/src/widgets/custom_card.dart';

import '../../mock/coins_mock_data.dart';
import '../../mock/mock_network.dart';

class MockCoinsBloc extends MockBloc<CoinEvent, CoinState> implements CoinBloc {
}

class MockCoinsService extends Mock implements CoinService {}

class FakeCoinsState extends Fake implements CoinState {}

class FakeCoinsEvent extends Fake implements CoinEvent {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}

void main() {
  final mockResponse = json.decode(mockCoinsData);
  final mockObserver = MockNavigatorObserver();

  setUpAll(() {
    registerFallbackValue(FakeCoinsState());
    registerFallbackValue(FakeCoinsEvent());
    registerFallbackValue(FakeRoute());
  });

  group('Home Screen Test', () {
    late CoinService coinService;
    late CoinBloc coinBloc;

    setUp(() {
      coinService = MockCoinsService();
      coinBloc = MockCoinsBloc();
    });
    var widget = MaterialApp(
      initialRoute: NameRoutesConstants.root,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: MultiBlocProvider(
          providers: [BlocProvider(create: (context) => coinBloc)],
          child: const HomeScreen()),
      navigatorObservers: [mockObserver],
    );
    tearDown(() {
      coinBloc.close();
    });

    testWidgets('Should render Appbar with correct title', (tester) async {
      when(() => coinService.fecthCoins(1))
          .thenAnswer((_) async => mockResponse);
      when(() => coinBloc.state).thenReturn(CoinLoadInProgress());

      await tester.pumpWidget(widget);

      final titleFinder =
          find.descendant(of: find.byType(AppBar), matching: find.text("COIN"));

      expect(titleFinder, findsOneWidget);
    });
    testWidgets(
        'Should render red container with error message when coin bloc state is [CoinLoadFailure]',
        (tester) async {
      String errorMessage = 'errorMessage';
      when(() => coinBloc.state)
          .thenReturn(CoinLoadFailure(errorMessage: errorMessage));

      await tester.pumpWidget(widget);
      await tester.pump();

      final errorMessageFinder = find.text(errorMessage);
      expect(errorMessageFinder, findsOneWidget);
      expect((tester.widget(find.byType(Container)) as Container).color,
          Colors.red);
    });

    testWidgets(
        'Should render CustomCard list when bloc state is [CoinLoadSucess]',
        (tester) async {
      when(() => coinBloc.state).thenReturn(CoinLoadSucess(
          coins: List<Coins>.from(
              mockResponse.map((model) => Coins.fromJson(model)))));
      await mockNetwork(() async {
        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();

        final customCardFinder = find.descendant(
            of: find.byType(ListView), matching: find.byType(CustomCard));

        expect(customCardFinder, findsNWidgets(2));
      });
    });

    testWidgets('Should navigator when tapped Icon Search',
        (WidgetTester tester) async {
      when(() => coinBloc.state).thenReturn(CoinLoadSucess(
          coins: List<Coins>.from(
              mockResponse.map((model) => Coins.fromJson(model)))));
      await mockNetwork(() async {
        await tester.pumpWidget(widget);
        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();
        expect(find.byType(SearchScreen), findsOneWidget);
      });
    });

    testWidgets('Should navigator when tapped CutomCard',
        (WidgetTester tester) async {
      when(() => coinBloc.state).thenReturn(CoinLoadSucess(
          coins: List<Coins>.from(
              mockResponse.map((model) => Coins.fromJson(model)))));
      await mockNetwork(() async {
        await tester.pumpWidget(widget);
        await tester.tap(find.byType(CustomCard).first);
        await tester.pumpAndSettle();
        expect(find.byType(DetailScreen), findsOneWidget);
      });
    });

    testWidgets('Should render Containers list when state is [CoinInitial]',
        (WidgetTester tester) async {
      when(() => coinBloc.state).thenReturn(CoinInitial());
      await mockNetwork(() async {
        await tester.pumpWidget(widget);
        expect((tester.widget(find.byType(Container)) as Container).color,
            Colors.green);
      });
    });
  });
}
