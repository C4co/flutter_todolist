import 'package:flutter/material.dart';

import '/data/local/database/local_database.dart';
import '/data/local/repositories/local_repository.dart';
import '/pages/edit_todo/components/edit_todo_form.dart';
import '/core/components/loading_component.dart';

class EditTodoPage extends StatefulWidget {
  final String? id;

  const EditTodoPage({super.key, required this.id});

  @override
  State<EditTodoPage> createState() => EditTodoPageState();
}

class EditTodoPageState extends State<EditTodoPage> {
  final LocalRepository _localRepository = LocalRepository(LocalDatabase());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _localRepository.get(id: widget.id!),
      builder: (context, AsyncSnapshot<TodoLocalData> snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text('error')),
            body: const Center(child: Text('Something went wrong')),
          );
        }

        if (snapshot.hasData) {
          TodoLocalData todo = snapshot.data!;
          return Scaffold(
            appBar: AppBar(title: Text('Edit: ${todo.name}')),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: EditTodoForm(todo: todo),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(title: const Text('Loading...')),
          body: const LoadingComponent(),
        );
      },
    );
  }
}
