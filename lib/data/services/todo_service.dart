import '/data/local/database/local_database.dart';
import '/data/local/repositories/local_repository.dart';

class TodoService {
  LocalDatabase database = LocalDatabase();
  late LocalRepository repository;

  TodoService() {
    repository = LocalRepository(database);
  }
}
