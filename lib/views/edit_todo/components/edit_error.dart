import 'package:flutter/material.dart';

class EditError extends StatelessWidget {
  const EditError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('error')),
      body: const Center(child: Text('Something went wrong')),
    );
  }
}
