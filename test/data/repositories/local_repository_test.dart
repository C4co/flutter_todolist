import 'package:drift/native.dart';
import 'package:seeno/data/repositories/local_repository.dart';
import 'package:test/test.dart';
import 'package:seeno/data/database/local_database.dart';

void main() {
  late LocalDatabase database;
  late LocalRepository localRepository;

  setUp(() {
    database = LocalDatabase.mock(NativeDatabase.memory());
    localRepository = LocalRepository(database);
  });

  tearDown(() {
    database.close();
  });

  test('Should return 1 when create a new notification', () async {
    var result = await localRepository.create(
      NotificationLocalCompanion.insert(
        name: 'mock notification',
        schedule: '14:00',
      ),
    );

    expect(result, 1);
  });

  test('Should read all notifications', () async {
    late List items;

    localRepository.read().listen((event) {
      items = event;
    });

    await localRepository.create(NotificationLocalCompanion.insert(
        name: 'mock-notification-1', schedule: '14:00'));

    await localRepository.create(NotificationLocalCompanion.insert(
        name: 'mock-notification-2', schedule: '15:00'));

    await localRepository.create(NotificationLocalCompanion.insert(
        name: 'mock-notification-3', schedule: '16:00'));

    await Future.delayed(const Duration(seconds: 1));

    expect(items.length, 3);
  });

  test('Should get one notification', () async {
    final id = await localRepository.create(
      NotificationLocalCompanion.insert(
        name: 'mock notification',
        schedule: '14:00',
      ),
    );

    final notification = await localRepository.get(id: '$id').first;

    expect(notification.name, 'mock notification');
  });

  test('Should get and update a notification', () async {
    final id = await localRepository.create(
      NotificationLocalCompanion.insert(
        name: 'mock-notification',
        schedule: '14:00',
      ),
    );

    final notification = await localRepository.get(id: '$id').first;

    await localRepository.update(notification.copyWith(name: 'mock-updated'));

    final notificationUpdated = await localRepository.get(id: '$id').first;

    expect(notificationUpdated.name, 'mock-updated');
  });

  test('Should delete an notification', () async {
    final id = await localRepository.create(
      NotificationLocalCompanion.insert(
        name: 'mock-notification',
        schedule: '14:00',
      ),
    );

    final notification = await localRepository.get(id: '$id').first;

    final deletedId = await localRepository.delete(notification);

    expect(deletedId, 1);
  });
}
