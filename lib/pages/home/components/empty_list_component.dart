import 'package:flutter/material.dart';

import '/core/themes/basic.theme.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🍔', style: TextStyle(fontSize: 50)),
            const SizedBox(height: 20),
            Text('Empty list', style: ProjectText.title),
            const SizedBox(height: 20),
            Text(
              'Press the float button to create the first todo',
              textAlign: TextAlign.center,
              style: ProjectText.text,
            ),
          ],
        ),
      ),
    );
  }
}
