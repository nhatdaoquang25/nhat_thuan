import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nhat_thuan/src/screens/not_found_screen/not_found_screen.dart';

void main() {
  testWidgets('Should check expanded ,when UI displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: NotFoundScreen(),
    ));

    final expanded = find.text('Not Found');
    expect(expanded, findsOneWidget);
  });
}
