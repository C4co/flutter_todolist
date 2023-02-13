import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/data/data.dart';
import '/core/core.dart';
import 'components/empty_list_component.dart';
import 'components/list_todo_cards_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TodoService _todoService = TodoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Todo list'),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('add_button'),
        onPressed: () {
          context.go('/new_todo');
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        key: const Key('home_stream_content'),
        stream: _todoService.repository.read(),
        builder: (context, AsyncSnapshot<List<TodoLocalData>> snapshot) {
          var items = snapshot.data;

          if (snapshot.hasError) {
            return const Text('Error here!');
          }

          if (snapshot.hasData && snapshot.data!.toList().isEmpty) {
            return const EmptyList();
          }

          if (snapshot.hasData) {
            return ListTodoCards(items: items);
          }

          return const LoadingComponent();
        },
      ),
    );
  }
}
