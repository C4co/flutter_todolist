import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../tables/todo_local_table.dart';

part 'local_database.g.dart';

@DriftDatabase(tables: [TodoLocal])
class LocalDatabase extends _$LocalDatabase {
  static final LocalDatabase _instance = LocalDatabase._();

  LocalDatabase._() : super(_openConnection());

  factory LocalDatabase() {
    return _instance;
  }

  // Mock database for tests
  // https://drift.simonbinder.eu/docs/testing/#setup
  LocalDatabase.mock(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  Future<void> deleteEverything() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
