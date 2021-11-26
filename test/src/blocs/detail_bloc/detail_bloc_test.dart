import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:nhat_thuan/src/blocs/coin_detail_bloc/coin_detail_bloc.dart';
import 'package:nhat_thuan/src/blocs/coin_detail_bloc/coin_detail_event.dart';
import 'package:nhat_thuan/src/blocs/coin_detail_bloc/coin_detail_state.dart';
import 'package:nhat_thuan/src/models/coins_detail.dart';
import 'package:nhat_thuan/src/services/detail_service/detail_service.dart';

class MockDetailService extends Mock implements DetailService {}

class MockDetailEvent extends CoinDetailEvent {}

main() {
  var coinDetail = const CoinDetail(
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

  DetailService detailService;
  CoinDetailBloc? detailBloc;

  setUp(() {
    detailService = MockDetailService();
    detailBloc = CoinDetailBloc(service: detailService);
  });
  tearDown(() {
    detailBloc?.close();
  });

  blocTest('emits [] when no event is added',
      build: () {
        detailService = MockDetailService();
        return CoinDetailBloc(service: detailService);
      },
      expect: () => []);

  blocTest(
      'emits [CoinDetailLoadInProgress] then [CoinDetailLoadSuccess] when [CoinDetailRequested] is called',
      build: () {
        detailService = MockDetailService();
        when(detailService.fetchCoinsDetailScreen('bitcoin'))
            .thenAnswer((_) async => coinDetail);
        return CoinDetailBloc(service: detailService);
      },
      act: (CoinDetailBloc bloc) =>
          bloc.add(CoinDetailRequested(id: 'bitcoin')),
      expect: () => [
            CoinDetailLoadInProgress(),
            CoinDetailLoadSuccess(coinDetail: coinDetail),
          ]);

  blocTest(
      'emits [CoinDetailLoadFailure] when [CoinDetailRequested] is called and service throws error.',
      build: () {
        detailService = MockDetailService();
        when(detailService.fetchCoinsDetailScreen('bitcoin'))
            .thenThrow(Exception());
        return CoinDetailBloc(service: detailService);
      },
      act: (CoinDetailBloc bloc) =>
          bloc.add(CoinDetailRequested(id: 'bitcoin')),
      expect: () => [
            CoinDetailLoadInProgress(),
            CoinDetailLoadFailure(Exception().toString()),
          ]);
}
