import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifoodtv/src/presenter/widgets/button/small_button_widget.dart';

void main() {
  testWidgets('small button widget onTap', (tester) async {
    bool onTapCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: SmallButtonWidget(
            icon: const Icon(Icons.add),
            text: const Text('Add'),
            onTap: () {
              onTapCalled = true;
            },
          ),
        ),
      ),
    );

    await tester.pump();

    final smallButtonFinder = find.byType(SmallButtonWidget);
    expect(smallButtonFinder, findsOneWidget);

    await tester.tap(smallButtonFinder);
    await tester.pump();

    expect(onTapCalled, true);
  });

  testWidgets('small button widget layout', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: SmallButtonWidget(
            icon: const Icon(Icons.add),
            text: const Text('Add'),
            onTap: () {},
          ),
        ),
      ),
    );

    final containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);

    final rowFinder = find.byType(Row);
    expect(rowFinder, findsOneWidget);

    final iconFinder = find.byType(Icon);
    expect(iconFinder, findsOneWidget);

    final textFinder = find.byType(Text);
    expect(textFinder, findsOneWidget);
  });
}
