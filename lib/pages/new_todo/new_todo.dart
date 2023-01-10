import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_todolist/data/database/local_database.dart';
import 'package:flutter_todolist/data/repositories/local_repository.dart';
import 'package:flutter_todolist/pages/pages_controller.dart';
import 'package:intl/intl.dart';

class NewTodoPage extends StatefulWidget {
  const NewTodoPage({super.key});

  @override
  State<NewTodoPage> createState() => _NewTodoPageState();
}

class _NewTodoPageState extends State<NewTodoPage> {
  final _formKey = GlobalKey<FormState>();

  final LocalRepository _localRepository = LocalRepository(LocalDatabase());
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
                    await _localRepository.create(
                      TodoLocalCompanion.insert(
                        name: _nameController.text,
                        description: _descriptionController.text,
                        createdAt: DateFormat.yMMMEd().format(DateTime.now()),
                        updatedAt: const Value(null),
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
