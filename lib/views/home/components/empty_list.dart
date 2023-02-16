import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/core/core.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo list')),
      floatingActionButton: FloatingActionButton(
        key: const Key('add_button'),
        onPressed: () {
          context.go('/new_todo');
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('🍔', style: TextStyle(fontSize: 50)),
              const SizedBox(height: 20),
              Text(
                'Empty list',
                style: ProjectText.title,
                key: const Key('loading_indicator'),
              ),
              const SizedBox(height: 20),
              Text(
                'Press the float button to create the first todo',
                textAlign: TextAlign.center,
                style: ProjectText.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
