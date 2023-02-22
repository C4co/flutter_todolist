import 'package:flutter/material.dart';
import 'package:flutter_todolist/views/details/components/details_content.dart';
import 'package:flutter_todolist/views/details/components/details_error.dart';

import '/data/data.dart';
import '/core/core.dart';

class DetailsPage extends StatefulWidget {
  final String? id;

  const DetailsPage({
    super.key,
    required this.id,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final TodoService _todoService = TodoService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _todoService.repository.get(id: widget.id!),
      builder: (context, AsyncSnapshot<TodoLocalData> snapshot) {
        if (snapshot.hasError) {
          return const DetailsError();
        }

        if (snapshot.hasData) {
          TodoLocalData? item = snapshot.data;
          return DetailsContent(item: item!);
        }

        return const LoadingComponent();
      },
    );
  }
}
