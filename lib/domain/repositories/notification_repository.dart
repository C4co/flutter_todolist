import '/domain/entities/notification_entity.dart';

abstract class NotificationRepository {
  Future<int> create(Notification entry);
  Stream<dynamic> get({required String id});
  Stream<List<Notification>> read();
  Future<bool> update(Notification entry);
  Future<int> delete(Notification entry);
}
