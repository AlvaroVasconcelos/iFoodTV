import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:ifoodtv/src/presenter/widgets/button/tab_button_widget.dart';

void main() {
  testWidgets('tab button widget displays placeholder', (tester) async {
    await tester.pumpWidget(const TabButtonWidget());

    final placeholderFinder = find.byType(Placeholder);
    expect(placeholderFinder, findsOneWidget);
  });

  testWidgets('tab button widget has correct key', (tester) async {
    const key = Key('test_key');
    await tester.pumpWidget(const TabButtonWidget(key: key));

    final tabButtonFinder = find.byKey(key);
    expect(tabButtonFinder, findsOneWidget);
  });
}
