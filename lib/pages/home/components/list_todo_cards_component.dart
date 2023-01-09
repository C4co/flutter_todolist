import 'package:flutter/material.dart';

import '/data/database/local_database.dart';
import 'todo_card_component.dart';

class ListTodoCards extends StatelessWidget {
  final List<TodoLocalData>? items;

  const ListTodoCards({super.key, required this.items});

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
        TodoLocalData todo = items![index];

        return (TodoCard(
          id: todo.id,
          name: todo.name,
          hour: todo.hour,
          minute: todo.minute,
        ));
      },
    );
  }
}
