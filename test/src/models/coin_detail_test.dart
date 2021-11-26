import 'package:flutter_test/flutter_test.dart';
import 'package:nhat_thuan/src/models/coins_detail.dart';

void main() {
  group('Coin Detail Test', () {
    test('Model Coin Detail', () {
      expect(
          const CoinDetail(
              id: 'bitcoin',
              symbol: 'btc',
              name: 'Bitcoin',
              image:
                  'https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579',
              description: 'Bitcoin',
              currentPrice: 56558,
              priceChangePercentage24H: 56558,
              high24H: 57955,
              low24H: 55915,
              marketCap: 1069521687196,
              circulatingSupply: 18881681,
              totalSupply: 21000000,
              maxSupply: 21000000),
          const CoinDetail(
              id: 'bitcoin',
              symbol: 'btc',
              name: 'Bitcoin',
              image:
                  'https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579',
              description: 'Bitcoin',
              currentPrice: 56558,
              priceChangePercentage24H: 56558,
              high24H: 57955,
              low24H: 55915,
              marketCap: 1069521687196,
              circulatingSupply: 18881681,
              totalSupply: 21000000,
              maxSupply: 21000000));
    });
  });
}
