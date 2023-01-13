import '/domain/entities/todo_entity.dart';

abstract class TodoRepository<Model> {
  Future<int> create(Todo entry);
  Stream<Model> get({required String id});
  Stream<List<Model>> read();
  Future<bool> update(Model entry);
  Future<int> delete(Model entry);
}
