import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'todo_card.dart';
import '/data/data.dart';

class ListTodoCards extends StatefulWidget {
  final List<TodoLocalData>? items;

  const ListTodoCards({super.key, required this.items});

  @override
  State<ListTodoCards> createState() => _ListTodoCardsState();
}

class _ListTodoCardsState extends State<ListTodoCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo list')),
      floatingActionButton: FloatingActionButton(
        key: const Key('add_button'),
        onPressed: () {
          context.go('/new_todo');
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey.shade500,
          height: 1,
        ),
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        itemCount: widget.items!.length,
        itemBuilder: (context, index) {
          TodoLocalData todo = widget.items![index];

          return TodoCard(
            todo: todo,
            index: index,
            cardKey: UniqueKey(),
          );
        },
      ),
    );
  }
}
