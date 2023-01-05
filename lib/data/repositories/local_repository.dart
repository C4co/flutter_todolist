import '/data/database/local_database.dart';
import '/domain/repositories/notification_repository_local.dart';

class LocalRepository implements NotificationRepositoryLocal {
  LocalDatabase database;

  LocalRepository(this.database);

  @override
  Future<int> create(NotificationLocalCompanion entry) {
    return database.into(database.notificationLocal).insert(entry);
  }

  @override
  Future<int> delete(NotificationLocalData entry) {
    return database.delete(database.notificationLocal).delete(entry);
  }

  @override
  Stream<NotificationLocalData> get({required String id}) {
    var item = database.select(database.notificationLocal)
      ..where(
        (table) => table.id.equals(
          int.parse(id),
        ),
      );

    return item.watchSingle();
  }

  @override
  Stream<List<NotificationLocalData>> read() {
    return database.select(database.notificationLocal).watch();
  }

  @override
  Future<bool> update(NotificationLocalData entry) {
    return database.update(database.notificationLocal).replace(entry);
  }
}
