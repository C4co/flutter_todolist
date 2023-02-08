import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todolist/data/local/database/local_database.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_todolist/main.dart' as app;

void main(List<String> args) async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    LocalDatabase db = LocalDatabase();

    await db.deleteEverything();
  });

  group('Create and delete a todo', () {
    testWidgets(
      'Check home screen with empty items',
      (WidgetTester tester) async {
        app.main();

        await tester.pumpAndSettle();

        expect(find.byKey(const Key('loading_indicator')), findsOneWidget);

        await tester.pumpAndSettle();

        expect(find.text('Todo list'), findsOneWidget);
        expect(find.text('Empty list'), findsOneWidget);
        expect(find.byKey(const Key('add_button')), findsOneWidget);
      },
    );

    testWidgets('Check all widgets in new todo page',
        (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      var addButton = find.byKey(const Key('add_button'));

      await tester.tap(addButton);
      await tester.pumpAndSettle();

      expect(find.text('New todo'), findsOneWidget);
      expect(find.byKey(const Key('name_input')), findsOneWidget);
      expect(find.byKey(const Key('description_input')), findsOneWidget);
      expect(find.byKey(const Key('submit_button')), findsOneWidget);
    });

    testWidgets('Create new todo', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(const Key('name_input')),
        'todo name',
      );

      await tester.enterText(
        find.byKey(const Key('description_input')),
        'todo description',
      );

      await tester.tap(find.byKey(const Key('submit_button')));
      await tester.pumpAndSettle();

      expect(find.text('Todo list'), findsOneWidget);
    });

    testWidgets('Delete a todo', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('todo-card-0')), findsOneWidget);

      await tester.longPress(find.byKey(const Key('todo-card-0')));

      await tester.pump(const Duration(milliseconds: 400));

      expect(find.text('OK'), findsOneWidget);

      await tester.tap(find.text('OK'));

      await tester.pump(const Duration(milliseconds: 400));

      expect(find.text('Empty list'), findsOneWidget);
    });
  });
}
