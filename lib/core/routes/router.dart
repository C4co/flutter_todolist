import 'package:go_router/go_router.dart';
import '/views/views.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'new_todo',
          builder: (context, state) => const NewTodoPage(),
        ),
        GoRoute(
          path: 'details/:id',
          builder: (context, state) => DetailsPage(id: state.params['id']),
        ),
        GoRoute(
          path: 'edit/:id',
          builder: (context, state) => EditTodoPage(id: state.params['id']),
        ),
      ],
    )
  ],
);
