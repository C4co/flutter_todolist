// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// ignore_for_file: type=lint
class $TodoLocalTable extends TodoLocal
    with TableInfo<$TodoLocalTable, TodoLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 2, maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _hourMeta = const VerificationMeta('hour');
  @override
  late final GeneratedColumn<int> hour = GeneratedColumn<int>(
      'hour', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _minuteMeta = const VerificationMeta('minute');
  @override
  late final GeneratedColumn<int> minute = GeneratedColumn<int>(
      'minute', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, description, hour, minute];
  @override
  String get aliasedName => _alias ?? 'todo_local';
  @override
  String get actualTableName => 'todo_local';
  @override
  VerificationContext validateIntegrity(Insertable<TodoLocalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('hour')) {
      context.handle(
          _hourMeta, hour.isAcceptableOrUnknown(data['hour']!, _hourMeta));
    } else if (isInserting) {
      context.missing(_hourMeta);
    }
    if (data.containsKey('minute')) {
      context.handle(_minuteMeta,
          minute.isAcceptableOrUnknown(data['minute']!, _minuteMeta));
    } else if (isInserting) {
      context.missing(_minuteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoLocalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoLocalData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      hour: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hour'])!,
      minute: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}minute'])!,
    );
  }

  @override
  $TodoLocalTable createAlias(String alias) {
    return $TodoLocalTable(attachedDatabase, alias);
  }
}

class TodoLocalData extends DataClass implements Insertable<TodoLocalData> {
  final int id;
  final String name;
  final String description;
  final int hour;
  final int minute;
  const TodoLocalData(
      {required this.id,
      required this.name,
      required this.description,
      required this.hour,
      required this.minute});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['hour'] = Variable<int>(hour);
    map['minute'] = Variable<int>(minute);
    return map;
  }

  TodoLocalCompanion toCompanion(bool nullToAbsent) {
    return TodoLocalCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      hour: Value(hour),
      minute: Value(minute),
    );
  }

  factory TodoLocalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoLocalData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      hour: serializer.fromJson<int>(json['hour']),
      minute: serializer.fromJson<int>(json['minute']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'hour': serializer.toJson<int>(hour),
      'minute': serializer.toJson<int>(minute),
    };
  }

  TodoLocalData copyWith(
          {int? id,
          String? name,
          String? description,
          int? hour,
          int? minute}) =>
      TodoLocalData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        hour: hour ?? this.hour,
        minute: minute ?? this.minute,
      );
  @override
  String toString() {
    return (StringBuffer('TodoLocalData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('hour: $hour, ')
          ..write('minute: $minute')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, hour, minute);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoLocalData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.hour == this.hour &&
          other.minute == this.minute);
}

class TodoLocalCompanion extends UpdateCompanion<TodoLocalData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int> hour;
  final Value<int> minute;
  const TodoLocalCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.hour = const Value.absent(),
    this.minute = const Value.absent(),
  });
  TodoLocalCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required int hour,
    required int minute,
  })  : name = Value(name),
        description = Value(description),
        hour = Value(hour),
        minute = Value(minute);
  static Insertable<TodoLocalData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? hour,
    Expression<int>? minute,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (hour != null) 'hour': hour,
      if (minute != null) 'minute': minute,
    });
  }

  TodoLocalCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<int>? hour,
      Value<int>? minute}) {
    return TodoLocalCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (hour.present) {
      map['hour'] = Variable<int>(hour.value);
    }
    if (minute.present) {
      map['minute'] = Variable<int>(minute.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoLocalCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('hour: $hour, ')
          ..write('minute: $minute')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $TodoLocalTable todoLocal = $TodoLocalTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todoLocal];
}
