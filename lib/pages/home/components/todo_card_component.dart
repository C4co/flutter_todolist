import 'package:flutter/material.dart';
import 'package:flutter_todolist/data/database/local_database.dart';
import 'package:flutter_todolist/data/repositories/local_repository.dart';
import 'package:go_router/go_router.dart';

import '/settings/themes/basic.theme.dart';

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
  final LocalRepository _localRepository = LocalRepository(LocalDatabase());
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
                  _localRepository.delete(widget.todo).then(
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
                    setState(() async {
                      checked = value!;

                      await _localRepository
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
