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
import 'package:nhat_thuan/src/routes/route_genertor.dart';
import 'package:nhat_thuan/src/screens/search_screen/search_screen.dart';
import 'package:nhat_thuan/src/services/coin_service/coin_service.dart';

import '../../mock/coins_mock_data.dart';

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
      when(() => coinService.fecthCoins(1))
          .thenAnswer((_) async => mockResponse);
      when(() => searchBloc.state).thenReturn(SearchLoadInProgress());

      await tester.pumpWidget(widget);

      final titleFinder = find.descendant(
          of: find.byType(AppBar), matching: find.text("SEARCH SCREEN"));

      expect(titleFinder, findsOneWidget);
    });
    testWidgets(
        'Should render red container with error message when coin bloc state is [CoinLoadFailure]',
        (tester) async {
      String errorMessage = 'errorMessage';
      when(() => searchBloc.state)
          .thenReturn(SeachLoadFailure(errorMessage: errorMessage));

      await tester.pumpWidget(widget);
      await tester.pump();

      final errorMessageFinder = find.text(errorMessage);
      expect(errorMessageFinder, findsOneWidget);
    });
  });
}
