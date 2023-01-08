import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/pages/home/home_controller.dart';

import '/settings/themes/basic.theme.dart';

class NotificationCard extends StatelessWidget {
  final String name;
  final int hour;
  final int minute;
  final int id;

  const NotificationCard({
    super.key,
    required this.name,
    required this.hour,
    required this.minute,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          context.go('/details/$id');
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: ProjectText.title,
              ),
              const SizedBox(height: 4),
              Text(
                'Todos os dias às ${HomeController.fomatSchedule(
                  hour: '$hour',
                  minute: '$minute',
                )}',
                style: ProjectText.featured,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
