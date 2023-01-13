import '/data/database/local_database.dart';
import '/data/repositories/local_repository.dart';

class TodoService {
  LocalDatabase database = LocalDatabase();
  late LocalRepository repository;

  TodoService() {
    repository = LocalRepository(database);
  }
}
