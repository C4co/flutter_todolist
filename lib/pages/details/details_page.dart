import 'package:flutter/material.dart';
import 'package:flutter_todolist/settings/themes/basic.theme.dart';
import 'package:go_router/go_router.dart';
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
      builder: (context, AsyncSnapshot<TodoLocalData> snapshot) {
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
          TodoLocalData? item = snapshot.data;

          return Scaffold(
            appBar: AppBar(
              title: Text(item!.name),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('💣 Delete todo'),
                      content:
                          Text('Are you sure to delete (${item.name}) todo?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () async {
                            _localRepository.delete(item).then(
                              (value) {
                                context.go('/');
                              },
                            );
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
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
                    'Created at ${item.createdAt}',
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
