import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/data/data.dart';
import '/core/core.dart';

class TodoCard extends StatefulWidget {
  final TodoLocalData todo;
  final int index;
  final Key cardKey;

  const TodoCard({
    required this.index,
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

  checkHandle() {}

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Material(
      key: Key('todo-card-${widget.index}'),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          context.go('/details/${widget.todo.id}');
        },
        onLongPress: () {
          AppDialog.show(
            context: context,
            title: '💣 Delete todo',
            content: 'Are you sure to delete (${widget.todo.name}) todo?',
            actions: <Widget>[
              TextButton(
                key: Key('todo-card-delete-${widget.index}'),
                onPressed: () async {
                  await _todoService.repository.delete(widget.todo);

                  if (mounted) {
                    Navigator.pop(context);
                  }
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                key: Key('todo-check-${widget.index}'),
                value: checked,
                onChanged: (bool? value) {
                  setState(() {
                    checked = value!;

                    _todoService.repository
                        .update(widget.todo.copyWith(checked: value));
                  });
                },
              ),
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
