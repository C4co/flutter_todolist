import 'package:flutter/material.dart';

class DetailsError extends StatelessWidget {
  const DetailsError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: const Text('Error'),
      ),
    );
  }
}
