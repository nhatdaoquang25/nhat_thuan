import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nhat_thuan/src/widgets/custom_card_detail.dart';

import '../mock/mock_network.dart';

void main() {
  const widget = MaterialApp(
    home: Scaffold(
      body: CustomCardDetail(
        id: 'bitcoin',
        symbol: 'btc',
        name: 'Bitcoin',
        image:
            'https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579',
        description:
            'Bitcoin is the first successful internet money based on peer-to-peer technology',
        currentPrice: 56558,
        priceChangePercentage24H: 0.6486,
        high24H: 57955,
        low24H: 55915,
        marketCap: 1069521687196,
        circulatingSupply: 18881681,
        totalSupply: 21000000.0,
        maxSupply: 21000000,
      ),
    ),
  );

  testWidgets('Test the display of the coin name', (WidgetTester tester) async {
    await mockNetwork(() async {
      await tester.pumpWidget(widget);

      expect(find.text('BITCOIN'), findsOneWidget);
    });
  });

  testWidgets('Test the display of the coin symbol',
      (WidgetTester tester) async {
    await mockNetwork(() async {
      await tester.pumpWidget(widget);

      expect(find.text('(BTC)'), findsOneWidget);
    });
  });

  testWidgets('Test the display of the total supply',
      (WidgetTester tester) async {
    await mockNetwork(() async {
      await tester.pumpWidget(widget);

      expect(find.text('\$ 21000000.0'), findsOneWidget);
    });
  });

  testWidgets('Test the display of the drop_up icon ',
      (WidgetTester tester) async {
    await mockNetwork(() async {
      await tester.pumpWidget(widget);

      expect(find.byIcon(Icons.arrow_drop_up_outlined), findsOneWidget);
    });
  });
}
