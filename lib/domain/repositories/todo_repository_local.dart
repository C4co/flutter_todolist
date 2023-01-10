import '/data/database/local_database.dart';

abstract class TodoRepositoryLocal {
  Future<int> create(TodoLocalCompanion entry);
  Stream<dynamic> get({required String id});
  Stream<List<TodoLocalData>> read();
  Future<bool> update(TodoLocalData entry);
  Future<int> delete(TodoLocalData entry);
}
