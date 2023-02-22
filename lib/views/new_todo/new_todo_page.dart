import 'package:flutter/material.dart';
import 'new_todo_controller.dart';

import '/views/views.dart';

class NewTodoPage extends StatefulWidget {
  const NewTodoPage({super.key});

  @override
  State<NewTodoPage> createState() => _NewTodoPageState();
}

class _NewTodoPageState extends State<NewTodoPage> with NewTodoController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New todo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                key: const Key('name_input'),
                controller: nameController,
                validator: PagesController.validateName,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  label: Text('Todo name'),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                key: const Key('description_input'),
                controller: descriptionController,
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
                key: const Key('submit_button'),
                onPressed: () {
                  createTodo(context);
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
