import 'package:flutter/material.dart';
import 'package:flutter_todolist/settings/themes/basic.theme.dart';

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
            const Text('🐞', style: TextStyle(fontSize: 50)),
            const SizedBox(height: 20),
            Text(
              'Aperte o botão no canto de baixo para criar a sua primeira notificação.',
              textAlign: TextAlign.center,
              style: ProjectText.text,
            ),
          ],
        ),
      ),
    );
  }
}
