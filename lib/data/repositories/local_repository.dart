import '/data/database/local_database.dart';
import '/domain/repositories/todo_repository_local.dart';

class LocalRepository implements TodoRepositoryLocal {
  LocalDatabase database;

  LocalRepository(this.database);

  @override
  Future<int> create(TodoLocalCompanion entry) {
    return database.into(database.todoLocal).insert(entry);
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
    return database.update(database.todoLocal).replace(entry);
  }
}
