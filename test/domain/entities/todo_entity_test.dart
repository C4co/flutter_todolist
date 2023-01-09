import 'package:flutter_todolist/domain/entities/todo_entity.dart';
import 'package:test/test.dart';

void main() {
  test('Should verify the todo entity', () {
    var todo = Todo(
      name: 'todo title',
      description: 'todo description',
      hour: 2,
      minute: 0,
    );

    expect(
      todo.toString(),
      equals("Instance of 'Todo'"),
    );
  });
}
