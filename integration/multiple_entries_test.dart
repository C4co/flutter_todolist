import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todolist/data/local/database/local_database.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_todolist/main.dart' as app;

void main(List<String> args) {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  var items = Iterable<int>.generate(5).toList();

  setUpAll(() async {
    LocalDatabase db = LocalDatabase();
    await db.deleteEverything();
  });

  group('Create and delete multiples todos', () {
    testWidgets('Create multiples todos', (WidgetTester tester) async {
      app.main();

      for (var item in items) {
        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Icons.add));

        await tester.pumpAndSettle();

        expect(find.text('New todo'), findsOneWidget);

        await tester.enterText(
            find.byKey(const Key('name_input')), 'my todo name $item');

        await tester.enterText(find.byKey(const Key('description_input')),
            'my todo description $item');

        await tester.tap(find.byKey(const Key('submit_button')));

        await tester.pumpAndSettle();
      }
    });

    testWidgets('Check all items', (WidgetTester tester) async {
      app.main();

      for (var item in items) {
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(Key('todo-check-$item')));
      }
    });

    testWidgets('Delete multiples todos', (WidgetTester tester) async {
      app.main();

      for (var item in items) {
        await tester.pumpAndSettle();

        await tester.longPress(find.text('my todo name $item'));

        await tester.pumpAndSettle();

        await tester.tap(find.text('OK'));

        await tester.pumpAndSettle();
      }
    });
  });
}
