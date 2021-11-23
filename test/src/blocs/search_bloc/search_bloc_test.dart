import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:nhat_thuan/src/blocs/search_bloc/search_bloc.dart';
import 'package:nhat_thuan/src/blocs/search_bloc/search_event.dart';
import 'package:nhat_thuan/src/blocs/search_bloc/search_state.dart';
import 'package:nhat_thuan/src/services/coin_service/coin_service.dart';

class MockCoinService extends Mock implements CoinService {}

class MockSearchEvent extends SearchEvent {}

void main() {
  CoinService coinService;
  SearchBloc? searchBloc;

  setUp(() {
    coinService = MockCoinService();
    searchBloc = SearchBloc(coinService: coinService);
  });

  tearDown(() {
    searchBloc?.close();
  });

  blocTest('emits [] when no event is added',
      build: () {
        coinService = MockCoinService();

        return SearchBloc(coinService: coinService);
      },
      expect: () => []);

  blocTest(
    'emits [SearchLoadSuccess] when [SearchRequested] is called',
    build: () {
      coinService = MockCoinService();
      return SearchBloc(coinService: coinService);
    },
    act: (SearchBloc bloc) => bloc.add(SearchRequested()),
    expect: () => [const SearchLoadSuccess()],
  );
  blocTest(
    'emits [SeachLoadFailure] when [CoinRequested] is called and service throws error.',
    build: () {
      coinService = MockCoinService();
      when(coinService.fecthCoinsAll()).thenThrow(Exception());
      return SearchBloc(coinService: coinService);
    },
    act: (SearchBloc bloc) => bloc.add(SearchRequested()),
    expect: () => [SeachLoadFailure(errorMessage: Exception().toString())],
  );
}
