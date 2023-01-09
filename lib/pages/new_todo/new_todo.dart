import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_todolist/data/database/local_database.dart';
import 'package:flutter_todolist/data/repositories/local_repository.dart';
import 'package:flutter_todolist/pages/home/home_controller.dart';

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
      appBar: AppBar(title: const Text('Nova Notificação')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                validator: HomeController.validateName,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  label: Text('Nome da notificação'),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _descriptionController,
                validator: HomeController.validateDescription,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  label: Text('Descrição'),
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
                        hour: TimeOfDay.now().hour,
                        minute: TimeOfDay.now().minute,
                      ),
                    );

                    if (!mounted) return;

                    context.go('/');
                  }
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text('Criar Notificação'),
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
