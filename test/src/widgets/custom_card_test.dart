import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nhat_thuan/src/widgets/custom_card.dart';
import 'package:intl/intl.dart' as intl;

import '../mock/mock_network.dart';

void main() {
  final percentageFormat = intl.NumberFormat("##0.0#");

  final widget = MaterialApp(
    home: Scaffold(
      body: CustomCard(
        index: 1,
        onTap: () {},
        name: 'BITCOIN',
        currentPrice: num.parse(percentageFormat.format(61795)),
        priceChange24h: num.parse(percentageFormat.format(-4139.89781530574)),
        priceChangePercentage24h: num.parse(percentageFormat.format(-6.27872)),
        imageNetwork:
            'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
      ),
    ),
  );

  testWidgets('Should render card with name', (tester) async {
    await mockNetwork(() async {
      await tester.pumpWidget(widget);

      final customCardFinder = find.byType(CustomCard);
      final customCardNameFinder =
          find.descendant(of: customCardFinder, matching: find.text('BITCOIN'));

      expect(customCardNameFinder, findsOneWidget);
    });
  });

  testWidgets('Should render card with icon', (tester) async {
    await mockNetwork(() async {
      await tester.pumpWidget(widget);

      final customCardFinder = find.byType(CustomCard);
      final customCardIconFinder = find.descendant(
          of: customCardFinder,
          matching: find.byIcon(Icons.arrow_drop_down_sharp));

      expect(customCardIconFinder, findsOneWidget);
    });
  });
  testWidgets('Coin Card should be tappable', (tester) async {
    bool isTapped = false;
    await mockNetwork(() async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomCard(
            index: 1,
            onTap: () {
              isTapped = true;
            },
            name: 'BITCOIN',
            currentPrice: num.parse(percentageFormat.format(61795)),
            priceChange24h:
                num.parse(percentageFormat.format(-4139.89781530574)),
            priceChangePercentage24h:
                num.parse(percentageFormat.format(-6.27872)),
            imageNetwork:
                'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
          ),
        ),
      ));

      final albumCardFinder = find.byType(CustomCard);
      await tester.tap(albumCardFinder);

      expect(isTapped, true);
    });
  });
}
