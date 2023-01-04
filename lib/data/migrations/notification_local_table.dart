import 'package:drift/drift.dart';

class NotificationLocal extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 2, max: 32)();
  TextColumn get schedule => text().withLength(min: 2, max: 32)();
}
