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

class $DbProductsTable extends DbProducts
    with TableInfo<$DbProductsTable, DbProduct> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbProductsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
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
    icon,
    isActive,
    serverVersion,
    isDirty,
    isDeleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_products';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbProduct> instance, {
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
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
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
  DbProduct map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbProduct(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
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
  $DbProductsTable createAlias(String alias) {
    return $DbProductsTable(attachedDatabase, alias);
  }
}

class DbProduct extends DataClass implements Insertable<DbProduct> {
  final String id;
  final String name;
  final String icon;
  final bool isActive;
  final double serverVersion;
  final bool isDirty;
  final bool isDeleted;
  const DbProduct({
    required this.id,
    required this.name,
    required this.icon,
    required this.isActive,
    required this.serverVersion,
    required this.isDirty,
    required this.isDeleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['icon'] = Variable<String>(icon);
    map['is_active'] = Variable<bool>(isActive);
    map['server_version'] = Variable<double>(serverVersion);
    map['is_dirty'] = Variable<bool>(isDirty);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  DbProductsCompanion toCompanion(bool nullToAbsent) {
    return DbProductsCompanion(
      id: Value(id),
      name: Value(name),
      icon: Value(icon),
      isActive: Value(isActive),
      serverVersion: Value(serverVersion),
      isDirty: Value(isDirty),
      isDeleted: Value(isDeleted),
    );
  }

  factory DbProduct.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbProduct(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      icon: serializer.fromJson<String>(json['icon']),
      isActive: serializer.fromJson<bool>(json['isActive']),
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
      'icon': serializer.toJson<String>(icon),
      'isActive': serializer.toJson<bool>(isActive),
      'serverVersion': serializer.toJson<double>(serverVersion),
      'isDirty': serializer.toJson<bool>(isDirty),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  DbProduct copyWith({
    String? id,
    String? name,
    String? icon,
    bool? isActive,
    double? serverVersion,
    bool? isDirty,
    bool? isDeleted,
  }) => DbProduct(
    id: id ?? this.id,
    name: name ?? this.name,
    icon: icon ?? this.icon,
    isActive: isActive ?? this.isActive,
    serverVersion: serverVersion ?? this.serverVersion,
    isDirty: isDirty ?? this.isDirty,
    isDeleted: isDeleted ?? this.isDeleted,
  );
  DbProduct copyWithCompanion(DbProductsCompanion data) {
    return DbProduct(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      icon: data.icon.present ? data.icon.value : this.icon,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      serverVersion: data.serverVersion.present
          ? data.serverVersion.value
          : this.serverVersion,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbProduct(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('isActive: $isActive, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('isDirty: $isDirty, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, icon, isActive, serverVersion, isDirty, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbProduct &&
          other.id == this.id &&
          other.name == this.name &&
          other.icon == this.icon &&
          other.isActive == this.isActive &&
          other.serverVersion == this.serverVersion &&
          other.isDirty == this.isDirty &&
          other.isDeleted == this.isDeleted);
}

class DbProductsCompanion extends UpdateCompanion<DbProduct> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> icon;
  final Value<bool> isActive;
  final Value<double> serverVersion;
  final Value<bool> isDirty;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const DbProductsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.isActive = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbProductsCompanion.insert({
    required String id,
    required String name,
    required String icon,
    this.isActive = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       icon = Value(icon);
  static Insertable<DbProduct> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? icon,
    Expression<bool>? isActive,
    Expression<double>? serverVersion,
    Expression<bool>? isDirty,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (isActive != null) 'is_active': isActive,
      if (serverVersion != null) 'server_version': serverVersion,
      if (isDirty != null) 'is_dirty': isDirty,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbProductsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? icon,
    Value<bool>? isActive,
    Value<double>? serverVersion,
    Value<bool>? isDirty,
    Value<bool>? isDeleted,
    Value<int>? rowid,
  }) {
    return DbProductsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      isActive: isActive ?? this.isActive,
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
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
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
    return (StringBuffer('DbProductsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('isActive: $isActive, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('isDirty: $isDirty, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbSizesTable extends DbSizes with TableInfo<$DbSizesTable, DbSize> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbSizesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _referenceMeta = const VerificationMeta(
    'reference',
  );
  @override
  late final GeneratedColumn<int> reference = GeneratedColumn<int>(
    'reference',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
    reference,
    serverVersion,
    isDirty,
    isDeleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_sizes';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbSize> instance, {
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
    if (data.containsKey('reference')) {
      context.handle(
        _referenceMeta,
        reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta),
      );
    } else if (isInserting) {
      context.missing(_referenceMeta);
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
  DbSize map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbSize(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      reference: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reference'],
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
  $DbSizesTable createAlias(String alias) {
    return $DbSizesTable(attachedDatabase, alias);
  }
}

class DbSize extends DataClass implements Insertable<DbSize> {
  final String id;
  final String name;

  /// Relative magnitude of the size, used to order sizes from smallest to
  /// largest. Seeded with gaps so a Mediano can slot between existing values
  /// without touching them. See `AppSizeReferences`.
  final int reference;
  final double serverVersion;
  final bool isDirty;
  final bool isDeleted;
  const DbSize({
    required this.id,
    required this.name,
    required this.reference,
    required this.serverVersion,
    required this.isDirty,
    required this.isDeleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['reference'] = Variable<int>(reference);
    map['server_version'] = Variable<double>(serverVersion);
    map['is_dirty'] = Variable<bool>(isDirty);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  DbSizesCompanion toCompanion(bool nullToAbsent) {
    return DbSizesCompanion(
      id: Value(id),
      name: Value(name),
      reference: Value(reference),
      serverVersion: Value(serverVersion),
      isDirty: Value(isDirty),
      isDeleted: Value(isDeleted),
    );
  }

  factory DbSize.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbSize(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      reference: serializer.fromJson<int>(json['reference']),
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
      'reference': serializer.toJson<int>(reference),
      'serverVersion': serializer.toJson<double>(serverVersion),
      'isDirty': serializer.toJson<bool>(isDirty),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  DbSize copyWith({
    String? id,
    String? name,
    int? reference,
    double? serverVersion,
    bool? isDirty,
    bool? isDeleted,
  }) => DbSize(
    id: id ?? this.id,
    name: name ?? this.name,
    reference: reference ?? this.reference,
    serverVersion: serverVersion ?? this.serverVersion,
    isDirty: isDirty ?? this.isDirty,
    isDeleted: isDeleted ?? this.isDeleted,
  );
  DbSize copyWithCompanion(DbSizesCompanion data) {
    return DbSize(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      reference: data.reference.present ? data.reference.value : this.reference,
      serverVersion: data.serverVersion.present
          ? data.serverVersion.value
          : this.serverVersion,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbSize(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('reference: $reference, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('isDirty: $isDirty, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, reference, serverVersion, isDirty, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbSize &&
          other.id == this.id &&
          other.name == this.name &&
          other.reference == this.reference &&
          other.serverVersion == this.serverVersion &&
          other.isDirty == this.isDirty &&
          other.isDeleted == this.isDeleted);
}

class DbSizesCompanion extends UpdateCompanion<DbSize> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> reference;
  final Value<double> serverVersion;
  final Value<bool> isDirty;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const DbSizesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.reference = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbSizesCompanion.insert({
    required String id,
    required String name,
    required int reference,
    this.serverVersion = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       reference = Value(reference);
  static Insertable<DbSize> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? reference,
    Expression<double>? serverVersion,
    Expression<bool>? isDirty,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (reference != null) 'reference': reference,
      if (serverVersion != null) 'server_version': serverVersion,
      if (isDirty != null) 'is_dirty': isDirty,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbSizesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? reference,
    Value<double>? serverVersion,
    Value<bool>? isDirty,
    Value<bool>? isDeleted,
    Value<int>? rowid,
  }) {
    return DbSizesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      reference: reference ?? this.reference,
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
    if (reference.present) {
      map['reference'] = Variable<int>(reference.value);
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
    return (StringBuffer('DbSizesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('reference: $reference, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('isDirty: $isDirty, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbFlavorsTable extends DbFlavors
    with TableInfo<$DbFlavorsTable, DbFlavor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbFlavorsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
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
    icon,
    serverVersion,
    isDirty,
    isDeleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_flavors';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbFlavor> instance, {
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
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    } else if (isInserting) {
      context.missing(_iconMeta);
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
  DbFlavor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbFlavor(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
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
  $DbFlavorsTable createAlias(String alias) {
    return $DbFlavorsTable(attachedDatabase, alias);
  }
}

class DbFlavor extends DataClass implements Insertable<DbFlavor> {
  final String id;
  final String name;
  final String icon;
  final double serverVersion;
  final bool isDirty;
  final bool isDeleted;
  const DbFlavor({
    required this.id,
    required this.name,
    required this.icon,
    required this.serverVersion,
    required this.isDirty,
    required this.isDeleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['icon'] = Variable<String>(icon);
    map['server_version'] = Variable<double>(serverVersion);
    map['is_dirty'] = Variable<bool>(isDirty);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  DbFlavorsCompanion toCompanion(bool nullToAbsent) {
    return DbFlavorsCompanion(
      id: Value(id),
      name: Value(name),
      icon: Value(icon),
      serverVersion: Value(serverVersion),
      isDirty: Value(isDirty),
      isDeleted: Value(isDeleted),
    );
  }

  factory DbFlavor.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbFlavor(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      icon: serializer.fromJson<String>(json['icon']),
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
      'icon': serializer.toJson<String>(icon),
      'serverVersion': serializer.toJson<double>(serverVersion),
      'isDirty': serializer.toJson<bool>(isDirty),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  DbFlavor copyWith({
    String? id,
    String? name,
    String? icon,
    double? serverVersion,
    bool? isDirty,
    bool? isDeleted,
  }) => DbFlavor(
    id: id ?? this.id,
    name: name ?? this.name,
    icon: icon ?? this.icon,
    serverVersion: serverVersion ?? this.serverVersion,
    isDirty: isDirty ?? this.isDirty,
    isDeleted: isDeleted ?? this.isDeleted,
  );
  DbFlavor copyWithCompanion(DbFlavorsCompanion data) {
    return DbFlavor(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      icon: data.icon.present ? data.icon.value : this.icon,
      serverVersion: data.serverVersion.present
          ? data.serverVersion.value
          : this.serverVersion,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbFlavor(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('isDirty: $isDirty, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, icon, serverVersion, isDirty, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbFlavor &&
          other.id == this.id &&
          other.name == this.name &&
          other.icon == this.icon &&
          other.serverVersion == this.serverVersion &&
          other.isDirty == this.isDirty &&
          other.isDeleted == this.isDeleted);
}

class DbFlavorsCompanion extends UpdateCompanion<DbFlavor> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> icon;
  final Value<double> serverVersion;
  final Value<bool> isDirty;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const DbFlavorsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbFlavorsCompanion.insert({
    required String id,
    required String name,
    required String icon,
    this.serverVersion = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       icon = Value(icon);
  static Insertable<DbFlavor> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? icon,
    Expression<double>? serverVersion,
    Expression<bool>? isDirty,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (serverVersion != null) 'server_version': serverVersion,
      if (isDirty != null) 'is_dirty': isDirty,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbFlavorsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? icon,
    Value<double>? serverVersion,
    Value<bool>? isDirty,
    Value<bool>? isDeleted,
    Value<int>? rowid,
  }) {
    return DbFlavorsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
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
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
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
    return (StringBuffer('DbFlavorsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('isDirty: $isDirty, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbProductVariantsTable extends DbProductVariants
    with TableInfo<$DbProductVariantsTable, DbProductVariant> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbProductVariantsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES db_products (id)',
    ),
  );
  static const VerificationMeta _sizeIdMeta = const VerificationMeta('sizeId');
  @override
  late final GeneratedColumn<String> sizeId = GeneratedColumn<String>(
    'size_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES db_sizes (id)',
    ),
  );
  static const VerificationMeta _flavorIdMeta = const VerificationMeta(
    'flavorId',
  );
  @override
  late final GeneratedColumn<String> flavorId = GeneratedColumn<String>(
    'flavor_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES db_flavors (id)',
    ),
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
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
    productId,
    sizeId,
    flavorId,
    price,
    isActive,
    serverVersion,
    isDirty,
    isDeleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_product_variants';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbProductVariant> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('size_id')) {
      context.handle(
        _sizeIdMeta,
        sizeId.isAcceptableOrUnknown(data['size_id']!, _sizeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sizeIdMeta);
    }
    if (data.containsKey('flavor_id')) {
      context.handle(
        _flavorIdMeta,
        flavorId.isAcceptableOrUnknown(data['flavor_id']!, _flavorIdMeta),
      );
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
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
  DbProductVariant map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbProductVariant(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      sizeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}size_id'],
      )!,
      flavorId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}flavor_id'],
      ),
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
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
  $DbProductVariantsTable createAlias(String alias) {
    return $DbProductVariantsTable(attachedDatabase, alias);
  }
}

class DbProductVariant extends DataClass
    implements Insertable<DbProductVariant> {
  final String id;
  final String productId;
  final String sizeId;

  /// Null for products with no flavor axis (fresas con crema).
  final String? flavorId;

  /// Cents of Bs.
  final int price;
  final bool isActive;
  final double serverVersion;
  final bool isDirty;
  final bool isDeleted;
  const DbProductVariant({
    required this.id,
    required this.productId,
    required this.sizeId,
    this.flavorId,
    required this.price,
    required this.isActive,
    required this.serverVersion,
    required this.isDirty,
    required this.isDeleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['product_id'] = Variable<String>(productId);
    map['size_id'] = Variable<String>(sizeId);
    if (!nullToAbsent || flavorId != null) {
      map['flavor_id'] = Variable<String>(flavorId);
    }
    map['price'] = Variable<int>(price);
    map['is_active'] = Variable<bool>(isActive);
    map['server_version'] = Variable<double>(serverVersion);
    map['is_dirty'] = Variable<bool>(isDirty);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  DbProductVariantsCompanion toCompanion(bool nullToAbsent) {
    return DbProductVariantsCompanion(
      id: Value(id),
      productId: Value(productId),
      sizeId: Value(sizeId),
      flavorId: flavorId == null && nullToAbsent
          ? const Value.absent()
          : Value(flavorId),
      price: Value(price),
      isActive: Value(isActive),
      serverVersion: Value(serverVersion),
      isDirty: Value(isDirty),
      isDeleted: Value(isDeleted),
    );
  }

  factory DbProductVariant.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbProductVariant(
      id: serializer.fromJson<String>(json['id']),
      productId: serializer.fromJson<String>(json['productId']),
      sizeId: serializer.fromJson<String>(json['sizeId']),
      flavorId: serializer.fromJson<String?>(json['flavorId']),
      price: serializer.fromJson<int>(json['price']),
      isActive: serializer.fromJson<bool>(json['isActive']),
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
      'productId': serializer.toJson<String>(productId),
      'sizeId': serializer.toJson<String>(sizeId),
      'flavorId': serializer.toJson<String?>(flavorId),
      'price': serializer.toJson<int>(price),
      'isActive': serializer.toJson<bool>(isActive),
      'serverVersion': serializer.toJson<double>(serverVersion),
      'isDirty': serializer.toJson<bool>(isDirty),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  DbProductVariant copyWith({
    String? id,
    String? productId,
    String? sizeId,
    Value<String?> flavorId = const Value.absent(),
    int? price,
    bool? isActive,
    double? serverVersion,
    bool? isDirty,
    bool? isDeleted,
  }) => DbProductVariant(
    id: id ?? this.id,
    productId: productId ?? this.productId,
    sizeId: sizeId ?? this.sizeId,
    flavorId: flavorId.present ? flavorId.value : this.flavorId,
    price: price ?? this.price,
    isActive: isActive ?? this.isActive,
    serverVersion: serverVersion ?? this.serverVersion,
    isDirty: isDirty ?? this.isDirty,
    isDeleted: isDeleted ?? this.isDeleted,
  );
  DbProductVariant copyWithCompanion(DbProductVariantsCompanion data) {
    return DbProductVariant(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      sizeId: data.sizeId.present ? data.sizeId.value : this.sizeId,
      flavorId: data.flavorId.present ? data.flavorId.value : this.flavorId,
      price: data.price.present ? data.price.value : this.price,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      serverVersion: data.serverVersion.present
          ? data.serverVersion.value
          : this.serverVersion,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbProductVariant(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('sizeId: $sizeId, ')
          ..write('flavorId: $flavorId, ')
          ..write('price: $price, ')
          ..write('isActive: $isActive, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('isDirty: $isDirty, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    productId,
    sizeId,
    flavorId,
    price,
    isActive,
    serverVersion,
    isDirty,
    isDeleted,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbProductVariant &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.sizeId == this.sizeId &&
          other.flavorId == this.flavorId &&
          other.price == this.price &&
          other.isActive == this.isActive &&
          other.serverVersion == this.serverVersion &&
          other.isDirty == this.isDirty &&
          other.isDeleted == this.isDeleted);
}

class DbProductVariantsCompanion extends UpdateCompanion<DbProductVariant> {
  final Value<String> id;
  final Value<String> productId;
  final Value<String> sizeId;
  final Value<String?> flavorId;
  final Value<int> price;
  final Value<bool> isActive;
  final Value<double> serverVersion;
  final Value<bool> isDirty;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const DbProductVariantsCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.sizeId = const Value.absent(),
    this.flavorId = const Value.absent(),
    this.price = const Value.absent(),
    this.isActive = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbProductVariantsCompanion.insert({
    required String id,
    required String productId,
    required String sizeId,
    this.flavorId = const Value.absent(),
    required int price,
    this.isActive = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       productId = Value(productId),
       sizeId = Value(sizeId),
       price = Value(price);
  static Insertable<DbProductVariant> custom({
    Expression<String>? id,
    Expression<String>? productId,
    Expression<String>? sizeId,
    Expression<String>? flavorId,
    Expression<int>? price,
    Expression<bool>? isActive,
    Expression<double>? serverVersion,
    Expression<bool>? isDirty,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (sizeId != null) 'size_id': sizeId,
      if (flavorId != null) 'flavor_id': flavorId,
      if (price != null) 'price': price,
      if (isActive != null) 'is_active': isActive,
      if (serverVersion != null) 'server_version': serverVersion,
      if (isDirty != null) 'is_dirty': isDirty,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbProductVariantsCompanion copyWith({
    Value<String>? id,
    Value<String>? productId,
    Value<String>? sizeId,
    Value<String?>? flavorId,
    Value<int>? price,
    Value<bool>? isActive,
    Value<double>? serverVersion,
    Value<bool>? isDirty,
    Value<bool>? isDeleted,
    Value<int>? rowid,
  }) {
    return DbProductVariantsCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      sizeId: sizeId ?? this.sizeId,
      flavorId: flavorId ?? this.flavorId,
      price: price ?? this.price,
      isActive: isActive ?? this.isActive,
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
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (sizeId.present) {
      map['size_id'] = Variable<String>(sizeId.value);
    }
    if (flavorId.present) {
      map['flavor_id'] = Variable<String>(flavorId.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
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
    return (StringBuffer('DbProductVariantsCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('sizeId: $sizeId, ')
          ..write('flavorId: $flavorId, ')
          ..write('price: $price, ')
          ..write('isActive: $isActive, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('isDirty: $isDirty, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbExtrasTable extends DbExtras with TableInfo<$DbExtrasTable, DbExtra> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbExtrasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES db_products (id)',
    ),
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
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
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
    productId,
    name,
    price,
    icon,
    isActive,
    serverVersion,
    isDirty,
    isDeleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_extras';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbExtra> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
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
  DbExtra map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbExtra(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
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
  $DbExtrasTable createAlias(String alias) {
    return $DbExtrasTable(attachedDatabase, alias);
  }
}

class DbExtra extends DataClass implements Insertable<DbExtra> {
  final String id;
  final String productId;
  final String name;

  /// Cents of Bs.
  final int price;
  final String icon;
  final bool isActive;
  final double serverVersion;
  final bool isDirty;
  final bool isDeleted;
  const DbExtra({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.icon,
    required this.isActive,
    required this.serverVersion,
    required this.isDirty,
    required this.isDeleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['product_id'] = Variable<String>(productId);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<int>(price);
    map['icon'] = Variable<String>(icon);
    map['is_active'] = Variable<bool>(isActive);
    map['server_version'] = Variable<double>(serverVersion);
    map['is_dirty'] = Variable<bool>(isDirty);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  DbExtrasCompanion toCompanion(bool nullToAbsent) {
    return DbExtrasCompanion(
      id: Value(id),
      productId: Value(productId),
      name: Value(name),
      price: Value(price),
      icon: Value(icon),
      isActive: Value(isActive),
      serverVersion: Value(serverVersion),
      isDirty: Value(isDirty),
      isDeleted: Value(isDeleted),
    );
  }

  factory DbExtra.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbExtra(
      id: serializer.fromJson<String>(json['id']),
      productId: serializer.fromJson<String>(json['productId']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<int>(json['price']),
      icon: serializer.fromJson<String>(json['icon']),
      isActive: serializer.fromJson<bool>(json['isActive']),
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
      'productId': serializer.toJson<String>(productId),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<int>(price),
      'icon': serializer.toJson<String>(icon),
      'isActive': serializer.toJson<bool>(isActive),
      'serverVersion': serializer.toJson<double>(serverVersion),
      'isDirty': serializer.toJson<bool>(isDirty),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  DbExtra copyWith({
    String? id,
    String? productId,
    String? name,
    int? price,
    String? icon,
    bool? isActive,
    double? serverVersion,
    bool? isDirty,
    bool? isDeleted,
  }) => DbExtra(
    id: id ?? this.id,
    productId: productId ?? this.productId,
    name: name ?? this.name,
    price: price ?? this.price,
    icon: icon ?? this.icon,
    isActive: isActive ?? this.isActive,
    serverVersion: serverVersion ?? this.serverVersion,
    isDirty: isDirty ?? this.isDirty,
    isDeleted: isDeleted ?? this.isDeleted,
  );
  DbExtra copyWithCompanion(DbExtrasCompanion data) {
    return DbExtra(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      icon: data.icon.present ? data.icon.value : this.icon,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      serverVersion: data.serverVersion.present
          ? data.serverVersion.value
          : this.serverVersion,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbExtra(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('icon: $icon, ')
          ..write('isActive: $isActive, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('isDirty: $isDirty, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    productId,
    name,
    price,
    icon,
    isActive,
    serverVersion,
    isDirty,
    isDeleted,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbExtra &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.name == this.name &&
          other.price == this.price &&
          other.icon == this.icon &&
          other.isActive == this.isActive &&
          other.serverVersion == this.serverVersion &&
          other.isDirty == this.isDirty &&
          other.isDeleted == this.isDeleted);
}

class DbExtrasCompanion extends UpdateCompanion<DbExtra> {
  final Value<String> id;
  final Value<String> productId;
  final Value<String> name;
  final Value<int> price;
  final Value<String> icon;
  final Value<bool> isActive;
  final Value<double> serverVersion;
  final Value<bool> isDirty;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const DbExtrasCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.icon = const Value.absent(),
    this.isActive = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbExtrasCompanion.insert({
    required String id,
    required String productId,
    required String name,
    required int price,
    required String icon,
    this.isActive = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       productId = Value(productId),
       name = Value(name),
       price = Value(price),
       icon = Value(icon);
  static Insertable<DbExtra> custom({
    Expression<String>? id,
    Expression<String>? productId,
    Expression<String>? name,
    Expression<int>? price,
    Expression<String>? icon,
    Expression<bool>? isActive,
    Expression<double>? serverVersion,
    Expression<bool>? isDirty,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (icon != null) 'icon': icon,
      if (isActive != null) 'is_active': isActive,
      if (serverVersion != null) 'server_version': serverVersion,
      if (isDirty != null) 'is_dirty': isDirty,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbExtrasCompanion copyWith({
    Value<String>? id,
    Value<String>? productId,
    Value<String>? name,
    Value<int>? price,
    Value<String>? icon,
    Value<bool>? isActive,
    Value<double>? serverVersion,
    Value<bool>? isDirty,
    Value<bool>? isDeleted,
    Value<int>? rowid,
  }) {
    return DbExtrasCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      price: price ?? this.price,
      icon: icon ?? this.icon,
      isActive: isActive ?? this.isActive,
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
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
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
    return (StringBuffer('DbExtrasCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('icon: $icon, ')
          ..write('isActive: $isActive, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('isDirty: $isDirty, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbSalesTable extends DbSales with TableInfo<$DbSalesTable, DbSale> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbSalesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _soldAtMeta = const VerificationMeta('soldAt');
  @override
  late final GeneratedColumn<DateTime> soldAt = GeneratedColumn<DateTime>(
    'sold_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<int> subtotal = GeneratedColumn<int>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
    'total',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
    soldAt,
    subtotal,
    total,
    serverVersion,
    isDirty,
    isDeleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_sales';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbSale> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('sold_at')) {
      context.handle(
        _soldAtMeta,
        soldAt.isAcceptableOrUnknown(data['sold_at']!, _soldAtMeta),
      );
    } else if (isInserting) {
      context.missing(_soldAtMeta);
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMeta);
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
  DbSale map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbSale(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      soldAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}sold_at'],
      )!,
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subtotal'],
      )!,
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total'],
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
  $DbSalesTable createAlias(String alias) {
    return $DbSalesTable(attachedDatabase, alias);
  }
}

class DbSale extends DataClass implements Insertable<DbSale> {
  final String id;
  final DateTime soldAt;

  /// Cents of Bs. What the sale should have cost: the sum of every item line
  /// plus its extras, at the prices snapshotted on those lines.
  final int subtotal;

  /// Cents of Bs. What the seller actually charged. Defaults to [subtotal];
  /// the seller may lower it to give a discount on a large order. The discount
  /// is `subtotal - total` — not stored, always derivable.
  final int total;
  final double serverVersion;
  final bool isDirty;
  final bool isDeleted;
  const DbSale({
    required this.id,
    required this.soldAt,
    required this.subtotal,
    required this.total,
    required this.serverVersion,
    required this.isDirty,
    required this.isDeleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['sold_at'] = Variable<DateTime>(soldAt);
    map['subtotal'] = Variable<int>(subtotal);
    map['total'] = Variable<int>(total);
    map['server_version'] = Variable<double>(serverVersion);
    map['is_dirty'] = Variable<bool>(isDirty);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  DbSalesCompanion toCompanion(bool nullToAbsent) {
    return DbSalesCompanion(
      id: Value(id),
      soldAt: Value(soldAt),
      subtotal: Value(subtotal),
      total: Value(total),
      serverVersion: Value(serverVersion),
      isDirty: Value(isDirty),
      isDeleted: Value(isDeleted),
    );
  }

  factory DbSale.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbSale(
      id: serializer.fromJson<String>(json['id']),
      soldAt: serializer.fromJson<DateTime>(json['soldAt']),
      subtotal: serializer.fromJson<int>(json['subtotal']),
      total: serializer.fromJson<int>(json['total']),
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
      'soldAt': serializer.toJson<DateTime>(soldAt),
      'subtotal': serializer.toJson<int>(subtotal),
      'total': serializer.toJson<int>(total),
      'serverVersion': serializer.toJson<double>(serverVersion),
      'isDirty': serializer.toJson<bool>(isDirty),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  DbSale copyWith({
    String? id,
    DateTime? soldAt,
    int? subtotal,
    int? total,
    double? serverVersion,
    bool? isDirty,
    bool? isDeleted,
  }) => DbSale(
    id: id ?? this.id,
    soldAt: soldAt ?? this.soldAt,
    subtotal: subtotal ?? this.subtotal,
    total: total ?? this.total,
    serverVersion: serverVersion ?? this.serverVersion,
    isDirty: isDirty ?? this.isDirty,
    isDeleted: isDeleted ?? this.isDeleted,
  );
  DbSale copyWithCompanion(DbSalesCompanion data) {
    return DbSale(
      id: data.id.present ? data.id.value : this.id,
      soldAt: data.soldAt.present ? data.soldAt.value : this.soldAt,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      total: data.total.present ? data.total.value : this.total,
      serverVersion: data.serverVersion.present
          ? data.serverVersion.value
          : this.serverVersion,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbSale(')
          ..write('id: $id, ')
          ..write('soldAt: $soldAt, ')
          ..write('subtotal: $subtotal, ')
          ..write('total: $total, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('isDirty: $isDirty, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    soldAt,
    subtotal,
    total,
    serverVersion,
    isDirty,
    isDeleted,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbSale &&
          other.id == this.id &&
          other.soldAt == this.soldAt &&
          other.subtotal == this.subtotal &&
          other.total == this.total &&
          other.serverVersion == this.serverVersion &&
          other.isDirty == this.isDirty &&
          other.isDeleted == this.isDeleted);
}

class DbSalesCompanion extends UpdateCompanion<DbSale> {
  final Value<String> id;
  final Value<DateTime> soldAt;
  final Value<int> subtotal;
  final Value<int> total;
  final Value<double> serverVersion;
  final Value<bool> isDirty;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const DbSalesCompanion({
    this.id = const Value.absent(),
    this.soldAt = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.total = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbSalesCompanion.insert({
    required String id,
    required DateTime soldAt,
    required int subtotal,
    required int total,
    this.serverVersion = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       soldAt = Value(soldAt),
       subtotal = Value(subtotal),
       total = Value(total);
  static Insertable<DbSale> custom({
    Expression<String>? id,
    Expression<DateTime>? soldAt,
    Expression<int>? subtotal,
    Expression<int>? total,
    Expression<double>? serverVersion,
    Expression<bool>? isDirty,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (soldAt != null) 'sold_at': soldAt,
      if (subtotal != null) 'subtotal': subtotal,
      if (total != null) 'total': total,
      if (serverVersion != null) 'server_version': serverVersion,
      if (isDirty != null) 'is_dirty': isDirty,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbSalesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? soldAt,
    Value<int>? subtotal,
    Value<int>? total,
    Value<double>? serverVersion,
    Value<bool>? isDirty,
    Value<bool>? isDeleted,
    Value<int>? rowid,
  }) {
    return DbSalesCompanion(
      id: id ?? this.id,
      soldAt: soldAt ?? this.soldAt,
      subtotal: subtotal ?? this.subtotal,
      total: total ?? this.total,
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
    if (soldAt.present) {
      map['sold_at'] = Variable<DateTime>(soldAt.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<int>(subtotal.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
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
    return (StringBuffer('DbSalesCompanion(')
          ..write('id: $id, ')
          ..write('soldAt: $soldAt, ')
          ..write('subtotal: $subtotal, ')
          ..write('total: $total, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('isDirty: $isDirty, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbSaleItemsTable extends DbSaleItems
    with TableInfo<$DbSaleItemsTable, DbSaleItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbSaleItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _saleIdMeta = const VerificationMeta('saleId');
  @override
  late final GeneratedColumn<String> saleId = GeneratedColumn<String>(
    'sale_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES db_sales (id)',
    ),
  );
  static const VerificationMeta _variantIdMeta = const VerificationMeta(
    'variantId',
  );
  @override
  late final GeneratedColumn<String> variantId = GeneratedColumn<String>(
    'variant_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES db_product_variants (id)',
    ),
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _unitPriceMeta = const VerificationMeta(
    'unitPrice',
  );
  @override
  late final GeneratedColumn<int> unitPrice = GeneratedColumn<int>(
    'unit_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
    saleId,
    variantId,
    quantity,
    unitPrice,
    serverVersion,
    isDirty,
    isDeleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_sale_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbSaleItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('sale_id')) {
      context.handle(
        _saleIdMeta,
        saleId.isAcceptableOrUnknown(data['sale_id']!, _saleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_saleIdMeta);
    }
    if (data.containsKey('variant_id')) {
      context.handle(
        _variantIdMeta,
        variantId.isAcceptableOrUnknown(data['variant_id']!, _variantIdMeta),
      );
    } else if (isInserting) {
      context.missing(_variantIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('unit_price')) {
      context.handle(
        _unitPriceMeta,
        unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
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
  DbSaleItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbSaleItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      saleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sale_id'],
      )!,
      variantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}variant_id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      unitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_price'],
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
  $DbSaleItemsTable createAlias(String alias) {
    return $DbSaleItemsTable(attachedDatabase, alias);
  }
}

class DbSaleItem extends DataClass implements Insertable<DbSaleItem> {
  final String id;
  final String saleId;
  final String variantId;
  final int quantity;

  /// Cents of Bs.
  final int unitPrice;
  final double serverVersion;
  final bool isDirty;
  final bool isDeleted;
  const DbSaleItem({
    required this.id,
    required this.saleId,
    required this.variantId,
    required this.quantity,
    required this.unitPrice,
    required this.serverVersion,
    required this.isDirty,
    required this.isDeleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['sale_id'] = Variable<String>(saleId);
    map['variant_id'] = Variable<String>(variantId);
    map['quantity'] = Variable<int>(quantity);
    map['unit_price'] = Variable<int>(unitPrice);
    map['server_version'] = Variable<double>(serverVersion);
    map['is_dirty'] = Variable<bool>(isDirty);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  DbSaleItemsCompanion toCompanion(bool nullToAbsent) {
    return DbSaleItemsCompanion(
      id: Value(id),
      saleId: Value(saleId),
      variantId: Value(variantId),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      serverVersion: Value(serverVersion),
      isDirty: Value(isDirty),
      isDeleted: Value(isDeleted),
    );
  }

  factory DbSaleItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbSaleItem(
      id: serializer.fromJson<String>(json['id']),
      saleId: serializer.fromJson<String>(json['saleId']),
      variantId: serializer.fromJson<String>(json['variantId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unitPrice: serializer.fromJson<int>(json['unitPrice']),
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
      'saleId': serializer.toJson<String>(saleId),
      'variantId': serializer.toJson<String>(variantId),
      'quantity': serializer.toJson<int>(quantity),
      'unitPrice': serializer.toJson<int>(unitPrice),
      'serverVersion': serializer.toJson<double>(serverVersion),
      'isDirty': serializer.toJson<bool>(isDirty),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  DbSaleItem copyWith({
    String? id,
    String? saleId,
    String? variantId,
    int? quantity,
    int? unitPrice,
    double? serverVersion,
    bool? isDirty,
    bool? isDeleted,
  }) => DbSaleItem(
    id: id ?? this.id,
    saleId: saleId ?? this.saleId,
    variantId: variantId ?? this.variantId,
    quantity: quantity ?? this.quantity,
    unitPrice: unitPrice ?? this.unitPrice,
    serverVersion: serverVersion ?? this.serverVersion,
    isDirty: isDirty ?? this.isDirty,
    isDeleted: isDeleted ?? this.isDeleted,
  );
  DbSaleItem copyWithCompanion(DbSaleItemsCompanion data) {
    return DbSaleItem(
      id: data.id.present ? data.id.value : this.id,
      saleId: data.saleId.present ? data.saleId.value : this.saleId,
      variantId: data.variantId.present ? data.variantId.value : this.variantId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      serverVersion: data.serverVersion.present
          ? data.serverVersion.value
          : this.serverVersion,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbSaleItem(')
          ..write('id: $id, ')
          ..write('saleId: $saleId, ')
          ..write('variantId: $variantId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('isDirty: $isDirty, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    saleId,
    variantId,
    quantity,
    unitPrice,
    serverVersion,
    isDirty,
    isDeleted,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbSaleItem &&
          other.id == this.id &&
          other.saleId == this.saleId &&
          other.variantId == this.variantId &&
          other.quantity == this.quantity &&
          other.unitPrice == this.unitPrice &&
          other.serverVersion == this.serverVersion &&
          other.isDirty == this.isDirty &&
          other.isDeleted == this.isDeleted);
}

class DbSaleItemsCompanion extends UpdateCompanion<DbSaleItem> {
  final Value<String> id;
  final Value<String> saleId;
  final Value<String> variantId;
  final Value<int> quantity;
  final Value<int> unitPrice;
  final Value<double> serverVersion;
  final Value<bool> isDirty;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const DbSaleItemsCompanion({
    this.id = const Value.absent(),
    this.saleId = const Value.absent(),
    this.variantId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbSaleItemsCompanion.insert({
    required String id,
    required String saleId,
    required String variantId,
    this.quantity = const Value.absent(),
    required int unitPrice,
    this.serverVersion = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       saleId = Value(saleId),
       variantId = Value(variantId),
       unitPrice = Value(unitPrice);
  static Insertable<DbSaleItem> custom({
    Expression<String>? id,
    Expression<String>? saleId,
    Expression<String>? variantId,
    Expression<int>? quantity,
    Expression<int>? unitPrice,
    Expression<double>? serverVersion,
    Expression<bool>? isDirty,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (saleId != null) 'sale_id': saleId,
      if (variantId != null) 'variant_id': variantId,
      if (quantity != null) 'quantity': quantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (serverVersion != null) 'server_version': serverVersion,
      if (isDirty != null) 'is_dirty': isDirty,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbSaleItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? saleId,
    Value<String>? variantId,
    Value<int>? quantity,
    Value<int>? unitPrice,
    Value<double>? serverVersion,
    Value<bool>? isDirty,
    Value<bool>? isDeleted,
    Value<int>? rowid,
  }) {
    return DbSaleItemsCompanion(
      id: id ?? this.id,
      saleId: saleId ?? this.saleId,
      variantId: variantId ?? this.variantId,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
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
    if (saleId.present) {
      map['sale_id'] = Variable<String>(saleId.value);
    }
    if (variantId.present) {
      map['variant_id'] = Variable<String>(variantId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<int>(unitPrice.value);
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
    return (StringBuffer('DbSaleItemsCompanion(')
          ..write('id: $id, ')
          ..write('saleId: $saleId, ')
          ..write('variantId: $variantId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('isDirty: $isDirty, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbSaleItemExtrasTable extends DbSaleItemExtras
    with TableInfo<$DbSaleItemExtrasTable, DbSaleItemExtra> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbSaleItemExtrasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _saleItemIdMeta = const VerificationMeta(
    'saleItemId',
  );
  @override
  late final GeneratedColumn<String> saleItemId = GeneratedColumn<String>(
    'sale_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES db_sale_items (id)',
    ),
  );
  static const VerificationMeta _extraIdMeta = const VerificationMeta(
    'extraId',
  );
  @override
  late final GeneratedColumn<String> extraId = GeneratedColumn<String>(
    'extra_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES db_extras (id)',
    ),
  );
  static const VerificationMeta _unitPriceMeta = const VerificationMeta(
    'unitPrice',
  );
  @override
  late final GeneratedColumn<int> unitPrice = GeneratedColumn<int>(
    'unit_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
    saleItemId,
    extraId,
    unitPrice,
    serverVersion,
    isDirty,
    isDeleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_sale_item_extras';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbSaleItemExtra> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('sale_item_id')) {
      context.handle(
        _saleItemIdMeta,
        saleItemId.isAcceptableOrUnknown(
          data['sale_item_id']!,
          _saleItemIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_saleItemIdMeta);
    }
    if (data.containsKey('extra_id')) {
      context.handle(
        _extraIdMeta,
        extraId.isAcceptableOrUnknown(data['extra_id']!, _extraIdMeta),
      );
    } else if (isInserting) {
      context.missing(_extraIdMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(
        _unitPriceMeta,
        unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
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
  DbSaleItemExtra map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbSaleItemExtra(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      saleItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sale_item_id'],
      )!,
      extraId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}extra_id'],
      )!,
      unitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_price'],
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
  $DbSaleItemExtrasTable createAlias(String alias) {
    return $DbSaleItemExtrasTable(attachedDatabase, alias);
  }
}

class DbSaleItemExtra extends DataClass implements Insertable<DbSaleItemExtra> {
  final String id;
  final String saleItemId;
  final String extraId;

  /// Cents of Bs.
  final int unitPrice;
  final double serverVersion;
  final bool isDirty;
  final bool isDeleted;
  const DbSaleItemExtra({
    required this.id,
    required this.saleItemId,
    required this.extraId,
    required this.unitPrice,
    required this.serverVersion,
    required this.isDirty,
    required this.isDeleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['sale_item_id'] = Variable<String>(saleItemId);
    map['extra_id'] = Variable<String>(extraId);
    map['unit_price'] = Variable<int>(unitPrice);
    map['server_version'] = Variable<double>(serverVersion);
    map['is_dirty'] = Variable<bool>(isDirty);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  DbSaleItemExtrasCompanion toCompanion(bool nullToAbsent) {
    return DbSaleItemExtrasCompanion(
      id: Value(id),
      saleItemId: Value(saleItemId),
      extraId: Value(extraId),
      unitPrice: Value(unitPrice),
      serverVersion: Value(serverVersion),
      isDirty: Value(isDirty),
      isDeleted: Value(isDeleted),
    );
  }

  factory DbSaleItemExtra.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbSaleItemExtra(
      id: serializer.fromJson<String>(json['id']),
      saleItemId: serializer.fromJson<String>(json['saleItemId']),
      extraId: serializer.fromJson<String>(json['extraId']),
      unitPrice: serializer.fromJson<int>(json['unitPrice']),
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
      'saleItemId': serializer.toJson<String>(saleItemId),
      'extraId': serializer.toJson<String>(extraId),
      'unitPrice': serializer.toJson<int>(unitPrice),
      'serverVersion': serializer.toJson<double>(serverVersion),
      'isDirty': serializer.toJson<bool>(isDirty),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  DbSaleItemExtra copyWith({
    String? id,
    String? saleItemId,
    String? extraId,
    int? unitPrice,
    double? serverVersion,
    bool? isDirty,
    bool? isDeleted,
  }) => DbSaleItemExtra(
    id: id ?? this.id,
    saleItemId: saleItemId ?? this.saleItemId,
    extraId: extraId ?? this.extraId,
    unitPrice: unitPrice ?? this.unitPrice,
    serverVersion: serverVersion ?? this.serverVersion,
    isDirty: isDirty ?? this.isDirty,
    isDeleted: isDeleted ?? this.isDeleted,
  );
  DbSaleItemExtra copyWithCompanion(DbSaleItemExtrasCompanion data) {
    return DbSaleItemExtra(
      id: data.id.present ? data.id.value : this.id,
      saleItemId: data.saleItemId.present
          ? data.saleItemId.value
          : this.saleItemId,
      extraId: data.extraId.present ? data.extraId.value : this.extraId,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      serverVersion: data.serverVersion.present
          ? data.serverVersion.value
          : this.serverVersion,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbSaleItemExtra(')
          ..write('id: $id, ')
          ..write('saleItemId: $saleItemId, ')
          ..write('extraId: $extraId, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('isDirty: $isDirty, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    saleItemId,
    extraId,
    unitPrice,
    serverVersion,
    isDirty,
    isDeleted,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbSaleItemExtra &&
          other.id == this.id &&
          other.saleItemId == this.saleItemId &&
          other.extraId == this.extraId &&
          other.unitPrice == this.unitPrice &&
          other.serverVersion == this.serverVersion &&
          other.isDirty == this.isDirty &&
          other.isDeleted == this.isDeleted);
}

class DbSaleItemExtrasCompanion extends UpdateCompanion<DbSaleItemExtra> {
  final Value<String> id;
  final Value<String> saleItemId;
  final Value<String> extraId;
  final Value<int> unitPrice;
  final Value<double> serverVersion;
  final Value<bool> isDirty;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const DbSaleItemExtrasCompanion({
    this.id = const Value.absent(),
    this.saleItemId = const Value.absent(),
    this.extraId = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbSaleItemExtrasCompanion.insert({
    required String id,
    required String saleItemId,
    required String extraId,
    required int unitPrice,
    this.serverVersion = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       saleItemId = Value(saleItemId),
       extraId = Value(extraId),
       unitPrice = Value(unitPrice);
  static Insertable<DbSaleItemExtra> custom({
    Expression<String>? id,
    Expression<String>? saleItemId,
    Expression<String>? extraId,
    Expression<int>? unitPrice,
    Expression<double>? serverVersion,
    Expression<bool>? isDirty,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (saleItemId != null) 'sale_item_id': saleItemId,
      if (extraId != null) 'extra_id': extraId,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (serverVersion != null) 'server_version': serverVersion,
      if (isDirty != null) 'is_dirty': isDirty,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbSaleItemExtrasCompanion copyWith({
    Value<String>? id,
    Value<String>? saleItemId,
    Value<String>? extraId,
    Value<int>? unitPrice,
    Value<double>? serverVersion,
    Value<bool>? isDirty,
    Value<bool>? isDeleted,
    Value<int>? rowid,
  }) {
    return DbSaleItemExtrasCompanion(
      id: id ?? this.id,
      saleItemId: saleItemId ?? this.saleItemId,
      extraId: extraId ?? this.extraId,
      unitPrice: unitPrice ?? this.unitPrice,
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
    if (saleItemId.present) {
      map['sale_item_id'] = Variable<String>(saleItemId.value);
    }
    if (extraId.present) {
      map['extra_id'] = Variable<String>(extraId.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<int>(unitPrice.value);
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
    return (StringBuffer('DbSaleItemExtrasCompanion(')
          ..write('id: $id, ')
          ..write('saleItemId: $saleItemId, ')
          ..write('extraId: $extraId, ')
          ..write('unitPrice: $unitPrice, ')
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
  late final $DbProductsTable dbProducts = $DbProductsTable(this);
  late final $DbSizesTable dbSizes = $DbSizesTable(this);
  late final $DbFlavorsTable dbFlavors = $DbFlavorsTable(this);
  late final $DbProductVariantsTable dbProductVariants =
      $DbProductVariantsTable(this);
  late final $DbExtrasTable dbExtras = $DbExtrasTable(this);
  late final $DbSalesTable dbSales = $DbSalesTable(this);
  late final $DbSaleItemsTable dbSaleItems = $DbSaleItemsTable(this);
  late final $DbSaleItemExtrasTable dbSaleItemExtras = $DbSaleItemExtrasTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    dbSamples,
    dbProducts,
    dbSizes,
    dbFlavors,
    dbProductVariants,
    dbExtras,
    dbSales,
    dbSaleItems,
    dbSaleItemExtras,
  ];
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
typedef $$DbProductsTableCreateCompanionBuilder =
    DbProductsCompanion Function({
      required String id,
      required String name,
      required String icon,
      Value<bool> isActive,
      Value<double> serverVersion,
      Value<bool> isDirty,
      Value<bool> isDeleted,
      Value<int> rowid,
    });
typedef $$DbProductsTableUpdateCompanionBuilder =
    DbProductsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> icon,
      Value<bool> isActive,
      Value<double> serverVersion,
      Value<bool> isDirty,
      Value<bool> isDeleted,
      Value<int> rowid,
    });

final class $$DbProductsTableReferences
    extends BaseReferences<_$AppDatabase, $DbProductsTable, DbProduct> {
  $$DbProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DbProductVariantsTable, List<DbProductVariant>>
  _dbProductVariantsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.dbProductVariants,
        aliasName: 'db_products__id__db_product_variants__product_id',
      );

  $$DbProductVariantsTableProcessedTableManager get dbProductVariantsRefs {
    final manager = $$DbProductVariantsTableTableManager(
      $_db,
      $_db.dbProductVariants,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dbProductVariantsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DbExtrasTable, List<DbExtra>> _dbExtrasRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.dbExtras,
    aliasName: 'db_products__id__db_extras__product_id',
  );

  $$DbExtrasTableProcessedTableManager get dbExtrasRefs {
    final manager = $$DbExtrasTableTableManager(
      $_db,
      $_db.dbExtras,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbExtrasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DbProductsTableFilterComposer
    extends Composer<_$AppDatabase, $DbProductsTable> {
  $$DbProductsTableFilterComposer({
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

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
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

  Expression<bool> dbProductVariantsRefs(
    Expression<bool> Function($$DbProductVariantsTableFilterComposer f) f,
  ) {
    final $$DbProductVariantsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbProductVariants,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbProductVariantsTableFilterComposer(
            $db: $db,
            $table: $db.dbProductVariants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dbExtrasRefs(
    Expression<bool> Function($$DbExtrasTableFilterComposer f) f,
  ) {
    final $$DbExtrasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbExtras,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbExtrasTableFilterComposer(
            $db: $db,
            $table: $db.dbExtras,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $DbProductsTable> {
  $$DbProductsTableOrderingComposer({
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

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
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

class $$DbProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbProductsTable> {
  $$DbProductsTableAnnotationComposer({
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

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<double> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  Expression<T> dbProductVariantsRefs<T extends Object>(
    Expression<T> Function($$DbProductVariantsTableAnnotationComposer a) f,
  ) {
    final $$DbProductVariantsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.dbProductVariants,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DbProductVariantsTableAnnotationComposer(
                $db: $db,
                $table: $db.dbProductVariants,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> dbExtrasRefs<T extends Object>(
    Expression<T> Function($$DbExtrasTableAnnotationComposer a) f,
  ) {
    final $$DbExtrasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbExtras,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbExtrasTableAnnotationComposer(
            $db: $db,
            $table: $db.dbExtras,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbProductsTable,
          DbProduct,
          $$DbProductsTableFilterComposer,
          $$DbProductsTableOrderingComposer,
          $$DbProductsTableAnnotationComposer,
          $$DbProductsTableCreateCompanionBuilder,
          $$DbProductsTableUpdateCompanionBuilder,
          (DbProduct, $$DbProductsTableReferences),
          DbProduct,
          PrefetchHooks Function({
            bool dbProductVariantsRefs,
            bool dbExtrasRefs,
          })
        > {
  $$DbProductsTableTableManager(_$AppDatabase db, $DbProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<double> serverVersion = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbProductsCompanion(
                id: id,
                name: name,
                icon: icon,
                isActive: isActive,
                serverVersion: serverVersion,
                isDirty: isDirty,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String icon,
                Value<bool> isActive = const Value.absent(),
                Value<double> serverVersion = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbProductsCompanion.insert(
                id: id,
                name: name,
                icon: icon,
                isActive: isActive,
                serverVersion: serverVersion,
                isDirty: isDirty,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbProductsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({dbProductVariantsRefs = false, dbExtrasRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dbProductVariantsRefs) db.dbProductVariants,
                    if (dbExtrasRefs) db.dbExtras,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dbProductVariantsRefs)
                        await $_getPrefetchedData<
                          DbProduct,
                          $DbProductsTable,
                          DbProductVariant
                        >(
                          currentTable: table,
                          referencedTable: $$DbProductsTableReferences
                              ._dbProductVariantsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).dbProductVariantsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dbExtrasRefs)
                        await $_getPrefetchedData<
                          DbProduct,
                          $DbProductsTable,
                          DbExtra
                        >(
                          currentTable: table,
                          referencedTable: $$DbProductsTableReferences
                              ._dbExtrasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).dbExtrasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DbProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbProductsTable,
      DbProduct,
      $$DbProductsTableFilterComposer,
      $$DbProductsTableOrderingComposer,
      $$DbProductsTableAnnotationComposer,
      $$DbProductsTableCreateCompanionBuilder,
      $$DbProductsTableUpdateCompanionBuilder,
      (DbProduct, $$DbProductsTableReferences),
      DbProduct,
      PrefetchHooks Function({bool dbProductVariantsRefs, bool dbExtrasRefs})
    >;
typedef $$DbSizesTableCreateCompanionBuilder =
    DbSizesCompanion Function({
      required String id,
      required String name,
      required int reference,
      Value<double> serverVersion,
      Value<bool> isDirty,
      Value<bool> isDeleted,
      Value<int> rowid,
    });
typedef $$DbSizesTableUpdateCompanionBuilder =
    DbSizesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> reference,
      Value<double> serverVersion,
      Value<bool> isDirty,
      Value<bool> isDeleted,
      Value<int> rowid,
    });

final class $$DbSizesTableReferences
    extends BaseReferences<_$AppDatabase, $DbSizesTable, DbSize> {
  $$DbSizesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DbProductVariantsTable, List<DbProductVariant>>
  _dbProductVariantsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.dbProductVariants,
        aliasName: 'db_sizes__id__db_product_variants__size_id',
      );

  $$DbProductVariantsTableProcessedTableManager get dbProductVariantsRefs {
    final manager = $$DbProductVariantsTableTableManager(
      $_db,
      $_db.dbProductVariants,
    ).filter((f) => f.sizeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dbProductVariantsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DbSizesTableFilterComposer
    extends Composer<_$AppDatabase, $DbSizesTable> {
  $$DbSizesTableFilterComposer({
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

  ColumnFilters<int> get reference => $composableBuilder(
    column: $table.reference,
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

  Expression<bool> dbProductVariantsRefs(
    Expression<bool> Function($$DbProductVariantsTableFilterComposer f) f,
  ) {
    final $$DbProductVariantsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbProductVariants,
      getReferencedColumn: (t) => t.sizeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbProductVariantsTableFilterComposer(
            $db: $db,
            $table: $db.dbProductVariants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbSizesTableOrderingComposer
    extends Composer<_$AppDatabase, $DbSizesTable> {
  $$DbSizesTableOrderingComposer({
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

  ColumnOrderings<int> get reference => $composableBuilder(
    column: $table.reference,
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

class $$DbSizesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbSizesTable> {
  $$DbSizesTableAnnotationComposer({
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

  GeneratedColumn<int> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<double> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  Expression<T> dbProductVariantsRefs<T extends Object>(
    Expression<T> Function($$DbProductVariantsTableAnnotationComposer a) f,
  ) {
    final $$DbProductVariantsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.dbProductVariants,
          getReferencedColumn: (t) => t.sizeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DbProductVariantsTableAnnotationComposer(
                $db: $db,
                $table: $db.dbProductVariants,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$DbSizesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbSizesTable,
          DbSize,
          $$DbSizesTableFilterComposer,
          $$DbSizesTableOrderingComposer,
          $$DbSizesTableAnnotationComposer,
          $$DbSizesTableCreateCompanionBuilder,
          $$DbSizesTableUpdateCompanionBuilder,
          (DbSize, $$DbSizesTableReferences),
          DbSize,
          PrefetchHooks Function({bool dbProductVariantsRefs})
        > {
  $$DbSizesTableTableManager(_$AppDatabase db, $DbSizesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbSizesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbSizesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbSizesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> reference = const Value.absent(),
                Value<double> serverVersion = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbSizesCompanion(
                id: id,
                name: name,
                reference: reference,
                serverVersion: serverVersion,
                isDirty: isDirty,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required int reference,
                Value<double> serverVersion = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbSizesCompanion.insert(
                id: id,
                name: name,
                reference: reference,
                serverVersion: serverVersion,
                isDirty: isDirty,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbSizesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dbProductVariantsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (dbProductVariantsRefs) db.dbProductVariants,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dbProductVariantsRefs)
                    await $_getPrefetchedData<
                      DbSize,
                      $DbSizesTable,
                      DbProductVariant
                    >(
                      currentTable: table,
                      referencedTable: $$DbSizesTableReferences
                          ._dbProductVariantsRefsTable(db),
                      managerFromTypedResult: (p0) => $$DbSizesTableReferences(
                        db,
                        table,
                        p0,
                      ).dbProductVariantsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.sizeId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DbSizesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbSizesTable,
      DbSize,
      $$DbSizesTableFilterComposer,
      $$DbSizesTableOrderingComposer,
      $$DbSizesTableAnnotationComposer,
      $$DbSizesTableCreateCompanionBuilder,
      $$DbSizesTableUpdateCompanionBuilder,
      (DbSize, $$DbSizesTableReferences),
      DbSize,
      PrefetchHooks Function({bool dbProductVariantsRefs})
    >;
typedef $$DbFlavorsTableCreateCompanionBuilder =
    DbFlavorsCompanion Function({
      required String id,
      required String name,
      required String icon,
      Value<double> serverVersion,
      Value<bool> isDirty,
      Value<bool> isDeleted,
      Value<int> rowid,
    });
typedef $$DbFlavorsTableUpdateCompanionBuilder =
    DbFlavorsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> icon,
      Value<double> serverVersion,
      Value<bool> isDirty,
      Value<bool> isDeleted,
      Value<int> rowid,
    });

final class $$DbFlavorsTableReferences
    extends BaseReferences<_$AppDatabase, $DbFlavorsTable, DbFlavor> {
  $$DbFlavorsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DbProductVariantsTable, List<DbProductVariant>>
  _dbProductVariantsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.dbProductVariants,
        aliasName: 'db_flavors__id__db_product_variants__flavor_id',
      );

  $$DbProductVariantsTableProcessedTableManager get dbProductVariantsRefs {
    final manager = $$DbProductVariantsTableTableManager(
      $_db,
      $_db.dbProductVariants,
    ).filter((f) => f.flavorId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dbProductVariantsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DbFlavorsTableFilterComposer
    extends Composer<_$AppDatabase, $DbFlavorsTable> {
  $$DbFlavorsTableFilterComposer({
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

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
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

  Expression<bool> dbProductVariantsRefs(
    Expression<bool> Function($$DbProductVariantsTableFilterComposer f) f,
  ) {
    final $$DbProductVariantsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbProductVariants,
      getReferencedColumn: (t) => t.flavorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbProductVariantsTableFilterComposer(
            $db: $db,
            $table: $db.dbProductVariants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbFlavorsTableOrderingComposer
    extends Composer<_$AppDatabase, $DbFlavorsTable> {
  $$DbFlavorsTableOrderingComposer({
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

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
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

class $$DbFlavorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbFlavorsTable> {
  $$DbFlavorsTableAnnotationComposer({
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

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<double> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  Expression<T> dbProductVariantsRefs<T extends Object>(
    Expression<T> Function($$DbProductVariantsTableAnnotationComposer a) f,
  ) {
    final $$DbProductVariantsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.dbProductVariants,
          getReferencedColumn: (t) => t.flavorId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DbProductVariantsTableAnnotationComposer(
                $db: $db,
                $table: $db.dbProductVariants,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$DbFlavorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbFlavorsTable,
          DbFlavor,
          $$DbFlavorsTableFilterComposer,
          $$DbFlavorsTableOrderingComposer,
          $$DbFlavorsTableAnnotationComposer,
          $$DbFlavorsTableCreateCompanionBuilder,
          $$DbFlavorsTableUpdateCompanionBuilder,
          (DbFlavor, $$DbFlavorsTableReferences),
          DbFlavor,
          PrefetchHooks Function({bool dbProductVariantsRefs})
        > {
  $$DbFlavorsTableTableManager(_$AppDatabase db, $DbFlavorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbFlavorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbFlavorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbFlavorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<double> serverVersion = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbFlavorsCompanion(
                id: id,
                name: name,
                icon: icon,
                serverVersion: serverVersion,
                isDirty: isDirty,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String icon,
                Value<double> serverVersion = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbFlavorsCompanion.insert(
                id: id,
                name: name,
                icon: icon,
                serverVersion: serverVersion,
                isDirty: isDirty,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbFlavorsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dbProductVariantsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (dbProductVariantsRefs) db.dbProductVariants,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dbProductVariantsRefs)
                    await $_getPrefetchedData<
                      DbFlavor,
                      $DbFlavorsTable,
                      DbProductVariant
                    >(
                      currentTable: table,
                      referencedTable: $$DbFlavorsTableReferences
                          ._dbProductVariantsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$DbFlavorsTableReferences(
                            db,
                            table,
                            p0,
                          ).dbProductVariantsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.flavorId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DbFlavorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbFlavorsTable,
      DbFlavor,
      $$DbFlavorsTableFilterComposer,
      $$DbFlavorsTableOrderingComposer,
      $$DbFlavorsTableAnnotationComposer,
      $$DbFlavorsTableCreateCompanionBuilder,
      $$DbFlavorsTableUpdateCompanionBuilder,
      (DbFlavor, $$DbFlavorsTableReferences),
      DbFlavor,
      PrefetchHooks Function({bool dbProductVariantsRefs})
    >;
typedef $$DbProductVariantsTableCreateCompanionBuilder =
    DbProductVariantsCompanion Function({
      required String id,
      required String productId,
      required String sizeId,
      Value<String?> flavorId,
      required int price,
      Value<bool> isActive,
      Value<double> serverVersion,
      Value<bool> isDirty,
      Value<bool> isDeleted,
      Value<int> rowid,
    });
typedef $$DbProductVariantsTableUpdateCompanionBuilder =
    DbProductVariantsCompanion Function({
      Value<String> id,
      Value<String> productId,
      Value<String> sizeId,
      Value<String?> flavorId,
      Value<int> price,
      Value<bool> isActive,
      Value<double> serverVersion,
      Value<bool> isDirty,
      Value<bool> isDeleted,
      Value<int> rowid,
    });

final class $$DbProductVariantsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DbProductVariantsTable,
          DbProductVariant
        > {
  $$DbProductVariantsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DbProductsTable _productIdTable(_$AppDatabase db) => db.dbProducts
      .createAlias('db_product_variants__product_id__db_products__id');

  $$DbProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$DbProductsTableTableManager(
      $_db,
      $_db.dbProducts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DbSizesTable _sizeIdTable(_$AppDatabase db) =>
      db.dbSizes.createAlias('db_product_variants__size_id__db_sizes__id');

  $$DbSizesTableProcessedTableManager get sizeId {
    final $_column = $_itemColumn<String>('size_id')!;

    final manager = $$DbSizesTableTableManager(
      $_db,
      $_db.dbSizes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sizeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DbFlavorsTable _flavorIdTable(_$AppDatabase db) => db.dbFlavors
      .createAlias('db_product_variants__flavor_id__db_flavors__id');

  $$DbFlavorsTableProcessedTableManager? get flavorId {
    final $_column = $_itemColumn<String>('flavor_id');
    if ($_column == null) return null;
    final manager = $$DbFlavorsTableTableManager(
      $_db,
      $_db.dbFlavors,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_flavorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DbSaleItemsTable, List<DbSaleItem>>
  _dbSaleItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbSaleItems,
    aliasName: 'db_product_variants__id__db_sale_items__variant_id',
  );

  $$DbSaleItemsTableProcessedTableManager get dbSaleItemsRefs {
    final manager = $$DbSaleItemsTableTableManager(
      $_db,
      $_db.dbSaleItems,
    ).filter((f) => f.variantId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbSaleItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DbProductVariantsTableFilterComposer
    extends Composer<_$AppDatabase, $DbProductVariantsTable> {
  $$DbProductVariantsTableFilterComposer({
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

  ColumnFilters<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
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

  $$DbProductsTableFilterComposer get productId {
    final $$DbProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.dbProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbProductsTableFilterComposer(
            $db: $db,
            $table: $db.dbProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbSizesTableFilterComposer get sizeId {
    final $$DbSizesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sizeId,
      referencedTable: $db.dbSizes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSizesTableFilterComposer(
            $db: $db,
            $table: $db.dbSizes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbFlavorsTableFilterComposer get flavorId {
    final $$DbFlavorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.flavorId,
      referencedTable: $db.dbFlavors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbFlavorsTableFilterComposer(
            $db: $db,
            $table: $db.dbFlavors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> dbSaleItemsRefs(
    Expression<bool> Function($$DbSaleItemsTableFilterComposer f) f,
  ) {
    final $$DbSaleItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbSaleItems,
      getReferencedColumn: (t) => t.variantId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSaleItemsTableFilterComposer(
            $db: $db,
            $table: $db.dbSaleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbProductVariantsTableOrderingComposer
    extends Composer<_$AppDatabase, $DbProductVariantsTable> {
  $$DbProductVariantsTableOrderingComposer({
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

  ColumnOrderings<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
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

  $$DbProductsTableOrderingComposer get productId {
    final $$DbProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.dbProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbProductsTableOrderingComposer(
            $db: $db,
            $table: $db.dbProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbSizesTableOrderingComposer get sizeId {
    final $$DbSizesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sizeId,
      referencedTable: $db.dbSizes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSizesTableOrderingComposer(
            $db: $db,
            $table: $db.dbSizes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbFlavorsTableOrderingComposer get flavorId {
    final $$DbFlavorsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.flavorId,
      referencedTable: $db.dbFlavors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbFlavorsTableOrderingComposer(
            $db: $db,
            $table: $db.dbFlavors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbProductVariantsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbProductVariantsTable> {
  $$DbProductVariantsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<double> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  $$DbProductsTableAnnotationComposer get productId {
    final $$DbProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.dbProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbSizesTableAnnotationComposer get sizeId {
    final $$DbSizesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sizeId,
      referencedTable: $db.dbSizes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSizesTableAnnotationComposer(
            $db: $db,
            $table: $db.dbSizes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbFlavorsTableAnnotationComposer get flavorId {
    final $$DbFlavorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.flavorId,
      referencedTable: $db.dbFlavors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbFlavorsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbFlavors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> dbSaleItemsRefs<T extends Object>(
    Expression<T> Function($$DbSaleItemsTableAnnotationComposer a) f,
  ) {
    final $$DbSaleItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbSaleItems,
      getReferencedColumn: (t) => t.variantId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSaleItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbSaleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbProductVariantsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbProductVariantsTable,
          DbProductVariant,
          $$DbProductVariantsTableFilterComposer,
          $$DbProductVariantsTableOrderingComposer,
          $$DbProductVariantsTableAnnotationComposer,
          $$DbProductVariantsTableCreateCompanionBuilder,
          $$DbProductVariantsTableUpdateCompanionBuilder,
          (DbProductVariant, $$DbProductVariantsTableReferences),
          DbProductVariant,
          PrefetchHooks Function({
            bool productId,
            bool sizeId,
            bool flavorId,
            bool dbSaleItemsRefs,
          })
        > {
  $$DbProductVariantsTableTableManager(
    _$AppDatabase db,
    $DbProductVariantsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbProductVariantsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbProductVariantsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbProductVariantsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<String> sizeId = const Value.absent(),
                Value<String?> flavorId = const Value.absent(),
                Value<int> price = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<double> serverVersion = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbProductVariantsCompanion(
                id: id,
                productId: productId,
                sizeId: sizeId,
                flavorId: flavorId,
                price: price,
                isActive: isActive,
                serverVersion: serverVersion,
                isDirty: isDirty,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String productId,
                required String sizeId,
                Value<String?> flavorId = const Value.absent(),
                required int price,
                Value<bool> isActive = const Value.absent(),
                Value<double> serverVersion = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbProductVariantsCompanion.insert(
                id: id,
                productId: productId,
                sizeId: sizeId,
                flavorId: flavorId,
                price: price,
                isActive: isActive,
                serverVersion: serverVersion,
                isDirty: isDirty,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbProductVariantsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                productId = false,
                sizeId = false,
                flavorId = false,
                dbSaleItemsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dbSaleItemsRefs) db.dbSaleItems,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (productId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.productId,
                                    referencedTable:
                                        $$DbProductVariantsTableReferences
                                            ._productIdTable(db),
                                    referencedColumn:
                                        $$DbProductVariantsTableReferences
                                            ._productIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (sizeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sizeId,
                                    referencedTable:
                                        $$DbProductVariantsTableReferences
                                            ._sizeIdTable(db),
                                    referencedColumn:
                                        $$DbProductVariantsTableReferences
                                            ._sizeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (flavorId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.flavorId,
                                    referencedTable:
                                        $$DbProductVariantsTableReferences
                                            ._flavorIdTable(db),
                                    referencedColumn:
                                        $$DbProductVariantsTableReferences
                                            ._flavorIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dbSaleItemsRefs)
                        await $_getPrefetchedData<
                          DbProductVariant,
                          $DbProductVariantsTable,
                          DbSaleItem
                        >(
                          currentTable: table,
                          referencedTable: $$DbProductVariantsTableReferences
                              ._dbSaleItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbProductVariantsTableReferences(
                                db,
                                table,
                                p0,
                              ).dbSaleItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.variantId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DbProductVariantsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbProductVariantsTable,
      DbProductVariant,
      $$DbProductVariantsTableFilterComposer,
      $$DbProductVariantsTableOrderingComposer,
      $$DbProductVariantsTableAnnotationComposer,
      $$DbProductVariantsTableCreateCompanionBuilder,
      $$DbProductVariantsTableUpdateCompanionBuilder,
      (DbProductVariant, $$DbProductVariantsTableReferences),
      DbProductVariant,
      PrefetchHooks Function({
        bool productId,
        bool sizeId,
        bool flavorId,
        bool dbSaleItemsRefs,
      })
    >;
typedef $$DbExtrasTableCreateCompanionBuilder =
    DbExtrasCompanion Function({
      required String id,
      required String productId,
      required String name,
      required int price,
      required String icon,
      Value<bool> isActive,
      Value<double> serverVersion,
      Value<bool> isDirty,
      Value<bool> isDeleted,
      Value<int> rowid,
    });
typedef $$DbExtrasTableUpdateCompanionBuilder =
    DbExtrasCompanion Function({
      Value<String> id,
      Value<String> productId,
      Value<String> name,
      Value<int> price,
      Value<String> icon,
      Value<bool> isActive,
      Value<double> serverVersion,
      Value<bool> isDirty,
      Value<bool> isDeleted,
      Value<int> rowid,
    });

final class $$DbExtrasTableReferences
    extends BaseReferences<_$AppDatabase, $DbExtrasTable, DbExtra> {
  $$DbExtrasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DbProductsTable _productIdTable(_$AppDatabase db) =>
      db.dbProducts.createAlias('db_extras__product_id__db_products__id');

  $$DbProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$DbProductsTableTableManager(
      $_db,
      $_db.dbProducts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DbSaleItemExtrasTable, List<DbSaleItemExtra>>
  _dbSaleItemExtrasRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbSaleItemExtras,
    aliasName: 'db_extras__id__db_sale_item_extras__extra_id',
  );

  $$DbSaleItemExtrasTableProcessedTableManager get dbSaleItemExtrasRefs {
    final manager = $$DbSaleItemExtrasTableTableManager(
      $_db,
      $_db.dbSaleItemExtras,
    ).filter((f) => f.extraId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dbSaleItemExtrasRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DbExtrasTableFilterComposer
    extends Composer<_$AppDatabase, $DbExtrasTable> {
  $$DbExtrasTableFilterComposer({
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

  ColumnFilters<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
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

  $$DbProductsTableFilterComposer get productId {
    final $$DbProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.dbProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbProductsTableFilterComposer(
            $db: $db,
            $table: $db.dbProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> dbSaleItemExtrasRefs(
    Expression<bool> Function($$DbSaleItemExtrasTableFilterComposer f) f,
  ) {
    final $$DbSaleItemExtrasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbSaleItemExtras,
      getReferencedColumn: (t) => t.extraId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSaleItemExtrasTableFilterComposer(
            $db: $db,
            $table: $db.dbSaleItemExtras,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbExtrasTableOrderingComposer
    extends Composer<_$AppDatabase, $DbExtrasTable> {
  $$DbExtrasTableOrderingComposer({
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

  ColumnOrderings<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
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

  $$DbProductsTableOrderingComposer get productId {
    final $$DbProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.dbProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbProductsTableOrderingComposer(
            $db: $db,
            $table: $db.dbProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbExtrasTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbExtrasTable> {
  $$DbExtrasTableAnnotationComposer({
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

  GeneratedColumn<int> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<double> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  $$DbProductsTableAnnotationComposer get productId {
    final $$DbProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.dbProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> dbSaleItemExtrasRefs<T extends Object>(
    Expression<T> Function($$DbSaleItemExtrasTableAnnotationComposer a) f,
  ) {
    final $$DbSaleItemExtrasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbSaleItemExtras,
      getReferencedColumn: (t) => t.extraId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSaleItemExtrasTableAnnotationComposer(
            $db: $db,
            $table: $db.dbSaleItemExtras,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbExtrasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbExtrasTable,
          DbExtra,
          $$DbExtrasTableFilterComposer,
          $$DbExtrasTableOrderingComposer,
          $$DbExtrasTableAnnotationComposer,
          $$DbExtrasTableCreateCompanionBuilder,
          $$DbExtrasTableUpdateCompanionBuilder,
          (DbExtra, $$DbExtrasTableReferences),
          DbExtra,
          PrefetchHooks Function({bool productId, bool dbSaleItemExtrasRefs})
        > {
  $$DbExtrasTableTableManager(_$AppDatabase db, $DbExtrasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbExtrasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbExtrasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbExtrasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> price = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<double> serverVersion = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbExtrasCompanion(
                id: id,
                productId: productId,
                name: name,
                price: price,
                icon: icon,
                isActive: isActive,
                serverVersion: serverVersion,
                isDirty: isDirty,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String productId,
                required String name,
                required int price,
                required String icon,
                Value<bool> isActive = const Value.absent(),
                Value<double> serverVersion = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbExtrasCompanion.insert(
                id: id,
                productId: productId,
                name: name,
                price: price,
                icon: icon,
                isActive: isActive,
                serverVersion: serverVersion,
                isDirty: isDirty,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbExtrasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({productId = false, dbSaleItemExtrasRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dbSaleItemExtrasRefs) db.dbSaleItemExtras,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (productId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.productId,
                                    referencedTable: $$DbExtrasTableReferences
                                        ._productIdTable(db),
                                    referencedColumn: $$DbExtrasTableReferences
                                        ._productIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dbSaleItemExtrasRefs)
                        await $_getPrefetchedData<
                          DbExtra,
                          $DbExtrasTable,
                          DbSaleItemExtra
                        >(
                          currentTable: table,
                          referencedTable: $$DbExtrasTableReferences
                              ._dbSaleItemExtrasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbExtrasTableReferences(
                                db,
                                table,
                                p0,
                              ).dbSaleItemExtrasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.extraId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DbExtrasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbExtrasTable,
      DbExtra,
      $$DbExtrasTableFilterComposer,
      $$DbExtrasTableOrderingComposer,
      $$DbExtrasTableAnnotationComposer,
      $$DbExtrasTableCreateCompanionBuilder,
      $$DbExtrasTableUpdateCompanionBuilder,
      (DbExtra, $$DbExtrasTableReferences),
      DbExtra,
      PrefetchHooks Function({bool productId, bool dbSaleItemExtrasRefs})
    >;
typedef $$DbSalesTableCreateCompanionBuilder =
    DbSalesCompanion Function({
      required String id,
      required DateTime soldAt,
      required int subtotal,
      required int total,
      Value<double> serverVersion,
      Value<bool> isDirty,
      Value<bool> isDeleted,
      Value<int> rowid,
    });
typedef $$DbSalesTableUpdateCompanionBuilder =
    DbSalesCompanion Function({
      Value<String> id,
      Value<DateTime> soldAt,
      Value<int> subtotal,
      Value<int> total,
      Value<double> serverVersion,
      Value<bool> isDirty,
      Value<bool> isDeleted,
      Value<int> rowid,
    });

final class $$DbSalesTableReferences
    extends BaseReferences<_$AppDatabase, $DbSalesTable, DbSale> {
  $$DbSalesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DbSaleItemsTable, List<DbSaleItem>>
  _dbSaleItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbSaleItems,
    aliasName: 'db_sales__id__db_sale_items__sale_id',
  );

  $$DbSaleItemsTableProcessedTableManager get dbSaleItemsRefs {
    final manager = $$DbSaleItemsTableTableManager(
      $_db,
      $_db.dbSaleItems,
    ).filter((f) => f.saleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbSaleItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DbSalesTableFilterComposer
    extends Composer<_$AppDatabase, $DbSalesTable> {
  $$DbSalesTableFilterComposer({
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

  ColumnFilters<DateTime> get soldAt => $composableBuilder(
    column: $table.soldAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get total => $composableBuilder(
    column: $table.total,
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

  Expression<bool> dbSaleItemsRefs(
    Expression<bool> Function($$DbSaleItemsTableFilterComposer f) f,
  ) {
    final $$DbSaleItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbSaleItems,
      getReferencedColumn: (t) => t.saleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSaleItemsTableFilterComposer(
            $db: $db,
            $table: $db.dbSaleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbSalesTableOrderingComposer
    extends Composer<_$AppDatabase, $DbSalesTable> {
  $$DbSalesTableOrderingComposer({
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

  ColumnOrderings<DateTime> get soldAt => $composableBuilder(
    column: $table.soldAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get total => $composableBuilder(
    column: $table.total,
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

class $$DbSalesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbSalesTable> {
  $$DbSalesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get soldAt =>
      $composableBuilder(column: $table.soldAt, builder: (column) => column);

  GeneratedColumn<int> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<int> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<double> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  Expression<T> dbSaleItemsRefs<T extends Object>(
    Expression<T> Function($$DbSaleItemsTableAnnotationComposer a) f,
  ) {
    final $$DbSaleItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbSaleItems,
      getReferencedColumn: (t) => t.saleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSaleItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbSaleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbSalesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbSalesTable,
          DbSale,
          $$DbSalesTableFilterComposer,
          $$DbSalesTableOrderingComposer,
          $$DbSalesTableAnnotationComposer,
          $$DbSalesTableCreateCompanionBuilder,
          $$DbSalesTableUpdateCompanionBuilder,
          (DbSale, $$DbSalesTableReferences),
          DbSale,
          PrefetchHooks Function({bool dbSaleItemsRefs})
        > {
  $$DbSalesTableTableManager(_$AppDatabase db, $DbSalesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbSalesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbSalesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbSalesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> soldAt = const Value.absent(),
                Value<int> subtotal = const Value.absent(),
                Value<int> total = const Value.absent(),
                Value<double> serverVersion = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbSalesCompanion(
                id: id,
                soldAt: soldAt,
                subtotal: subtotal,
                total: total,
                serverVersion: serverVersion,
                isDirty: isDirty,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime soldAt,
                required int subtotal,
                required int total,
                Value<double> serverVersion = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbSalesCompanion.insert(
                id: id,
                soldAt: soldAt,
                subtotal: subtotal,
                total: total,
                serverVersion: serverVersion,
                isDirty: isDirty,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbSalesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dbSaleItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (dbSaleItemsRefs) db.dbSaleItems],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dbSaleItemsRefs)
                    await $_getPrefetchedData<
                      DbSale,
                      $DbSalesTable,
                      DbSaleItem
                    >(
                      currentTable: table,
                      referencedTable: $$DbSalesTableReferences
                          ._dbSaleItemsRefsTable(db),
                      managerFromTypedResult: (p0) => $$DbSalesTableReferences(
                        db,
                        table,
                        p0,
                      ).dbSaleItemsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.saleId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DbSalesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbSalesTable,
      DbSale,
      $$DbSalesTableFilterComposer,
      $$DbSalesTableOrderingComposer,
      $$DbSalesTableAnnotationComposer,
      $$DbSalesTableCreateCompanionBuilder,
      $$DbSalesTableUpdateCompanionBuilder,
      (DbSale, $$DbSalesTableReferences),
      DbSale,
      PrefetchHooks Function({bool dbSaleItemsRefs})
    >;
typedef $$DbSaleItemsTableCreateCompanionBuilder =
    DbSaleItemsCompanion Function({
      required String id,
      required String saleId,
      required String variantId,
      Value<int> quantity,
      required int unitPrice,
      Value<double> serverVersion,
      Value<bool> isDirty,
      Value<bool> isDeleted,
      Value<int> rowid,
    });
typedef $$DbSaleItemsTableUpdateCompanionBuilder =
    DbSaleItemsCompanion Function({
      Value<String> id,
      Value<String> saleId,
      Value<String> variantId,
      Value<int> quantity,
      Value<int> unitPrice,
      Value<double> serverVersion,
      Value<bool> isDirty,
      Value<bool> isDeleted,
      Value<int> rowid,
    });

final class $$DbSaleItemsTableReferences
    extends BaseReferences<_$AppDatabase, $DbSaleItemsTable, DbSaleItem> {
  $$DbSaleItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DbSalesTable _saleIdTable(_$AppDatabase db) =>
      db.dbSales.createAlias('db_sale_items__sale_id__db_sales__id');

  $$DbSalesTableProcessedTableManager get saleId {
    final $_column = $_itemColumn<String>('sale_id')!;

    final manager = $$DbSalesTableTableManager(
      $_db,
      $_db.dbSales,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_saleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DbProductVariantsTable _variantIdTable(_$AppDatabase db) => db
      .dbProductVariants
      .createAlias('db_sale_items__variant_id__db_product_variants__id');

  $$DbProductVariantsTableProcessedTableManager get variantId {
    final $_column = $_itemColumn<String>('variant_id')!;

    final manager = $$DbProductVariantsTableTableManager(
      $_db,
      $_db.dbProductVariants,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_variantIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DbSaleItemExtrasTable, List<DbSaleItemExtra>>
  _dbSaleItemExtrasRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbSaleItemExtras,
    aliasName: 'db_sale_items__id__db_sale_item_extras__sale_item_id',
  );

  $$DbSaleItemExtrasTableProcessedTableManager get dbSaleItemExtrasRefs {
    final manager = $$DbSaleItemExtrasTableTableManager(
      $_db,
      $_db.dbSaleItemExtras,
    ).filter((f) => f.saleItemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dbSaleItemExtrasRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DbSaleItemsTableFilterComposer
    extends Composer<_$AppDatabase, $DbSaleItemsTable> {
  $$DbSaleItemsTableFilterComposer({
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

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
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

  $$DbSalesTableFilterComposer get saleId {
    final $$DbSalesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.saleId,
      referencedTable: $db.dbSales,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSalesTableFilterComposer(
            $db: $db,
            $table: $db.dbSales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbProductVariantsTableFilterComposer get variantId {
    final $$DbProductVariantsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.variantId,
      referencedTable: $db.dbProductVariants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbProductVariantsTableFilterComposer(
            $db: $db,
            $table: $db.dbProductVariants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> dbSaleItemExtrasRefs(
    Expression<bool> Function($$DbSaleItemExtrasTableFilterComposer f) f,
  ) {
    final $$DbSaleItemExtrasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbSaleItemExtras,
      getReferencedColumn: (t) => t.saleItemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSaleItemExtrasTableFilterComposer(
            $db: $db,
            $table: $db.dbSaleItemExtras,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbSaleItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $DbSaleItemsTable> {
  $$DbSaleItemsTableOrderingComposer({
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

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
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

  $$DbSalesTableOrderingComposer get saleId {
    final $$DbSalesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.saleId,
      referencedTable: $db.dbSales,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSalesTableOrderingComposer(
            $db: $db,
            $table: $db.dbSales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbProductVariantsTableOrderingComposer get variantId {
    final $$DbProductVariantsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.variantId,
      referencedTable: $db.dbProductVariants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbProductVariantsTableOrderingComposer(
            $db: $db,
            $table: $db.dbProductVariants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbSaleItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbSaleItemsTable> {
  $$DbSaleItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<double> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  $$DbSalesTableAnnotationComposer get saleId {
    final $$DbSalesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.saleId,
      referencedTable: $db.dbSales,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSalesTableAnnotationComposer(
            $db: $db,
            $table: $db.dbSales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbProductVariantsTableAnnotationComposer get variantId {
    final $$DbProductVariantsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.variantId,
          referencedTable: $db.dbProductVariants,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DbProductVariantsTableAnnotationComposer(
                $db: $db,
                $table: $db.dbProductVariants,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> dbSaleItemExtrasRefs<T extends Object>(
    Expression<T> Function($$DbSaleItemExtrasTableAnnotationComposer a) f,
  ) {
    final $$DbSaleItemExtrasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbSaleItemExtras,
      getReferencedColumn: (t) => t.saleItemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSaleItemExtrasTableAnnotationComposer(
            $db: $db,
            $table: $db.dbSaleItemExtras,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbSaleItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbSaleItemsTable,
          DbSaleItem,
          $$DbSaleItemsTableFilterComposer,
          $$DbSaleItemsTableOrderingComposer,
          $$DbSaleItemsTableAnnotationComposer,
          $$DbSaleItemsTableCreateCompanionBuilder,
          $$DbSaleItemsTableUpdateCompanionBuilder,
          (DbSaleItem, $$DbSaleItemsTableReferences),
          DbSaleItem,
          PrefetchHooks Function({
            bool saleId,
            bool variantId,
            bool dbSaleItemExtrasRefs,
          })
        > {
  $$DbSaleItemsTableTableManager(_$AppDatabase db, $DbSaleItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbSaleItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbSaleItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbSaleItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> saleId = const Value.absent(),
                Value<String> variantId = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<int> unitPrice = const Value.absent(),
                Value<double> serverVersion = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbSaleItemsCompanion(
                id: id,
                saleId: saleId,
                variantId: variantId,
                quantity: quantity,
                unitPrice: unitPrice,
                serverVersion: serverVersion,
                isDirty: isDirty,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String saleId,
                required String variantId,
                Value<int> quantity = const Value.absent(),
                required int unitPrice,
                Value<double> serverVersion = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbSaleItemsCompanion.insert(
                id: id,
                saleId: saleId,
                variantId: variantId,
                quantity: quantity,
                unitPrice: unitPrice,
                serverVersion: serverVersion,
                isDirty: isDirty,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbSaleItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                saleId = false,
                variantId = false,
                dbSaleItemExtrasRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dbSaleItemExtrasRefs) db.dbSaleItemExtras,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (saleId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.saleId,
                                    referencedTable:
                                        $$DbSaleItemsTableReferences
                                            ._saleIdTable(db),
                                    referencedColumn:
                                        $$DbSaleItemsTableReferences
                                            ._saleIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (variantId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.variantId,
                                    referencedTable:
                                        $$DbSaleItemsTableReferences
                                            ._variantIdTable(db),
                                    referencedColumn:
                                        $$DbSaleItemsTableReferences
                                            ._variantIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dbSaleItemExtrasRefs)
                        await $_getPrefetchedData<
                          DbSaleItem,
                          $DbSaleItemsTable,
                          DbSaleItemExtra
                        >(
                          currentTable: table,
                          referencedTable: $$DbSaleItemsTableReferences
                              ._dbSaleItemExtrasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbSaleItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).dbSaleItemExtrasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.saleItemId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DbSaleItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbSaleItemsTable,
      DbSaleItem,
      $$DbSaleItemsTableFilterComposer,
      $$DbSaleItemsTableOrderingComposer,
      $$DbSaleItemsTableAnnotationComposer,
      $$DbSaleItemsTableCreateCompanionBuilder,
      $$DbSaleItemsTableUpdateCompanionBuilder,
      (DbSaleItem, $$DbSaleItemsTableReferences),
      DbSaleItem,
      PrefetchHooks Function({
        bool saleId,
        bool variantId,
        bool dbSaleItemExtrasRefs,
      })
    >;
typedef $$DbSaleItemExtrasTableCreateCompanionBuilder =
    DbSaleItemExtrasCompanion Function({
      required String id,
      required String saleItemId,
      required String extraId,
      required int unitPrice,
      Value<double> serverVersion,
      Value<bool> isDirty,
      Value<bool> isDeleted,
      Value<int> rowid,
    });
typedef $$DbSaleItemExtrasTableUpdateCompanionBuilder =
    DbSaleItemExtrasCompanion Function({
      Value<String> id,
      Value<String> saleItemId,
      Value<String> extraId,
      Value<int> unitPrice,
      Value<double> serverVersion,
      Value<bool> isDirty,
      Value<bool> isDeleted,
      Value<int> rowid,
    });

final class $$DbSaleItemExtrasTableReferences
    extends
        BaseReferences<_$AppDatabase, $DbSaleItemExtrasTable, DbSaleItemExtra> {
  $$DbSaleItemExtrasTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DbSaleItemsTable _saleItemIdTable(_$AppDatabase db) => db.dbSaleItems
      .createAlias('db_sale_item_extras__sale_item_id__db_sale_items__id');

  $$DbSaleItemsTableProcessedTableManager get saleItemId {
    final $_column = $_itemColumn<String>('sale_item_id')!;

    final manager = $$DbSaleItemsTableTableManager(
      $_db,
      $_db.dbSaleItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_saleItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DbExtrasTable _extraIdTable(_$AppDatabase db) =>
      db.dbExtras.createAlias('db_sale_item_extras__extra_id__db_extras__id');

  $$DbExtrasTableProcessedTableManager get extraId {
    final $_column = $_itemColumn<String>('extra_id')!;

    final manager = $$DbExtrasTableTableManager(
      $_db,
      $_db.dbExtras,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_extraIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DbSaleItemExtrasTableFilterComposer
    extends Composer<_$AppDatabase, $DbSaleItemExtrasTable> {
  $$DbSaleItemExtrasTableFilterComposer({
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

  ColumnFilters<int> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
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

  $$DbSaleItemsTableFilterComposer get saleItemId {
    final $$DbSaleItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.saleItemId,
      referencedTable: $db.dbSaleItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSaleItemsTableFilterComposer(
            $db: $db,
            $table: $db.dbSaleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbExtrasTableFilterComposer get extraId {
    final $$DbExtrasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.extraId,
      referencedTable: $db.dbExtras,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbExtrasTableFilterComposer(
            $db: $db,
            $table: $db.dbExtras,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbSaleItemExtrasTableOrderingComposer
    extends Composer<_$AppDatabase, $DbSaleItemExtrasTable> {
  $$DbSaleItemExtrasTableOrderingComposer({
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

  ColumnOrderings<int> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
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

  $$DbSaleItemsTableOrderingComposer get saleItemId {
    final $$DbSaleItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.saleItemId,
      referencedTable: $db.dbSaleItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSaleItemsTableOrderingComposer(
            $db: $db,
            $table: $db.dbSaleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbExtrasTableOrderingComposer get extraId {
    final $$DbExtrasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.extraId,
      referencedTable: $db.dbExtras,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbExtrasTableOrderingComposer(
            $db: $db,
            $table: $db.dbExtras,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbSaleItemExtrasTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbSaleItemExtrasTable> {
  $$DbSaleItemExtrasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<double> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  $$DbSaleItemsTableAnnotationComposer get saleItemId {
    final $$DbSaleItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.saleItemId,
      referencedTable: $db.dbSaleItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSaleItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbSaleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbExtrasTableAnnotationComposer get extraId {
    final $$DbExtrasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.extraId,
      referencedTable: $db.dbExtras,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbExtrasTableAnnotationComposer(
            $db: $db,
            $table: $db.dbExtras,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbSaleItemExtrasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbSaleItemExtrasTable,
          DbSaleItemExtra,
          $$DbSaleItemExtrasTableFilterComposer,
          $$DbSaleItemExtrasTableOrderingComposer,
          $$DbSaleItemExtrasTableAnnotationComposer,
          $$DbSaleItemExtrasTableCreateCompanionBuilder,
          $$DbSaleItemExtrasTableUpdateCompanionBuilder,
          (DbSaleItemExtra, $$DbSaleItemExtrasTableReferences),
          DbSaleItemExtra,
          PrefetchHooks Function({bool saleItemId, bool extraId})
        > {
  $$DbSaleItemExtrasTableTableManager(
    _$AppDatabase db,
    $DbSaleItemExtrasTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbSaleItemExtrasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbSaleItemExtrasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbSaleItemExtrasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> saleItemId = const Value.absent(),
                Value<String> extraId = const Value.absent(),
                Value<int> unitPrice = const Value.absent(),
                Value<double> serverVersion = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbSaleItemExtrasCompanion(
                id: id,
                saleItemId: saleItemId,
                extraId: extraId,
                unitPrice: unitPrice,
                serverVersion: serverVersion,
                isDirty: isDirty,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String saleItemId,
                required String extraId,
                required int unitPrice,
                Value<double> serverVersion = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbSaleItemExtrasCompanion.insert(
                id: id,
                saleItemId: saleItemId,
                extraId: extraId,
                unitPrice: unitPrice,
                serverVersion: serverVersion,
                isDirty: isDirty,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbSaleItemExtrasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({saleItemId = false, extraId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (saleItemId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.saleItemId,
                                referencedTable:
                                    $$DbSaleItemExtrasTableReferences
                                        ._saleItemIdTable(db),
                                referencedColumn:
                                    $$DbSaleItemExtrasTableReferences
                                        ._saleItemIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (extraId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.extraId,
                                referencedTable:
                                    $$DbSaleItemExtrasTableReferences
                                        ._extraIdTable(db),
                                referencedColumn:
                                    $$DbSaleItemExtrasTableReferences
                                        ._extraIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DbSaleItemExtrasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbSaleItemExtrasTable,
      DbSaleItemExtra,
      $$DbSaleItemExtrasTableFilterComposer,
      $$DbSaleItemExtrasTableOrderingComposer,
      $$DbSaleItemExtrasTableAnnotationComposer,
      $$DbSaleItemExtrasTableCreateCompanionBuilder,
      $$DbSaleItemExtrasTableUpdateCompanionBuilder,
      (DbSaleItemExtra, $$DbSaleItemExtrasTableReferences),
      DbSaleItemExtra,
      PrefetchHooks Function({bool saleItemId, bool extraId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DbSamplesTableTableManager get dbSamples =>
      $$DbSamplesTableTableManager(_db, _db.dbSamples);
  $$DbProductsTableTableManager get dbProducts =>
      $$DbProductsTableTableManager(_db, _db.dbProducts);
  $$DbSizesTableTableManager get dbSizes =>
      $$DbSizesTableTableManager(_db, _db.dbSizes);
  $$DbFlavorsTableTableManager get dbFlavors =>
      $$DbFlavorsTableTableManager(_db, _db.dbFlavors);
  $$DbProductVariantsTableTableManager get dbProductVariants =>
      $$DbProductVariantsTableTableManager(_db, _db.dbProductVariants);
  $$DbExtrasTableTableManager get dbExtras =>
      $$DbExtrasTableTableManager(_db, _db.dbExtras);
  $$DbSalesTableTableManager get dbSales =>
      $$DbSalesTableTableManager(_db, _db.dbSales);
  $$DbSaleItemsTableTableManager get dbSaleItems =>
      $$DbSaleItemsTableTableManager(_db, _db.dbSaleItems);
  $$DbSaleItemExtrasTableTableManager get dbSaleItemExtras =>
      $$DbSaleItemExtrasTableTableManager(_db, _db.dbSaleItemExtras);
}
