import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/data/data.dart';
import '/core/core.dart';

class DetailsContent extends StatelessWidget {
  final TodoLocalData item;
  final TodoService _todoService = TodoService();

  DetailsContent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        actions: [
          IconButton(
            key: const Key('edit_button'),
            onPressed: () {
              context.go('/edit/${item.id}');
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              AppDialog.show(
                context: context,
                title: '💣 Delete todo',
                content: 'Are you sure to delete (${item.name}) todo?',
                actions: <Widget>[
                  TextButton(
                    onPressed: () async {
                      await _todoService.repository.delete(item);

                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
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
            ),
            if (item.updatedAt != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Divider(height: 1, color: Colors.grey.shade500),
                  const SizedBox(height: 10),
                  Text(
                    'Updated at ${item.updatedAt}',
                    style: ProjectText.featured,
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
