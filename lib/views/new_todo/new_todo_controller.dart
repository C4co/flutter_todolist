import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/data/data.dart';
import '/domain/domain.dart';

mixin NewTodoController {
  final formKey = GlobalKey<FormState>();

  final TodoService todoService = TodoService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  createTodo(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await todoService.repository.create(
        Todo(
          name: nameController.text,
          description: descriptionController.text,
        ),
      );

      if (context.mounted) {
        context.go('/');
      }
    }
  }
}
