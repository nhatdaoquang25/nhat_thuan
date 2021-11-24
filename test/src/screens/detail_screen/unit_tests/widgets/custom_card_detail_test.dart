// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// import 'package:nhat_thuan/src/constants/string_constants.dart';
// import 'package:nhat_thuan/src/widgets/custom_card_detail.dart';
//
// void main() {
//   const id = 'id';
//   const symbol = 'symbol';
//   const name = 'name';
//   const image = 'image';
//   const description = 'description';
//   const currentPrice = 132;
//   const priceChangePercentage24H = 13;
//   const high24H = 123;
//   const low24H = 123;
//   const marketCap = 13;
//   const circulatingSupply = 123;
//   const totalSupply = 132;
//   const maxSupply = 123;
//
//   const widget = MaterialApp(
//     home: Scaffold(
//       body: CustomCardDetail(
//         id: id,
//         symbol: symbol,
//         name: name,
//         image: image,
//         description: description,
//         currentPrice: currentPrice,
//         priceChangePercentage24H: priceChangePercentage24H,
//         high24H: high24H,
//         low24H: low24H,
//         marketCap: marketCap,
//         circulatingSupply: circulatingSupply,
//         totalSupply: totalSupply,
//         maxSupply: maxSupply,
//       ),
//     ),
//   );
//   testWidgets('Test Text in Detail Screen', (textTest) async {
//     await textTest.pumpWidget(widget);
//
//     final detailCardFinder = find.byType(CustomCardDetail);
//     final titleFinder =
//         find.descendant(of: detailCardFinder, matching: find.text(name));
//
//     expect(titleFinder, findsOneWidget);
//     // expect(find.text(StringConstants.textHigh), findsOneWidget);
//     // expect(find.text(StringConstants.textLow), findsOneWidget);
//     // expect(find.text(StringConstants.textMarketCap), findsOneWidget);
//     // expect(find.text(StringConstants.textTradingVolume), findsOneWidget);
//     // expect(find.text(StringConstants.textCirculationSuplly), findsOneWidget);
//     // expect(find.text(StringConstants.textTotal), findsOneWidget);
//     // expect(find.text(StringConstants.textMax), findsOneWidget);
//     // expect(find.text(StringConstants.textDescription), findsOneWidget);
//   });
//   // testWidgets('Test background app', (WidgetTester testBg) async {
//   //   await testBg.pumpWidget(const DetailScreen());
//   //   Container testBoxdecoration = testBg.firstWidget(find.byType(Container));
//   //   BoxDecoration bgApp = const BoxDecoration(
//   //       gradient: LinearGradient(
//   //     begin: Alignment.bottomRight,
//   //     end: Alignment.topLeft,
//   //     colors: [Color(0xFF17EAD9), Color(0xFF6078EA)],
//   //   ));
//   //
//   //   expect(testBoxdecoration.decoration, bgApp);
//   // });
//   // testWidgets('Test button when press it will back to home screen',
//   //     (WidgetTester buttonTest) async {
//   //   final mockNa = MockNavigator();
//   //   await buttonTest.pumpWidget(MaterialApp(
//   //     home: const DetailScreen(),
//   //     navigatorObservers: [mockNa],
//   //   ));
//   //
//   //   final iconButton = find.byType(IconButton);
//   //   expect(iconButton, findsOneWidget);
//   //   await buttonTest.press(iconButton);
//   //   verify(mockNa.navigator);
//   // });
// }
