import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nhat_thuan/src/blocs/search_bloc/search_bloc.dart';
import 'package:nhat_thuan/src/blocs/search_bloc/search_event.dart';
import 'package:nhat_thuan/src/blocs/search_bloc/search_state.dart';
import 'package:nhat_thuan/src/constants/name_routes_constants.dart';
import 'package:nhat_thuan/src/models/coins.dart';
import 'package:nhat_thuan/src/routes/route_genertor.dart';
import 'package:nhat_thuan/src/screens/search_screen/search_screen.dart';
import 'package:nhat_thuan/src/services/coin_service/coin_service.dart';
import 'package:nhat_thuan/src/widgets/custom_seach_bar.dart';

import '../mock/coins_mock_data.dart';

class MockSearchBloc extends MockBloc<SearchEvent, SearchState>
    implements SearchBloc {}

class MockSearchService extends Mock implements CoinService {}

class FakeSearchState extends Fake implements SearchState {}

class FakeSearchEvent extends Fake implements SearchEvent {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}

void main() {
  final mockResponse = json.decode(mockCoinsData);
  final mockObserver = MockNavigatorObserver();

  setUpAll(() {
    registerFallbackValue(FakeSearchState());
    registerFallbackValue(FakeSearchEvent());
    registerFallbackValue(FakeRoute());
  });
  group('Autocomplete testing for coin search', () {
    late CoinService coinService;
    late SearchBloc searchBloc;
    var widget = MaterialApp(
      initialRoute: NameRoutesConstants.root,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: MultiBlocProvider(
          providers: [BlocProvider(create: (context) => searchBloc)],
          child: const SearchScreen()),
      navigatorObservers: [mockObserver],
    );
    setUp(() {
      coinService = MockSearchService();
      searchBloc = MockSearchBloc();
    });
    final listCoin =
        List<Coins>.from(mockResponse.map((model) => Coins.fromJson(model)));

    test('Should return a name', () {
      expect(CustomSearchBar.displayStringForOption(listCoin.first),
          listCoin.first.name);
    });

    testWidgets(
        'Display AutoComplete widget when bloc state is [SearchLoadSuccess]',
        (tester) async {
      when(() => searchBloc.state).thenReturn(SearchLoadSuccess(
          listCoins: List<Coins>.from(
              mockResponse.map((model) => Coins.fromJson(model)))));
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final autocompleteFinder = find
          .byType(Autocomplete<Coins>(optionsBuilder: (_) => []).runtimeType);
      expect(autocompleteFinder, findsOneWidget);
    });

    testWidgets(
        'Should render textField when bloc state is [SearchLoadSuccess]',
        (tester) async {
      when(() => searchBloc.state)
          .thenReturn(SearchLoadSuccess(listCoins: listCoin));
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final textFieldFinder = find.byType(TextField);
      expect(textFieldFinder, findsOneWidget);
    });
  });
}
