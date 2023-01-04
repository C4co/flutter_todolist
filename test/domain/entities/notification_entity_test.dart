import 'package:seeno/domain/entities/notification_entity.dart';
import 'package:test/test.dart';

void main() {
  test('Should verify the notification entity', () {
    var myNotification = Notification(
      name: 'mock notification',
      schedule: '2:00',
    );

    expect(myNotification.toString(), equals("Instance of 'Notification'"));
  });
}
