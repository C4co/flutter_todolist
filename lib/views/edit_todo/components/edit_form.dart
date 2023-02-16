import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/data/data.dart';
import '/views/views.dart';

class EditTodoForm extends StatefulWidget {
  final TodoLocalData todo;

  const EditTodoForm({super.key, required this.todo});

  @override
  State<EditTodoForm> createState() => _EditTodoFormState();
}

class _EditTodoFormState extends State<EditTodoForm> {
  final _formKey = GlobalKey<FormState>();

  final TodoService _todoService = TodoService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.todo.name;
    _descriptionController.text = widget.todo.description;

    super.initState();
  }

  updateTodo() async {
    if (_formKey.currentState!.validate()) {
      await _todoService.repository.update(
        widget.todo.copyWith(
          name: _nameController.text,
          description: _descriptionController.text,
        ),
      );

      if (mounted) {
        context.go('/details/${widget.todo.id}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit: ${widget.todo.name}')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                key: const Key('textfield-edit-name'),
                controller: _nameController,
                validator: PagesController.validateName,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  label: Text('Todo name'),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                key: const Key('textfield-edit-description'),
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
                key: const Key('update-button'),
                onPressed: updateTodo,
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text('Update todo'),
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
