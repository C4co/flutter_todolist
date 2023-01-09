import 'package:seeno/domain/entities/notification_entity.dart';
import 'package:test/test.dart';

void main() {
  test('Should verify the notification entity', () {
    var myNotification = Notification(
      name: 'notification title',
      description: 'notification description',
      hour: 2,
      minute: 0,
    );

    expect(
      myNotification.toString(),
      equals("Instance of 'Notification'"),
    );
  });
}
