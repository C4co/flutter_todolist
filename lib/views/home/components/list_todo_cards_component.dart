import 'package:flutter/material.dart';

import 'todo_card_component.dart';
import '/data/data.dart';

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

        return TodoCard(todo: todo, index: index, cardKey: UniqueKey());
      },
    );
  }
}
