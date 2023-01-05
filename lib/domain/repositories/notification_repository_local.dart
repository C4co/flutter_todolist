import 'package:seeno/data/database/local_database.dart';

abstract class NotificationRepositoryLocal {
  Future<int> create(NotificationLocalCompanion entry);
  Stream<dynamic> get({required String id});
  Stream<List<NotificationLocalData>> read();
  Future<bool> update(NotificationLocalData entry);
  Future<int> delete(NotificationLocalData entry);
}
