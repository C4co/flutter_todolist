import 'package:flutter/material.dart';
import 'package:flutter_todolist/data/database/local_database.dart';
import 'package:flutter_todolist/data/repositories/local_repository.dart';
import 'package:go_router/go_router.dart';

import '/settings/themes/basic.theme.dart';

class TodoCard extends StatelessWidget {
  final TodoLocalData myTodo;
  final LocalRepository _localRepository = LocalRepository(LocalDatabase());

  TodoCard({
    super.key,
    required this.myTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          context.go('/details/${myTodo.id}');
        },
        onLongPress: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('💣 Delete todo'),
            content: Text('Are you sure to delete (${myTodo.name}) todo?'),
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  _localRepository.delete(myTodo).then(
                    (value) {
                      Navigator.pop(context, 'ok');
                    },
                  );
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                myTodo.name,
                style: ProjectText.title,
              ),
              const SizedBox(height: 4),
              Text(
                'Created at ${myTodo.createdAt}',
                style: ProjectText.featured,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
