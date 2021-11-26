import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nhat_thuan/src/blocs/coin_bloc/coin_bloc.dart';
import 'package:nhat_thuan/src/blocs/coin_detail_bloc/coin_detail_bloc.dart';
import 'package:nhat_thuan/src/blocs/coin_detail_bloc/coin_detail_state.dart';
import 'package:nhat_thuan/src/blocs/search_bloc/search_bloc.dart';
import 'package:nhat_thuan/src/blocs/search_bloc/search_state.dart';
import 'package:nhat_thuan/src/constants/name_routes_constants.dart';
import 'package:nhat_thuan/src/models/coins.dart';
import 'package:nhat_thuan/src/routes/route_genertor.dart';
import 'package:nhat_thuan/src/screens/detail_screen/detail_screen.dart';

import 'package:nhat_thuan/src/screens/search_screen/search_screen.dart';
import 'package:nhat_thuan/src/services/coin_service/coin_service.dart';
import 'package:nhat_thuan/src/widgets/custom_seach_bar.dart';

import '../mock/coins_mock_data.dart';
import '../mock/mock_fake_class.dart';
import '../mock/mock_network.dart';

void main() {
  final mockResponse = json.decode(mockCoinsData);
  final mockObserver = MockNavigatorObserver();

  setUpAll(() {
    registerFallbackValue(FakeCoinsEvent());
    registerFallbackValue(FakeCoinsState());
    registerFallbackValue(FakeCoinDetailState());
    registerFallbackValue(FakeCoinDetailEvent());
    registerFallbackValue(FakeSearchState());
    registerFallbackValue(FakeSearchEvent());
    registerFallbackValue(FakeRoute());
  });
  group('Test CustomSearchBar', () {
    late CoinService coinService;
    late SearchBloc searchBloc;
    late CoinDetailBloc coinDetailBloc;
    late CoinBloc coinBloc;

    setUp(() {
      coinService = MockSearchService();
      searchBloc = MockSearchBloc();
      coinDetailBloc = MockCoinDetailBloc();
      coinBloc = MockCoinsBloc();
    });
    final listCoin =
        List<Coins>.from(mockResponse.map((model) => Coins.fromJson(model)));

    test('Should return a name', () {
      expect(CustomSearchBar.displayStringForOption(listCoin.first),
          listCoin.first.name);
    });

    testWidgets('Should search Coin when bloc state is [SearchLoadSuccess]',
        (tester) async {
      when(() => searchBloc.state).thenReturn(SearchLoadSuccess(
          listCoins: List<Coins>.from(
              mockResponse.map((model) => Coins.fromJson(model)))));
      when(() => coinDetailBloc.state).thenAnswer((_) => CoinDetailInitial());
      await mockNetwork(() async {
        await tester.pumpWidget(MultiBlocProvider(
            providers: [
              BlocProvider<SearchBloc>.value(value: searchBloc),
              BlocProvider<CoinDetailBloc>.value(value: coinDetailBloc)
            ],
            child: const MaterialApp(
              home: SearchScreen(),
              initialRoute: NameRoutesConstants.root,
              onGenerateRoute: RouteGenerator.generateRoute,
            )));
        await tester.pumpAndSettle();
        await tester.tap(find.byType(CustomSearchBar));
        await tester.enterText(find.byType(CustomSearchBar), 'bit');
        await tester.pump(const Duration(seconds: 1));
        final coinCardFinder = find.descendant(
            of: find.byType(ListView), matching: find.byType(ListTile).first);
        expect(coinCardFinder, findsOneWidget);
        await tester.tap(coinCardFinder);
        await tester.pumpAndSettle();
        expect(find.byType(DetailScreen), findsOneWidget);
      });
    });
  });
}
