import '/domain/entities/notification.entity.dart';
import '/domain/repository/notification.repository.dart';

class LocalRepository implements NotificationRepository {
  @override
  Future<int> create(Notification entry) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<int> delete(Notification entry) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Stream<Notification> get({required String id}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Stream<List<Notification>> read() {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<bool> update(Notification entry) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
