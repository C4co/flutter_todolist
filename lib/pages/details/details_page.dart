import 'package:flutter/material.dart';
import 'package:seeno/pages/home/home_controller.dart';
import 'package:seeno/settings/themes/basic.theme.dart';
import '/data/database/local_database.dart';
import '/data/repositories/local_repository.dart';

class DetailsPage extends StatefulWidget {
  final String? id;

  const DetailsPage({
    super.key,
    required this.id,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final LocalRepository _localRepository = LocalRepository(LocalDatabase());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _localRepository.get(id: widget.id!),
      builder: (context, AsyncSnapshot<NotificationLocalData> snapshot) {
        // show data here!
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Error'),
            ),
          );
        }

        // show data here!
        if (snapshot.hasData) {
          NotificationLocalData? item = snapshot.data;

          return Scaffold(
            appBar: AppBar(
              title: Text(item!.name),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                )
              ],
            ),
            body: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: ProjectText.title,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  Divider(height: 1, color: Colors.grey.shade500),
                  const SizedBox(height: 10),
                  Text(
                    item.description,
                    style: ProjectText.text,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  Divider(height: 1, color: Colors.grey.shade500),
                  const SizedBox(height: 10),
                  Text(
                    'Notificação todos os dias às ${HomeController.fomatSchedule(
                      hour: '${item.hour}',
                      minute: '${item.minute}',
                    )}',
                    style: ProjectText.featured,
                  )
                ],
              ),
            ),
          );
        }

        // Loading data here!
        return Scaffold(
          appBar: AppBar(title: const Text('Loading...')),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: const Text('Loading...'),
          ),
        );
      },
    );
  }
}
