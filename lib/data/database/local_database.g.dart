// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// ignore_for_file: type=lint
class NotificationLocalData extends DataClass
    implements Insertable<NotificationLocalData> {
  final int id;
  final String name;
  final String schedule;
  const NotificationLocalData(
      {required this.id, required this.name, required this.schedule});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['schedule'] = Variable<String>(schedule);
    return map;
  }

  NotificationLocalCompanion toCompanion(bool nullToAbsent) {
    return NotificationLocalCompanion(
      id: Value(id),
      name: Value(name),
      schedule: Value(schedule),
    );
  }

  factory NotificationLocalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationLocalData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      schedule: serializer.fromJson<String>(json['schedule']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'schedule': serializer.toJson<String>(schedule),
    };
  }

  NotificationLocalData copyWith({int? id, String? name, String? schedule}) =>
      NotificationLocalData(
        id: id ?? this.id,
        name: name ?? this.name,
        schedule: schedule ?? this.schedule,
      );
  @override
  String toString() {
    return (StringBuffer('NotificationLocalData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('schedule: $schedule')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, schedule);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationLocalData &&
          other.id == this.id &&
          other.name == this.name &&
          other.schedule == this.schedule);
}

class NotificationLocalCompanion
    extends UpdateCompanion<NotificationLocalData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> schedule;
  const NotificationLocalCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.schedule = const Value.absent(),
  });
  NotificationLocalCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String schedule,
  })  : name = Value(name),
        schedule = Value(schedule);
  static Insertable<NotificationLocalData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? schedule,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (schedule != null) 'schedule': schedule,
    });
  }

  NotificationLocalCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? schedule}) {
    return NotificationLocalCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      schedule: schedule ?? this.schedule,
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
    if (schedule.present) {
      map['schedule'] = Variable<String>(schedule.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationLocalCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('schedule: $schedule')
          ..write(')'))
        .toString();
  }
}

class $NotificationLocalTable extends NotificationLocal
    with TableInfo<$NotificationLocalTable, NotificationLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationLocalTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _scheduleMeta =
      const VerificationMeta('schedule');
  @override
  late final GeneratedColumn<String> schedule = GeneratedColumn<String>(
      'schedule', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, schedule];
  @override
  String get aliasedName => _alias ?? 'notification_local';
  @override
  String get actualTableName => 'notification_local';
  @override
  VerificationContext validateIntegrity(
      Insertable<NotificationLocalData> instance,
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
    if (data.containsKey('schedule')) {
      context.handle(_scheduleMeta,
          schedule.isAcceptableOrUnknown(data['schedule']!, _scheduleMeta));
    } else if (isInserting) {
      context.missing(_scheduleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationLocalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationLocalData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      schedule: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}schedule'])!,
    );
  }

  @override
  $NotificationLocalTable createAlias(String alias) {
    return $NotificationLocalTable(attachedDatabase, alias);
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $NotificationLocalTable notificationLocal =
      $NotificationLocalTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [notificationLocal];
}
