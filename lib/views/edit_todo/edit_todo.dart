import 'package:flutter/material.dart';
import 'package:flutter_todolist/views/edit_todo/components/edit_error.dart';

import '/data/data.dart';
import '/core/core.dart';
import 'components/edit_form.dart';

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
          return const EditError();
        }

        if (snapshot.hasData) {
          TodoLocalData todo = snapshot.data!;
          return EditTodoForm(todo: todo);
        }

        return const LoadingComponent();
      },
    );
  }
}
