import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todolist/data/data.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_todolist/main.dart' as app;

void main(List<String> args) {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    LocalDatabase db = LocalDatabase();

    await db.deleteEverything();
  });

  group('Check details', () {
    testWidgets('Create new todo', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      await tester.tap(find.byKey(
        const Key('add_button'),
      ));

      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(const Key('name_input')),
        'my new todo name',
      );

      await tester.enterText(
        find.byKey(const Key('description_input')),
        'my new todo description',
      );

      await tester.tap(
        find.byKey(const Key('submit_button')),
      );

      await tester.pumpAndSettle();
    });

    testWidgets('Delete todo', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('todo-card-0')));

      await tester.pumpAndSettle();

      expect(find.text('my new todo name'), findsWidgets);

      await tester.tap(find.byIcon(Icons.delete));

      await tester.pumpAndSettle();

      await tester.tap(find.text('OK'));

      await tester.pumpAndSettle();

      expect(find.text('Todo list'), findsOneWidget);
    });
  });
}
