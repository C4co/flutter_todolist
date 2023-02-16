import 'package:flutter/material.dart';
import 'package:flutter_todolist/views/home/components/error_page.dart';

import 'components/empty_list.dart';
import 'components/list_todo_cards.dart';

import '/data/data.dart';
import '/core/core.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TodoService _todoService = TodoService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      key: const Key('home_stream_content'),
      stream: _todoService.repository.read(),
      builder: (context, AsyncSnapshot<List<TodoLocalData>> snapshot) {
        var items = snapshot.data;

        if (snapshot.hasError) {
          return const ErrorPage();
        }

        if (snapshot.hasData && snapshot.data!.toList().isEmpty) {
          return const EmptyList();
        }

        if (snapshot.hasData) {
          return ListTodoCards(items: items);
        }

        return const LoadingComponent();
      },
    );
  }
}
