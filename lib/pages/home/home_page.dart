import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/pages/home/components/empty_list_component.dart';
import 'components/list_todo_cards_component.dart';
import '/settings/components/loading_component.dart';

import '/data/database/local_database.dart';
import '/data/repositories/local_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LocalRepository _localRepository = LocalRepository(LocalDatabase());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Todo list'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/new_todo');
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: _localRepository.read(),
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
