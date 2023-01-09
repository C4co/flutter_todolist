import 'package:drift/drift.dart';

class TodoLocal extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 2, max: 32)();
  TextColumn get description => text().withLength(min: 2, max: 1000)();
  IntColumn get hour => integer()();
  IntColumn get minute => integer()();
}