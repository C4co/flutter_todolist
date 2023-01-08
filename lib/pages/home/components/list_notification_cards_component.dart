import 'package:flutter/material.dart';

import '/data/database/local_database.dart';
import 'notification_card_component.dart';

class ListNotificationCards extends StatelessWidget {
  final List<NotificationLocalData>? items;

  const ListNotificationCards({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey.shade500,
        height: 1,
      ),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      itemCount: items!.length,
      itemBuilder: (context, index) {
        NotificationLocalData notification = items![index];

        return (NotificationCard(
          id: notification.id,
          name: notification.name,
          hour: notification.hour,
          minute: notification.minute,
        ));
      },
    );
  }
}
