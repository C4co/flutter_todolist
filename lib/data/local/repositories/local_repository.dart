import 'package:drift/drift.dart';
import 'package:intl/intl.dart';

import '/domain/entities/todo_entity.dart';
import '/data/local/database/local_database.dart';
import '/domain/repositories/todo_repository.dart';

class LocalRepository implements TodoRepository<TodoLocalData> {
  LocalDatabase database;
  LocalRepository(this.database);

  @override
  Future<int> create(Todo entry) {
    var data = TodoLocalCompanion.insert(
      name: entry.name,
      description: entry.description,
      createdAt: DateFormat.yMMMEd().format(
        DateTime.now(),
      ),
    );

    return database.into(database.todoLocal).insert(data);
  }

  @override
  Future<int> delete(TodoLocalData entry) {
    return database.delete(database.todoLocal).delete(entry);
  }

  @override
  Stream<TodoLocalData> get({required String id}) {
    var item = database.select(database.todoLocal)
      ..where(
        (table) => table.id.equals(
          int.parse(id),
        ),
      );

    return item.watchSingle();
  }

  @override
  Stream<List<TodoLocalData>> read() {
    return database.select(database.todoLocal).watch();
  }

  @override
  Future<bool> update(TodoLocalData entry) {
    var data = entry.copyWith(
      updatedAt: Value(
        DateFormat.yMMMEd().format(
          DateTime.now(),
        ),
      ),
    );

    return database.update(database.todoLocal).replace(data);
  }
}
