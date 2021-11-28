import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nhat_thuan/src/blocs/coin_bloc/coin_bloc.dart';
import 'package:nhat_thuan/src/blocs/coin_bloc/coin_event.dart';
import 'package:nhat_thuan/src/blocs/coin_bloc/coin_state.dart';

import 'package:nhat_thuan/src/services/coin_service/coin_service.dart';
import 'package:mockito/mockito.dart';

class MockCoinService extends Mock implements CoinService {}

class MockCoinEvent extends CoinEvent {}

void main() {
  CoinService coinService;
  CoinBloc? coinBloc;

  setUp(() {
    coinService = MockCoinService();
    coinBloc = CoinBloc(coinService: coinService);
  });

  tearDown(() {
    coinBloc?.close();
  });
  blocTest('emits [] when no event is added',
      build: () {
        coinService = MockCoinService();

        return CoinBloc(coinService: coinService);
      },
      expect: () => []);

  blocTest(
    'emits [CoinLoadInProgress] then [CoinLoadSucess] when [CoinRequested] is called',
    build: () {
      coinService = MockCoinService();
      when(coinService.fecthCoins(1)).thenAnswer((_) async => []);
      return CoinBloc(coinService: coinService);
    },
    act: (CoinBloc bloc) => bloc.add(CoinRequested()),
    expect: () => [CoinLoadInProgress(), CoinLoadSucess(coins: const [])],
  );

  blocTest(
    'emits [CoinLoadFailure] when [CoinRequested] is called and service throws error.',
    build: () {
      coinService = MockCoinService();
      when(coinService.fecthCoins(1)).thenThrow(Exception());
      return CoinBloc(coinService: coinService);
    },
    act: (CoinBloc bloc) => bloc.add(CoinRequested()),
    expect: () => [
      CoinLoadInProgress(),
      CoinLoadFailure(errorMessage: Exception().toString()),
    ],
  );

  blocTest(
    'emits [CoinLoadSucess] when [CoinRequested] is called',
    build: () {
      coinService = MockCoinService();
      when(coinService.fecthCoins(1)).thenAnswer((_) async => []);
      return CoinBloc(coinService: coinService);
    },
    act: (CoinBloc bloc) => bloc.add(CoinLoadMore()),
    expect: () => [CoinLoadSucess(coins: const [])],
  );

  blocTest(
    'emits [CoinLoadFailure] when [CoinLoadMore] is called and service throws error.',
    build: () {
      coinService = MockCoinService();
      when(coinService.fecthCoins(1)).thenThrow(Exception());
      return CoinBloc(coinService: coinService);
    },
    act: (CoinBloc bloc) => bloc.add(CoinLoadMore()),
    expect: () => [
      CoinLoadFailure(errorMessage: Exception().toString()),
    ],
  );
}
