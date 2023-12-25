// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class SyncDataTable extends DataClass implements Insertable<SyncDataTable> {
  final int id;
  final String? objectID;
  final String className;
  final String? data;
  final Uint8List? blobImage;
  final DateTime createTime;
  final String action;
  final String? parameter;
  final String? method;
  SyncDataTable(
      {required this.id,
      this.objectID,
      required this.className,
      this.data,
      this.blobImage,
      required this.createTime,
      required this.action,
      this.parameter,
      this.method});
  factory SyncDataTable.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return SyncDataTable(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectID: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}object_i_d']),
      className: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}class_name'])!,
      data: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}data']),
      blobImage: const BlobType()
          .mapFromDatabaseResponse(data['${effectivePrefix}blob_image']),
      createTime: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}create_time'])!,
      action: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}action'])!,
      parameter: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}parameter']),
      method: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}method']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || objectID != null) {
      map['object_i_d'] = Variable<String?>(objectID);
    }
    map['class_name'] = Variable<String>(className);
    if (!nullToAbsent || data != null) {
      map['data'] = Variable<String?>(data);
    }
    if (!nullToAbsent || blobImage != null) {
      map['blob_image'] = Variable<Uint8List?>(blobImage);
    }
    map['create_time'] = Variable<DateTime>(createTime);
    map['action'] = Variable<String>(action);
    if (!nullToAbsent || parameter != null) {
      map['parameter'] = Variable<String?>(parameter);
    }
    if (!nullToAbsent || method != null) {
      map['method'] = Variable<String?>(method);
    }
    return map;
  }

  SyncDatasCompanion toCompanion(bool nullToAbsent) {
    return SyncDatasCompanion(
      id: Value(id),
      objectID: objectID == null && nullToAbsent
          ? const Value.absent()
          : Value(objectID),
      className: Value(className),
      data: data == null && nullToAbsent ? const Value.absent() : Value(data),
      blobImage: blobImage == null && nullToAbsent
          ? const Value.absent()
          : Value(blobImage),
      createTime: Value(createTime),
      action: Value(action),
      parameter: parameter == null && nullToAbsent
          ? const Value.absent()
          : Value(parameter),
      method:
          method == null && nullToAbsent ? const Value.absent() : Value(method),
    );
  }

  factory SyncDataTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncDataTable(
      id: serializer.fromJson<int>(json['id']),
      objectID: serializer.fromJson<String?>(json['objectID']),
      className: serializer.fromJson<String>(json['className']),
      data: serializer.fromJson<String?>(json['data']),
      blobImage: serializer.fromJson<Uint8List?>(json['blobImage']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
      action: serializer.fromJson<String>(json['action']),
      parameter: serializer.fromJson<String?>(json['parameter']),
      method: serializer.fromJson<String?>(json['method']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'objectID': serializer.toJson<String?>(objectID),
      'className': serializer.toJson<String>(className),
      'data': serializer.toJson<String?>(data),
      'blobImage': serializer.toJson<Uint8List?>(blobImage),
      'createTime': serializer.toJson<DateTime>(createTime),
      'action': serializer.toJson<String>(action),
      'parameter': serializer.toJson<String?>(parameter),
      'method': serializer.toJson<String?>(method),
    };
  }

  SyncDataTable copyWith(
          {int? id,
          Value<String?> objectID = const Value.absent(),
          String? className,
          Value<String?> data = const Value.absent(),
          Value<Uint8List?> blobImage = const Value.absent(),
          DateTime? createTime,
          String? action,
          Value<String?> parameter = const Value.absent(),
          Value<String?> method = const Value.absent()}) =>
      SyncDataTable(
        id: id ?? this.id,
        objectID: objectID.present ? objectID.value : this.objectID,
        className: className ?? this.className,
        data: data.present ? data.value : this.data,
        blobImage: blobImage.present ? blobImage.value : this.blobImage,
        createTime: createTime ?? this.createTime,
        action: action ?? this.action,
        parameter: parameter.present ? parameter.value : this.parameter,
        method: method.present ? method.value : this.method,
      );
  @override
  String toString() {
    return (StringBuffer('SyncDataTable(')
          ..write('id: $id, ')
          ..write('objectID: $objectID, ')
          ..write('className: $className, ')
          ..write('data: $data, ')
          ..write('blobImage: $blobImage, ')
          ..write('createTime: $createTime, ')
          ..write('action: $action, ')
          ..write('parameter: $parameter, ')
          ..write('method: $method')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, objectID, className, data, blobImage,
      createTime, action, parameter, method);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncDataTable &&
          other.id == this.id &&
          other.objectID == this.objectID &&
          other.className == this.className &&
          other.data == this.data &&
          other.blobImage == this.blobImage &&
          other.createTime == this.createTime &&
          other.action == this.action &&
          other.parameter == this.parameter &&
          other.method == this.method);
}

class SyncDatasCompanion extends UpdateCompanion<SyncDataTable> {
  final Value<int> id;
  final Value<String?> objectID;
  final Value<String> className;
  final Value<String?> data;
  final Value<Uint8List?> blobImage;
  final Value<DateTime> createTime;
  final Value<String> action;
  final Value<String?> parameter;
  final Value<String?> method;
  const SyncDatasCompanion({
    this.id = const Value.absent(),
    this.objectID = const Value.absent(),
    this.className = const Value.absent(),
    this.data = const Value.absent(),
    this.blobImage = const Value.absent(),
    this.createTime = const Value.absent(),
    this.action = const Value.absent(),
    this.parameter = const Value.absent(),
    this.method = const Value.absent(),
  });
  SyncDatasCompanion.insert({
    this.id = const Value.absent(),
    this.objectID = const Value.absent(),
    required String className,
    this.data = const Value.absent(),
    this.blobImage = const Value.absent(),
    required DateTime createTime,
    required String action,
    this.parameter = const Value.absent(),
    this.method = const Value.absent(),
  })  : className = Value(className),
        createTime = Value(createTime),
        action = Value(action);
  static Insertable<SyncDataTable> custom({
    Expression<int>? id,
    Expression<String?>? objectID,
    Expression<String>? className,
    Expression<String?>? data,
    Expression<Uint8List?>? blobImage,
    Expression<DateTime>? createTime,
    Expression<String>? action,
    Expression<String?>? parameter,
    Expression<String?>? method,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (objectID != null) 'object_i_d': objectID,
      if (className != null) 'class_name': className,
      if (data != null) 'data': data,
      if (blobImage != null) 'blob_image': blobImage,
      if (createTime != null) 'create_time': createTime,
      if (action != null) 'action': action,
      if (parameter != null) 'parameter': parameter,
      if (method != null) 'method': method,
    });
  }

  SyncDatasCompanion copyWith(
      {Value<int>? id,
      Value<String?>? objectID,
      Value<String>? className,
      Value<String?>? data,
      Value<Uint8List?>? blobImage,
      Value<DateTime>? createTime,
      Value<String>? action,
      Value<String?>? parameter,
      Value<String?>? method}) {
    return SyncDatasCompanion(
      id: id ?? this.id,
      objectID: objectID ?? this.objectID,
      className: className ?? this.className,
      data: data ?? this.data,
      blobImage: blobImage ?? this.blobImage,
      createTime: createTime ?? this.createTime,
      action: action ?? this.action,
      parameter: parameter ?? this.parameter,
      method: method ?? this.method,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (objectID.present) {
      map['object_i_d'] = Variable<String?>(objectID.value);
    }
    if (className.present) {
      map['class_name'] = Variable<String>(className.value);
    }
    if (data.present) {
      map['data'] = Variable<String?>(data.value);
    }
    if (blobImage.present) {
      map['blob_image'] = Variable<Uint8List?>(blobImage.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (parameter.present) {
      map['parameter'] = Variable<String?>(parameter.value);
    }
    if (method.present) {
      map['method'] = Variable<String?>(method.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncDatasCompanion(')
          ..write('id: $id, ')
          ..write('objectID: $objectID, ')
          ..write('className: $className, ')
          ..write('data: $data, ')
          ..write('blobImage: $blobImage, ')
          ..write('createTime: $createTime, ')
          ..write('action: $action, ')
          ..write('parameter: $parameter, ')
          ..write('method: $method')
          ..write(')'))
        .toString();
  }
}

class $SyncDatasTable extends SyncDatas
    with TableInfo<$SyncDatasTable, SyncDataTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncDatasTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _objectIDMeta = const VerificationMeta('objectID');
  @override
  late final GeneratedColumn<String?> objectID = GeneratedColumn<String?>(
      'object_i_d', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _classNameMeta = const VerificationMeta('className');
  @override
  late final GeneratedColumn<String?> className = GeneratedColumn<String?>(
      'class_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String?> data = GeneratedColumn<String?>(
      'data', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _blobImageMeta = const VerificationMeta('blobImage');
  @override
  late final GeneratedColumn<Uint8List?> blobImage =
      GeneratedColumn<Uint8List?>('blob_image', aliasedName, true,
          type: const BlobType(), requiredDuringInsert: false);
  final VerificationMeta _createTimeMeta = const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<DateTime?> createTime = GeneratedColumn<DateTime?>(
      'create_time', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String?> action = GeneratedColumn<String?>(
      'action', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _parameterMeta = const VerificationMeta('parameter');
  @override
  late final GeneratedColumn<String?> parameter = GeneratedColumn<String?>(
      'parameter', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String?> method = GeneratedColumn<String?>(
      'method', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        objectID,
        className,
        data,
        blobImage,
        createTime,
        action,
        parameter,
        method
      ];
  @override
  String get aliasedName => _alias ?? 'sync_datas';
  @override
  String get actualTableName => 'sync_datas';
  @override
  VerificationContext validateIntegrity(Insertable<SyncDataTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('object_i_d')) {
      context.handle(_objectIDMeta,
          objectID.isAcceptableOrUnknown(data['object_i_d']!, _objectIDMeta));
    }
    if (data.containsKey('class_name')) {
      context.handle(_classNameMeta,
          className.isAcceptableOrUnknown(data['class_name']!, _classNameMeta));
    } else if (isInserting) {
      context.missing(_classNameMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    }
    if (data.containsKey('blob_image')) {
      context.handle(_blobImageMeta,
          blobImage.isAcceptableOrUnknown(data['blob_image']!, _blobImageMeta));
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    } else if (isInserting) {
      context.missing(_createTimeMeta);
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('parameter')) {
      context.handle(_parameterMeta,
          parameter.isAcceptableOrUnknown(data['parameter']!, _parameterMeta));
    }
    if (data.containsKey('method')) {
      context.handle(_methodMeta,
          method.isAcceptableOrUnknown(data['method']!, _methodMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncDataTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    return SyncDataTable.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SyncDatasTable createAlias(String alias) {
    return $SyncDatasTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  _$AppDatabase.connect(DatabaseConnection c) : super.connect(c);
  late final $SyncDatasTable syncDatas = $SyncDatasTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [syncDatas];
}
