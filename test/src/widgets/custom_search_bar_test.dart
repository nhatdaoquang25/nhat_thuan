import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nhat_thuan/src/blocs/coin_bloc/coin_bloc.dart';
import 'package:nhat_thuan/src/blocs/coin_bloc/coin_event.dart';
import 'package:nhat_thuan/src/blocs/coin_bloc/coin_state.dart';
import 'package:nhat_thuan/src/blocs/coin_detail_bloc/coin_detail_bloc.dart';
import 'package:nhat_thuan/src/blocs/coin_detail_bloc/coin_detail_event.dart';
import 'package:nhat_thuan/src/blocs/coin_detail_bloc/coin_detail_state.dart';
import 'package:nhat_thuan/src/blocs/search_bloc/search_bloc.dart';
import 'package:nhat_thuan/src/blocs/search_bloc/search_event.dart';
import 'package:nhat_thuan/src/blocs/search_bloc/search_state.dart';
import 'package:nhat_thuan/src/constants/name_routes_constants.dart';
import 'package:nhat_thuan/src/models/coins.dart';
import 'package:nhat_thuan/src/routes/route_genertor.dart';

import 'package:nhat_thuan/src/screens/search_screen/search_screen.dart';
import 'package:nhat_thuan/src/services/coin_service/coin_service.dart';
import 'package:nhat_thuan/src/services/detail_service/detail_service.dart';
import 'package:nhat_thuan/src/widgets/custom_seach_bar.dart';

import '../mock/coins_mock_data.dart';
import '../mock/mock_network.dart';

class MockSearchBloc extends MockBloc<SearchEvent, SearchState>
    implements SearchBloc {}

class MockSearchService extends Mock implements CoinService {}

class FakeSearchState extends Fake implements SearchState {}

class FakeSearchEvent extends Fake implements SearchEvent {}

class MockCoinDetailBloc extends MockBloc<CoinDetailEvent, CoinDetailState>
    implements CoinDetailBloc {}

class MockCoinDetailService extends Mock implements DetailService {}

class FakeCoinDetailState extends Fake implements CoinDetailState {}

class FakeCoinDetailEvent extends Fake implements CoinDetailEvent {}

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
    registerFallbackValue(FakeCoinsEvent());
    registerFallbackValue(FakeCoinsState());
    registerFallbackValue(FakeCoinDetailState());
    registerFallbackValue(FakeCoinDetailEvent());
    registerFallbackValue(FakeSearchState());
    registerFallbackValue(FakeSearchEvent());
    registerFallbackValue(FakeRoute());
  });
  group('Autocomplete testing for coin search', () {
    late CoinService coinService;
    late SearchBloc searchBloc;
    late CoinDetailBloc coinDetailBloc;
    late CoinBloc coinBloc;

    var widget = MaterialApp(
      initialRoute: NameRoutesConstants.root,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => searchBloc,
        ),
        BlocProvider(
          create: (context) => coinDetailBloc,
        ),
      ], child: const SearchScreen()),
      navigatorObservers: [mockObserver],
    );
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
      when(() => coinDetailBloc.state).thenReturn(CoinDetailInitial());
      when(() => searchBloc.state).thenReturn(SearchLoadSuccess(
          listCoins: List<Coins>.from(
              mockResponse.map((model) => Coins.fromJson(model)))));
      await mockNetwork(() async {
        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();
        await tester.tap(find.byType(CustomSearchBar));
        await tester.enterText(find.byType(CustomSearchBar), 'bit');
        await tester.pump(const Duration(seconds: 1));
        final coinCardFinder = find.descendant(
            of: find.byType(ListView), matching: find.byType(ListTile).first);
        expect(coinCardFinder, findsOneWidget);
      });
    });
  });
}
