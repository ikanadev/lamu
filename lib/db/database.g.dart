// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DbSamplesTable extends DbSamples
    with TableInfo<$DbSamplesTable, DbSample> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbSamplesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverVersionMeta = const VerificationMeta(
    'serverVersion',
  );
  @override
  late final GeneratedColumn<double> serverVersion = GeneratedColumn<double>(
    'server_version',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isDirtyMeta = const VerificationMeta(
    'isDirty',
  );
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
    'is_dirty',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_dirty" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    serverVersion,
    isDirty,
    isDeleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_samples';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbSample> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('server_version')) {
      context.handle(
        _serverVersionMeta,
        serverVersion.isAcceptableOrUnknown(
          data['server_version']!,
          _serverVersionMeta,
        ),
      );
    }
    if (data.containsKey('is_dirty')) {
      context.handle(
        _isDirtyMeta,
        isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbSample map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbSample(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      serverVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}server_version'],
      )!,
      isDirty: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_dirty'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
    );
  }

  @override
  $DbSamplesTable createAlias(String alias) {
    return $DbSamplesTable(attachedDatabase, alias);
  }
}

class DbSample extends DataClass implements Insertable<DbSample> {
  final String id;
  final String name;
  final double serverVersion;
  final bool isDirty;
  final bool isDeleted;
  const DbSample({
    required this.id,
    required this.name,
    required this.serverVersion,
    required this.isDirty,
    required this.isDeleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['server_version'] = Variable<double>(serverVersion);
    map['is_dirty'] = Variable<bool>(isDirty);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  DbSamplesCompanion toCompanion(bool nullToAbsent) {
    return DbSamplesCompanion(
      id: Value(id),
      name: Value(name),
      serverVersion: Value(serverVersion),
      isDirty: Value(isDirty),
      isDeleted: Value(isDeleted),
    );
  }

  factory DbSample.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbSample(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      serverVersion: serializer.fromJson<double>(json['serverVersion']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'serverVersion': serializer.toJson<double>(serverVersion),
      'isDirty': serializer.toJson<bool>(isDirty),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  DbSample copyWith({
    String? id,
    String? name,
    double? serverVersion,
    bool? isDirty,
    bool? isDeleted,
  }) => DbSample(
    id: id ?? this.id,
    name: name ?? this.name,
    serverVersion: serverVersion ?? this.serverVersion,
    isDirty: isDirty ?? this.isDirty,
    isDeleted: isDeleted ?? this.isDeleted,
  );
  DbSample copyWithCompanion(DbSamplesCompanion data) {
    return DbSample(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      serverVersion: data.serverVersion.present
          ? data.serverVersion.value
          : this.serverVersion,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbSample(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('isDirty: $isDirty, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, serverVersion, isDirty, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbSample &&
          other.id == this.id &&
          other.name == this.name &&
          other.serverVersion == this.serverVersion &&
          other.isDirty == this.isDirty &&
          other.isDeleted == this.isDeleted);
}

class DbSamplesCompanion extends UpdateCompanion<DbSample> {
  final Value<String> id;
  final Value<String> name;
  final Value<double> serverVersion;
  final Value<bool> isDirty;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const DbSamplesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbSamplesCompanion.insert({
    required String id,
    required String name,
    this.serverVersion = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<DbSample> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<double>? serverVersion,
    Expression<bool>? isDirty,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (serverVersion != null) 'server_version': serverVersion,
      if (isDirty != null) 'is_dirty': isDirty,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbSamplesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<double>? serverVersion,
    Value<bool>? isDirty,
    Value<bool>? isDeleted,
    Value<int>? rowid,
  }) {
    return DbSamplesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      serverVersion: serverVersion ?? this.serverVersion,
      isDirty: isDirty ?? this.isDirty,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (serverVersion.present) {
      map['server_version'] = Variable<double>(serverVersion.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbSamplesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('isDirty: $isDirty, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DbSamplesTable dbSamples = $DbSamplesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dbSamples];
}

typedef $$DbSamplesTableCreateCompanionBuilder =
    DbSamplesCompanion Function({
      required String id,
      required String name,
      Value<double> serverVersion,
      Value<bool> isDirty,
      Value<bool> isDeleted,
      Value<int> rowid,
    });
typedef $$DbSamplesTableUpdateCompanionBuilder =
    DbSamplesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<double> serverVersion,
      Value<bool> isDirty,
      Value<bool> isDeleted,
      Value<int> rowid,
    });

class $$DbSamplesTableFilterComposer
    extends Composer<_$AppDatabase, $DbSamplesTable> {
  $$DbSamplesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDirty => $composableBuilder(
    column: $table.isDirty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DbSamplesTableOrderingComposer
    extends Composer<_$AppDatabase, $DbSamplesTable> {
  $$DbSamplesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDirty => $composableBuilder(
    column: $table.isDirty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DbSamplesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbSamplesTable> {
  $$DbSamplesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);
}

class $$DbSamplesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbSamplesTable,
          DbSample,
          $$DbSamplesTableFilterComposer,
          $$DbSamplesTableOrderingComposer,
          $$DbSamplesTableAnnotationComposer,
          $$DbSamplesTableCreateCompanionBuilder,
          $$DbSamplesTableUpdateCompanionBuilder,
          (DbSample, BaseReferences<_$AppDatabase, $DbSamplesTable, DbSample>),
          DbSample,
          PrefetchHooks Function()
        > {
  $$DbSamplesTableTableManager(_$AppDatabase db, $DbSamplesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbSamplesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbSamplesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbSamplesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> serverVersion = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbSamplesCompanion(
                id: id,
                name: name,
                serverVersion: serverVersion,
                isDirty: isDirty,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<double> serverVersion = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbSamplesCompanion.insert(
                id: id,
                name: name,
                serverVersion: serverVersion,
                isDirty: isDirty,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DbSamplesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbSamplesTable,
      DbSample,
      $$DbSamplesTableFilterComposer,
      $$DbSamplesTableOrderingComposer,
      $$DbSamplesTableAnnotationComposer,
      $$DbSamplesTableCreateCompanionBuilder,
      $$DbSamplesTableUpdateCompanionBuilder,
      (DbSample, BaseReferences<_$AppDatabase, $DbSamplesTable, DbSample>),
      DbSample,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DbSamplesTableTableManager get dbSamples =>
      $$DbSamplesTableTableManager(_db, _db.dbSamples);
}
