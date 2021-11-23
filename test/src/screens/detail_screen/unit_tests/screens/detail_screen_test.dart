import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nhat_thuan/src/constants/string_constants.dart';
import 'package:nhat_thuan/src/screens/detail_screen/detail_screen.dart';
import 'package:nhat_thuan/src/widgets/custom_card_detail.dart';

void main() {
  testWidgets('Test Text in Detail Screen', (WidgetTester textTest) async {
    await textTest.pumpWidget(const DetailScreen());

    expect(find.text(StringConstants.titleDetailScreen), findsOneWidget);
    // expect(find.text(StringConstants.textHigh), findsOneWidget);
    // expect(find.text(StringConstants.textLow), findsOneWidget);
    // expect(find.text(StringConstants.textMarketCap), findsOneWidget);
    // expect(find.text(StringConstants.textTradingVolume), findsOneWidget);
    // expect(find.text(StringConstants.textCirculationSuplly), findsOneWidget);
    // expect(find.text(StringConstants.textTotal), findsOneWidget);
    // expect(find.text(StringConstants.textMax), findsOneWidget);
    // expect(find.text(StringConstants.textDescription), findsOneWidget);
  });
  // testWidgets('Test background app', (WidgetTester testBg) async {
  //   await testBg.pumpWidget(const DetailScreen());
  //   Container testBoxdecoration = testBg.firstWidget(find.byType(Container));
  //   BoxDecoration bgApp = const BoxDecoration(
  //       gradient: LinearGradient(
  //     begin: Alignment.bottomRight,
  //     end: Alignment.topLeft,
  //     colors: [Color(0xFF17EAD9), Color(0xFF6078EA)],
  //   ));
  //
  //   expect(testBoxdecoration.decoration, bgApp);
  // });
  // testWidgets('Test button when press it will back to home screen',
  //     (WidgetTester buttonTest) async {
  //   final mockNa = MockNavigator();
  //   await buttonTest.pumpWidget(MaterialApp(
  //     home: const DetailScreen(),
  //     navigatorObservers: [mockNa],
  //   ));
  //
  //   final iconButton = find.byType(IconButton);
  //   expect(iconButton, findsOneWidget);
  //   await buttonTest.press(iconButton);
  //   verify(mockNa.navigator);
  // });
}
