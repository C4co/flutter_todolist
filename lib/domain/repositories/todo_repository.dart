import '../entities/todo_entity.dart';

abstract class TodoRepository {
  Future<int> create(Todo entry);
  Stream<dynamic> get({required String id});
  Stream<List<Todo>> read();
  Future<bool> update(Todo entry);
  Future<int> delete(Todo entry);
}
