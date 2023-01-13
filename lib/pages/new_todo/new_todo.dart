import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/data/services/todo_service.dart';
import '/domain/entities/todo_entity.dart';
import '/pages/pages_controller.dart';

class NewTodoPage extends StatefulWidget {
  const NewTodoPage({super.key});

  @override
  State<NewTodoPage> createState() => _NewTodoPageState();
}

class _NewTodoPageState extends State<NewTodoPage> {
  final _formKey = GlobalKey<FormState>();

  final TodoService _todoService = TodoService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New todo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                validator: PagesController.validateName,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  label: Text('Todo name'),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _descriptionController,
                validator: PagesController.validateDescription,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  label: Text('Todo Description'),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _todoService.repository.create(
                      Todo(
                        name: _nameController.text,
                        description: _descriptionController.text,
                      ),
                    );

                    if (!mounted) return;

                    context.go('/');
                  }
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text('Create todo'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
