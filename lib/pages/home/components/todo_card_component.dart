import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/data/services/todo_service.dart';
import '/data/local/database/local_database.dart';
import '/core/themes/basic.theme.dart';

class TodoCard extends StatefulWidget {
  final TodoLocalData todo;
  final Key cardKey;

  const TodoCard({
    required this.cardKey,
    required this.todo,
  }) : super(key: cardKey);

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard>
    with AutomaticKeepAliveClientMixin {
  final TodoService _todoService = TodoService();
  bool checked = false;

  @override
  void initState() {
    checked = widget.todo.checked;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          context.go('/details/${widget.todo.id}');
        },
        onLongPress: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('💣 Delete todo'),
            content: Text('Are you sure to delete (${widget.todo.name}) todo?'),
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  _todoService.repository.delete(widget.todo).then(
                    (value) {
                      Navigator.pop(context, 'ok');
                    },
                  );
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                  value: checked,
                  onChanged: (bool? value) {
                    setState(() {
                      checked = value!;

                      _todoService.repository
                          .update(widget.todo.copyWith(checked: value));
                    });
                  }),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.todo.name,
                    style: widget.todo.checked
                        ? ProjectText.titleChecked
                        : ProjectText.title,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.todo.updatedAt != null
                        ? 'Updated at ${widget.todo.updatedAt!}'
                        : 'Created at ${widget.todo.createdAt}',
                    style: ProjectText.featured,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
