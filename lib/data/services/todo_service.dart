import '/data/data.dart';

class TodoService {
  LocalDatabase database = LocalDatabase();
  late LocalRepository repository;

  TodoService() {
    repository = LocalRepository(database);
  }
}
