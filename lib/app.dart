import 'package:flutter/material.dart';
import '/settings/routes/router.dart';
import '/settings/themes/basic.theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter ToDoList',
      theme: basicTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
