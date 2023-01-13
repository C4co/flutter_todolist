import 'package:drift/native.dart';
import 'package:flutter_todolist/data/repositories/local_repository.dart';
import 'package:flutter_todolist/domain/entities/todo_entity.dart';
import 'package:test/test.dart';
import 'package:flutter_todolist/data/database/local_database.dart';

void main() {
  late LocalDatabase database;
  late LocalRepository localRepository;

  setUp(() {
    database = LocalDatabase.mock(NativeDatabase.memory());
    localRepository = LocalRepository(database);
  });

  tearDown(() {
    database.close();
  });

  test('Should return 1 when create a new todo', () async {
    var result = await localRepository.create(
      Todo(
        name: 'todo title',
        description: 'todo description',
      ),
    );

    expect(result, 1);
  });

  test('Should read all todos', () async {
    late List items;

    localRepository.read().listen((event) {
      items = event;
    });

    await localRepository.create(
      Todo(
        name: 'todo title 1',
        description: 'todo description 1',
      ),
    );

    await localRepository.create(
      Todo(
        name: 'todo title 2',
        description: 'todo description 2',
      ),
    );

    await localRepository.create(
      Todo(
        name: 'todo title 1',
        description: 'todo description 1',
      ),
    );

    await Future.delayed(const Duration(seconds: 1));

    expect(items.length, 3);
  });

  test('Should get one todo', () async {
    final id = await localRepository.create(
      Todo(
        name: 'todo title 1',
        description: 'todo description 1',
      ),
    );

    final todo = await localRepository.get(id: '$id').first;

    expect(todo.name, 'todo title 1');
  });

  test('Should get and update a todo', () async {
    final id = await localRepository.create(
      Todo(
        name: 'todo title 1',
        description: 'todo description 1',
      ),
    );

    final todo = await localRepository.get(id: '$id').first;

    await localRepository.update(todo.copyWith(name: 'todo-name-updated'));

    final todoUpdated = await localRepository.get(id: '$id').first;

    expect(todoUpdated.name, 'todo-name-updated');
  });

  test('Should delete a todo', () async {
    final id = await localRepository.create(
      Todo(
        name: 'todo title 1',
        description: 'todo description 1',
      ),
    );

    final todo = await localRepository.get(id: '$id').first;

    final deletedId = await localRepository.delete(todo);

    expect(deletedId, 1);
  });
}
