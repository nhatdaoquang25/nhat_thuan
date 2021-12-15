import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:nhat_thuan/src/blocs/coin_detail_bloc/coin_detail_bloc.dart';
import 'package:nhat_thuan/src/blocs/coin_detail_bloc/coin_detail_event.dart';
import 'package:nhat_thuan/src/blocs/coin_detail_bloc/coin_detail_state.dart';
import 'package:nhat_thuan/src/constants/name_routes_constants.dart';
import 'package:nhat_thuan/src/models/coins_detail.dart';
import 'package:nhat_thuan/src/routes/route_genertor.dart';
import 'package:nhat_thuan/src/screens/detail_screen/detail_screen.dart';
import 'package:nhat_thuan/src/services/detail_service/detail_service.dart';
import 'package:nhat_thuan/src/widgets/custom_card_detail.dart';

import '../../mock/detail_mock_data.dart';
import '../../mock/mock_network.dart';

class MockCoinDetailBloc extends MockBloc<CoinDetailEvent, CoinDetailState>
    implements CoinDetailBloc {}

class MockDetailService extends Mock implements DetailService {}

class FakeDetailState extends Fake implements CoinDetailState {}

class FakeDetailEvent extends Fake implements CoinDetailEvent {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}

void main() {
  final mockResponse = json.decode(mockDetailData);
  final mockObserver = MockNavigatorObserver();

  CoinDetail coinDetail = const CoinDetail(
      id: 'bitcoin',
      symbol: 'btc',
      name: 'Bitcoin',
      image:
          'https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579',
      description: 'Bitcoin',
      currentPrice: 56558,
      priceChangePercentage24H: 0.6486,
      high24H: 57955,
      low24H: 55915,
      marketCap: 1069521687196,
      circulatingSupply: 18881681,
      totalSupply: 21000000,
      maxSupply: 21000000);

  setUpAll(() {
    registerFallbackValue(FakeDetailState());
    registerFallbackValue(FakeDetailEvent());
    registerFallbackValue(FakeRoute());
  });

  group('Detail Screen Test', () {
    late DetailService detailService;
    late CoinDetailBloc coinDetailBloc;

    setUp(() {
      detailService = MockDetailService();
      coinDetailBloc = MockCoinDetailBloc();
    });

    tearDown(() {
      coinDetailBloc.close();
    });

    var widget = MaterialApp(
      initialRoute: NameRoutesConstants.root,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: MultiBlocProvider(
          providers: [BlocProvider(create: (context) => coinDetailBloc)],
          child: const DetailScreen(idCoin: 'bitcoin')),
      navigatorObservers: [mockObserver],
    );

    testWidgets('Test the display of the title', (tester) async {
      when(() => detailService.fetchCoinsDetailScreen('bitcoin'))
          .thenAnswer((_) async => mockResponse);
      when(() => coinDetailBloc.state).thenReturn(CoinDetailLoadInProgress());

      await tester.pumpWidget(widget);

      final titleFinder = find.descendant(
          of: find.byType(AppBar), matching: find.text('DETAIL SCREEN'));

      expect(titleFinder, findsOneWidget);
    });

    testWidgets('Should navigator when tapped back icon', (tester) async {
      when(() => coinDetailBloc.state).thenReturn(CoinDetailLoadInProgress());
      await mockNetwork(() async {
        await tester.pumpWidget(widget);
        await tester.tap(find.byType(IconButton));
        await tester.pump();

        verify(() => mockObserver.didPush(any(), any()));
      });
    });

    testWidgets(
        'Should render red container with error message when coin detail bloc state is [CoinDetailLoadFailure]',
        (tester) async {
      const errorMessage = 'errorMessage';
      when(() => coinDetailBloc.state)
          .thenReturn(CoinDetailLoadFailure(errorMessage));
      await tester.pumpWidget(widget);
      await tester.pump();

      final errorMessageFinder = find.text(errorMessage);

      expect(errorMessageFinder, findsOneWidget);
      expect((tester.widget(find.byType(Container)) as Container).color,
          Colors.red);
    });

    testWidgets(
        'Should render CircularProgressIndicator when coin detail bloc state is [CoinDetailLoadInProgress]',
        (tester) async {
      when(() => detailService.fetchCoinsDetailScreen('bitcoin'))
          .thenAnswer((_) async => mockResponse);
      when(() => coinDetailBloc.state).thenReturn(CoinDetailLoadInProgress());

      await tester.pumpWidget(widget);

      final findCircularProgressIndicator =
          find.byType(CircularProgressIndicator);

      expect(findCircularProgressIndicator, findsOneWidget);
    });

    testWidgets(
        'Should render Containers with orange color when state is [CoinInitial]',
        (WidgetTester tester) async {
      when(() => coinDetailBloc.state).thenReturn(CoinDetailInitial());
      await mockNetwork(() async {
        await tester.pumpWidget(widget);

        expect((tester.widget(find.byType(Container)) as Container).color,
            Colors.orange);
      });
    });

    testWidgets(
        'Should render CustomCardDetail when bloc state is [CoinDetailLoadSuccess]',
        (tester) async {
      when(() => coinDetailBloc.state)
          .thenReturn(CoinDetailLoadSuccess(coinDetail: coinDetail));
      await mockNetwork(() async {
        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();

        expect(find.byType(CustomCardDetail), findsOneWidget);
      });
    });
  });
}
