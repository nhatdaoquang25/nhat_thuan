import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nhat_thuan/src/blocs/search_bloc/search_bloc.dart';
import 'package:nhat_thuan/src/blocs/search_bloc/search_state.dart';
import 'package:nhat_thuan/src/constants/name_routes_constants.dart';
import 'package:nhat_thuan/src/models/coins.dart';
import 'package:nhat_thuan/src/routes/route_genertor.dart';
import 'package:nhat_thuan/src/screens/home_screen/home_screen.dart';
import 'package:nhat_thuan/src/screens/search_screen/search_screen.dart';
import 'package:nhat_thuan/src/services/coin_service/coin_service.dart';
import 'package:nhat_thuan/src/widgets/custom_seach_bar.dart';

import '../../mock/coins_mock_data.dart';
import '../../mock/mock_fake_class.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock_network.dart';

void main() {
  final mockResponse = json.decode(mockCoinsData);
  final mockObserver = MockNavigatorObserver();

  setUpAll(() {
    registerFallbackValue(FakeSearchState());
    registerFallbackValue(FakeSearchEvent());
    registerFallbackValue(FakeRoute());
  });
  group('Search Screen Tests', () {
    late CoinService coinService;
    late SearchBloc searchBloc;

    setUp(() {
      coinService = MockSearchService();
      searchBloc = MockSearchBloc();
    });

    var widget = MaterialApp(
      initialRoute: NameRoutesConstants.root,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: MultiBlocProvider(
          providers: [BlocProvider(create: (context) => searchBloc)],
          child: const SearchScreen()),
      navigatorObservers: [mockObserver],
    );

    testWidgets('Should render Appbar with correct title', (tester) async {
      when(() => searchBloc.state).thenReturn(SearchLoadInProgress());

      await tester.pumpWidget(widget);

      final titleFinder = find.descendant(
          of: find.byType(AppBar), matching: find.text("SEARCH SCREEN"));

      expect(titleFinder, findsOneWidget);
    });

    testWidgets('Navigator pop to HomeScreen', (tester) async {
      when(() => searchBloc.state).thenReturn(SearchLoadInProgress());
      await tester.pumpWidget(widget);

      await tester.pumpAndSettle();

      final iconButtonFinder = find.byType(IconButton);

      expect(iconButtonFinder, findsOneWidget);

      await tester.tap(iconButtonFinder);

      await tester.pumpAndSettle();

      verify(() => mockObserver.didPush(any(), any()));
    });
    testWidgets(
        'Should render error message when coin bloc state is [SeachLoadFailure]',
        (tester) async {
      String errorMessage = 'errorMessage';
      when(() => searchBloc.state)
          .thenReturn(SeachLoadFailure(errorMessage: errorMessage));

      await tester.pumpWidget(widget);
      await tester.pump();

      final errorMessageFinder = find.text(errorMessage);
      expect(errorMessageFinder, findsOneWidget);
    });

    testWidgets(
        'Should render Custom Search Bar list when bloc state is [SearchLoadSuccess]',
        (tester) async {
      when(() => searchBloc.state).thenReturn(SearchLoadSuccess(
          listCoins: List<Coins>.from(
              mockResponse.map((model) => Coins.fromJson(model)))));
      await mockNetwork(() async {
        await tester.pumpWidget(widget);

        await tester.pumpAndSettle();

        expect(find.byType(CustomSearchBar), findsOneWidget);
      });
    });

    testWidgets(
        'Should render Containers list when state is [SearchLoadInProgress]',
        (WidgetTester tester) async {
      when(() => searchBloc.state).thenReturn(SearchLoadInProgress());
      await mockNetwork(() async {
        await tester.pumpWidget(widget);
        expect((tester.widget(find.byType(Container).last) as Container).color,
            Colors.green);
      });
    });
  });
}
