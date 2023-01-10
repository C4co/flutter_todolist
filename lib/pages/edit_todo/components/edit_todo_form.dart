import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_todolist/data/database/local_database.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../data/repositories/local_repository.dart';
import '../../pages_controller.dart';

class EditTodoForm extends StatefulWidget {
  final TodoLocalData todo;

  const EditTodoForm({super.key, required this.todo});

  @override
  State<EditTodoForm> createState() => _EditTodoFormState();
}

class _EditTodoFormState extends State<EditTodoForm> {
  final _formKey = GlobalKey<FormState>();

  final LocalRepository _localRepository = LocalRepository(LocalDatabase());
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.todo.name;
    _descriptionController.text = widget.todo.description;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _localRepository
                    .update(
                  widget.todo.copyWith(
                    name: _nameController.text,
                    description: _descriptionController.text,
                    updatedAt: Value(
                      DateFormat.yMMMEd().format(
                        DateTime.now(),
                      ),
                    ),
                  ),
                )
                    .then(
                  (value) {
                    context.go('/details/${widget.todo.id}');
                  },
                );
              }
            },
            child: const SizedBox(
              width: double.infinity,
              child: Center(
                child: Text('Update todo'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
