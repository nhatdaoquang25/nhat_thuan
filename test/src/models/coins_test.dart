import 'package:flutter_test/flutter_test.dart';
import 'package:nhat_thuan/src/models/coins.dart';

void main() {
  group('Coins', () {
    test('Model Coins', () {
      expect(
          const Coins(
              id: 'bitcoin',
              symbol: 'btc',
              name: 'Bitcoin',
              image:
                  'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
              currentPrice: 61795,
              high24H: 66359,
              low24H: 62151,
              priceChange24H: 4139.89781530574,
              priceChangePercentage24H: 6.27872),
          const Coins(
              id: 'bitcoin',
              symbol: 'btc',
              name: 'Bitcoin',
              image:
                  'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
              currentPrice: 61795,
              high24H: 66359,
              low24H: 62151,
              priceChange24H: 4139.89781530574,
              priceChangePercentage24H: 6.27872));
    });
  });
}
