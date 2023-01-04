import '/data/database/local_database.dart';
import '/domain/entities/notification.entity.dart';
import '/domain/repository/notification.repository.dart';

class LocalRepository implements NotificationRepository {
  final LocalDatabase database;

  LocalRepository(this.database);

  @override
  Future<int> create(Notification entry) {
    var data = NotificationLocalCompanion.insert(
      name: entry.name,
      schedule: entry.schedule,
    );

    return database.into(database.notificationLocal).insert(data);
  }

  @override
  Future<int> delete(Notification entry) {
    var data = NotificationLocalCompanion.insert(
      name: entry.name,
      schedule: entry.schedule,
    );

    return database.into(database.notificationLocal).insert(data);
  }

  @override
  Stream<Notification> get({required String id}) {
    var item = database.select(database.notificationLocal)
      ..where(
        (table) => table.id.equals(
          int.parse(id),
        ),
      );

    return item.watchSingle() as Stream<Notification>;
  }

  @override
  Stream<List<Notification>> read() {
    return database.select(database.notificationLocal).watch()
        as Stream<List<Notification>>;
  }

  @override
  Future<bool> update(Notification entry) {
    var data = NotificationLocalCompanion.insert(
      name: entry.name,
      schedule: entry.schedule,
    );

    return database.update(database.notificationLocal).replace(data);
  }
}
