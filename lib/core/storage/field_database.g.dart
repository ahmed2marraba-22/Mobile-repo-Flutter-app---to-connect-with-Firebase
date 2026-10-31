// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_database.dart';

// ignore_for_file: type=lint
class $LocalMissionsTable extends LocalMissions
    with TableInfo<$LocalMissionsTable, LocalMission> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalMissionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _revisionMeta =
      const VerificationMeta('revision');
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
      'revision', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, projectId, status, revision, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_missions';
  @override
  VerificationContext validateIntegrity(Insertable<LocalMission> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('revision')) {
      context.handle(_revisionMeta,
          revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalMission map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalMission(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      revision: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}revision'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $LocalMissionsTable createAlias(String alias) {
    return $LocalMissionsTable(attachedDatabase, alias);
  }
}

class LocalMission extends DataClass implements Insertable<LocalMission> {
  final String id;
  final String projectId;
  final String status;
  final int revision;
  final DateTime updatedAt;
  const LocalMission(
      {required this.id,
      required this.projectId,
      required this.status,
      required this.revision,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['status'] = Variable<String>(status);
    map['revision'] = Variable<int>(revision);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LocalMissionsCompanion toCompanion(bool nullToAbsent) {
    return LocalMissionsCompanion(
      id: Value(id),
      projectId: Value(projectId),
      status: Value(status),
      revision: Value(revision),
      updatedAt: Value(updatedAt),
    );
  }

  factory LocalMission.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalMission(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      status: serializer.fromJson<String>(json['status']),
      revision: serializer.fromJson<int>(json['revision']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'status': serializer.toJson<String>(status),
      'revision': serializer.toJson<int>(revision),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LocalMission copyWith(
          {String? id,
          String? projectId,
          String? status,
          int? revision,
          DateTime? updatedAt}) =>
      LocalMission(
        id: id ?? this.id,
        projectId: projectId ?? this.projectId,
        status: status ?? this.status,
        revision: revision ?? this.revision,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  LocalMission copyWithCompanion(LocalMissionsCompanion data) {
    return LocalMission(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      status: data.status.present ? data.status.value : this.status,
      revision: data.revision.present ? data.revision.value : this.revision,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalMission(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('status: $status, ')
          ..write('revision: $revision, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, projectId, status, revision, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalMission &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.status == this.status &&
          other.revision == this.revision &&
          other.updatedAt == this.updatedAt);
}

class LocalMissionsCompanion extends UpdateCompanion<LocalMission> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> status;
  final Value<int> revision;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const LocalMissionsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.status = const Value.absent(),
    this.revision = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalMissionsCompanion.insert({
    required String id,
    required String projectId,
    required String status,
    this.revision = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        projectId = Value(projectId),
        status = Value(status),
        updatedAt = Value(updatedAt);
  static Insertable<LocalMission> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? status,
    Expression<int>? revision,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (status != null) 'status': status,
      if (revision != null) 'revision': revision,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalMissionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? projectId,
      Value<String>? status,
      Value<int>? revision,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return LocalMissionsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      status: status ?? this.status,
      revision: revision ?? this.revision,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalMissionsCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('status: $status, ')
          ..write('revision: $revision, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FormDraftsTable extends FormDrafts
    with TableInfo<$FormDraftsTable, FormDraft> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FormDraftsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _captureIdMeta =
      const VerificationMeta('captureId');
  @override
  late final GeneratedColumn<String> captureId = GeneratedColumn<String>(
      'capture_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _formIdMeta = const VerificationMeta('formId');
  @override
  late final GeneratedColumn<String> formId = GeneratedColumn<String>(
      'form_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _formVersionMeta =
      const VerificationMeta('formVersion');
  @override
  late final GeneratedColumn<int> formVersion = GeneratedColumn<int>(
      'form_version', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _answersJsonMeta =
      const VerificationMeta('answersJson');
  @override
  late final GeneratedColumn<String> answersJson = GeneratedColumn<String>(
      'answers_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [captureId, formId, formVersion, status, answersJson, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'form_drafts';
  @override
  VerificationContext validateIntegrity(Insertable<FormDraft> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('capture_id')) {
      context.handle(_captureIdMeta,
          captureId.isAcceptableOrUnknown(data['capture_id']!, _captureIdMeta));
    } else if (isInserting) {
      context.missing(_captureIdMeta);
    }
    if (data.containsKey('form_id')) {
      context.handle(_formIdMeta,
          formId.isAcceptableOrUnknown(data['form_id']!, _formIdMeta));
    } else if (isInserting) {
      context.missing(_formIdMeta);
    }
    if (data.containsKey('form_version')) {
      context.handle(
          _formVersionMeta,
          formVersion.isAcceptableOrUnknown(
              data['form_version']!, _formVersionMeta));
    } else if (isInserting) {
      context.missing(_formVersionMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('answers_json')) {
      context.handle(
          _answersJsonMeta,
          answersJson.isAcceptableOrUnknown(
              data['answers_json']!, _answersJsonMeta));
    } else if (isInserting) {
      context.missing(_answersJsonMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {captureId};
  @override
  FormDraft map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FormDraft(
      captureId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}capture_id'])!,
      formId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}form_id'])!,
      formVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}form_version'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      answersJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}answers_json'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $FormDraftsTable createAlias(String alias) {
    return $FormDraftsTable(attachedDatabase, alias);
  }
}

class FormDraft extends DataClass implements Insertable<FormDraft> {
  final String captureId;
  final String formId;
  final int formVersion;
  final String status;
  final String answersJson;
  final DateTime updatedAt;
  const FormDraft(
      {required this.captureId,
      required this.formId,
      required this.formVersion,
      required this.status,
      required this.answersJson,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['capture_id'] = Variable<String>(captureId);
    map['form_id'] = Variable<String>(formId);
    map['form_version'] = Variable<int>(formVersion);
    map['status'] = Variable<String>(status);
    map['answers_json'] = Variable<String>(answersJson);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  FormDraftsCompanion toCompanion(bool nullToAbsent) {
    return FormDraftsCompanion(
      captureId: Value(captureId),
      formId: Value(formId),
      formVersion: Value(formVersion),
      status: Value(status),
      answersJson: Value(answersJson),
      updatedAt: Value(updatedAt),
    );
  }

  factory FormDraft.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FormDraft(
      captureId: serializer.fromJson<String>(json['captureId']),
      formId: serializer.fromJson<String>(json['formId']),
      formVersion: serializer.fromJson<int>(json['formVersion']),
      status: serializer.fromJson<String>(json['status']),
      answersJson: serializer.fromJson<String>(json['answersJson']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'captureId': serializer.toJson<String>(captureId),
      'formId': serializer.toJson<String>(formId),
      'formVersion': serializer.toJson<int>(formVersion),
      'status': serializer.toJson<String>(status),
      'answersJson': serializer.toJson<String>(answersJson),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  FormDraft copyWith(
          {String? captureId,
          String? formId,
          int? formVersion,
          String? status,
          String? answersJson,
          DateTime? updatedAt}) =>
      FormDraft(
        captureId: captureId ?? this.captureId,
        formId: formId ?? this.formId,
        formVersion: formVersion ?? this.formVersion,
        status: status ?? this.status,
        answersJson: answersJson ?? this.answersJson,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  FormDraft copyWithCompanion(FormDraftsCompanion data) {
    return FormDraft(
      captureId: data.captureId.present ? data.captureId.value : this.captureId,
      formId: data.formId.present ? data.formId.value : this.formId,
      formVersion:
          data.formVersion.present ? data.formVersion.value : this.formVersion,
      status: data.status.present ? data.status.value : this.status,
      answersJson:
          data.answersJson.present ? data.answersJson.value : this.answersJson,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FormDraft(')
          ..write('captureId: $captureId, ')
          ..write('formId: $formId, ')
          ..write('formVersion: $formVersion, ')
          ..write('status: $status, ')
          ..write('answersJson: $answersJson, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      captureId, formId, formVersion, status, answersJson, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FormDraft &&
          other.captureId == this.captureId &&
          other.formId == this.formId &&
          other.formVersion == this.formVersion &&
          other.status == this.status &&
          other.answersJson == this.answersJson &&
          other.updatedAt == this.updatedAt);
}

class FormDraftsCompanion extends UpdateCompanion<FormDraft> {
  final Value<String> captureId;
  final Value<String> formId;
  final Value<int> formVersion;
  final Value<String> status;
  final Value<String> answersJson;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const FormDraftsCompanion({
    this.captureId = const Value.absent(),
    this.formId = const Value.absent(),
    this.formVersion = const Value.absent(),
    this.status = const Value.absent(),
    this.answersJson = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FormDraftsCompanion.insert({
    required String captureId,
    required String formId,
    required int formVersion,
    required String status,
    required String answersJson,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : captureId = Value(captureId),
        formId = Value(formId),
        formVersion = Value(formVersion),
        status = Value(status),
        answersJson = Value(answersJson),
        updatedAt = Value(updatedAt);
  static Insertable<FormDraft> custom({
    Expression<String>? captureId,
    Expression<String>? formId,
    Expression<int>? formVersion,
    Expression<String>? status,
    Expression<String>? answersJson,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (captureId != null) 'capture_id': captureId,
      if (formId != null) 'form_id': formId,
      if (formVersion != null) 'form_version': formVersion,
      if (status != null) 'status': status,
      if (answersJson != null) 'answers_json': answersJson,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FormDraftsCompanion copyWith(
      {Value<String>? captureId,
      Value<String>? formId,
      Value<int>? formVersion,
      Value<String>? status,
      Value<String>? answersJson,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return FormDraftsCompanion(
      captureId: captureId ?? this.captureId,
      formId: formId ?? this.formId,
      formVersion: formVersion ?? this.formVersion,
      status: status ?? this.status,
      answersJson: answersJson ?? this.answersJson,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (captureId.present) {
      map['capture_id'] = Variable<String>(captureId.value);
    }
    if (formId.present) {
      map['form_id'] = Variable<String>(formId.value);
    }
    if (formVersion.present) {
      map['form_version'] = Variable<int>(formVersion.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (answersJson.present) {
      map['answers_json'] = Variable<String>(answersJson.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FormDraftsCompanion(')
          ..write('captureId: $captureId, ')
          ..write('formId: $formId, ')
          ..write('formVersion: $formVersion, ')
          ..write('status: $status, ')
          ..write('answersJson: $answersJson, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncOutboxTable extends SyncOutbox
    with TableInfo<$SyncOutboxTable, SyncOutboxData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncOutboxTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _clientOperationIdMeta =
      const VerificationMeta('clientOperationId');
  @override
  late final GeneratedColumn<String> clientOperationId =
      GeneratedColumn<String>('client_operation_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entityIdMeta =
      const VerificationMeta('entityId');
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
      'entity_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _operationMeta =
      const VerificationMeta('operation');
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
      'operation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _baseVersionMeta =
      const VerificationMeta('baseVersion');
  @override
  late final GeneratedColumn<int> baseVersion = GeneratedColumn<int>(
      'base_version', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _payloadJsonMeta =
      const VerificationMeta('payloadJson');
  @override
  late final GeneratedColumn<String> payloadJson = GeneratedColumn<String>(
      'payload_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _attemptsMeta =
      const VerificationMeta('attempts');
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
      'attempts', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _nextAttemptAtMeta =
      const VerificationMeta('nextAttemptAt');
  @override
  late final GeneratedColumn<DateTime> nextAttemptAt =
      GeneratedColumn<DateTime>('next_attempt_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastErrorMeta =
      const VerificationMeta('lastError');
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
      'last_error', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        clientOperationId,
        entityType,
        entityId,
        operation,
        baseVersion,
        payloadJson,
        state,
        attempts,
        nextAttemptAt,
        lastError,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_outbox';
  @override
  VerificationContext validateIntegrity(Insertable<SyncOutboxData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('client_operation_id')) {
      context.handle(
          _clientOperationIdMeta,
          clientOperationId.isAcceptableOrUnknown(
              data['client_operation_id']!, _clientOperationIdMeta));
    } else if (isInserting) {
      context.missing(_clientOperationIdMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(_entityIdMeta,
          entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta));
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(_operationMeta,
          operation.isAcceptableOrUnknown(data['operation']!, _operationMeta));
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('base_version')) {
      context.handle(
          _baseVersionMeta,
          baseVersion.isAcceptableOrUnknown(
              data['base_version']!, _baseVersionMeta));
    }
    if (data.containsKey('payload_json')) {
      context.handle(
          _payloadJsonMeta,
          payloadJson.isAcceptableOrUnknown(
              data['payload_json']!, _payloadJsonMeta));
    } else if (isInserting) {
      context.missing(_payloadJsonMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('attempts')) {
      context.handle(_attemptsMeta,
          attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta));
    }
    if (data.containsKey('next_attempt_at')) {
      context.handle(
          _nextAttemptAtMeta,
          nextAttemptAt.isAcceptableOrUnknown(
              data['next_attempt_at']!, _nextAttemptAtMeta));
    }
    if (data.containsKey('last_error')) {
      context.handle(_lastErrorMeta,
          lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {clientOperationId};
  @override
  SyncOutboxData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncOutboxData(
      clientOperationId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_operation_id'])!,
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      entityId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_id'])!,
      operation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}operation'])!,
      baseVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}base_version']),
      payloadJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload_json'])!,
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state'])!,
      attempts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attempts'])!,
      nextAttemptAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}next_attempt_at']),
      lastError: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_error']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $SyncOutboxTable createAlias(String alias) {
    return $SyncOutboxTable(attachedDatabase, alias);
  }
}

class SyncOutboxData extends DataClass implements Insertable<SyncOutboxData> {
  final String clientOperationId;
  final String entityType;
  final String entityId;
  final String operation;
  final int? baseVersion;
  final String payloadJson;
  final String state;
  final int attempts;
  final DateTime? nextAttemptAt;
  final String? lastError;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SyncOutboxData(
      {required this.clientOperationId,
      required this.entityType,
      required this.entityId,
      required this.operation,
      this.baseVersion,
      required this.payloadJson,
      required this.state,
      required this.attempts,
      this.nextAttemptAt,
      this.lastError,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['client_operation_id'] = Variable<String>(clientOperationId);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['operation'] = Variable<String>(operation);
    if (!nullToAbsent || baseVersion != null) {
      map['base_version'] = Variable<int>(baseVersion);
    }
    map['payload_json'] = Variable<String>(payloadJson);
    map['state'] = Variable<String>(state);
    map['attempts'] = Variable<int>(attempts);
    if (!nullToAbsent || nextAttemptAt != null) {
      map['next_attempt_at'] = Variable<DateTime>(nextAttemptAt);
    }
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SyncOutboxCompanion toCompanion(bool nullToAbsent) {
    return SyncOutboxCompanion(
      clientOperationId: Value(clientOperationId),
      entityType: Value(entityType),
      entityId: Value(entityId),
      operation: Value(operation),
      baseVersion: baseVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(baseVersion),
      payloadJson: Value(payloadJson),
      state: Value(state),
      attempts: Value(attempts),
      nextAttemptAt: nextAttemptAt == null && nullToAbsent
          ? const Value.absent()
          : Value(nextAttemptAt),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SyncOutboxData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncOutboxData(
      clientOperationId: serializer.fromJson<String>(json['clientOperationId']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      operation: serializer.fromJson<String>(json['operation']),
      baseVersion: serializer.fromJson<int?>(json['baseVersion']),
      payloadJson: serializer.fromJson<String>(json['payloadJson']),
      state: serializer.fromJson<String>(json['state']),
      attempts: serializer.fromJson<int>(json['attempts']),
      nextAttemptAt: serializer.fromJson<DateTime?>(json['nextAttemptAt']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'clientOperationId': serializer.toJson<String>(clientOperationId),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'operation': serializer.toJson<String>(operation),
      'baseVersion': serializer.toJson<int?>(baseVersion),
      'payloadJson': serializer.toJson<String>(payloadJson),
      'state': serializer.toJson<String>(state),
      'attempts': serializer.toJson<int>(attempts),
      'nextAttemptAt': serializer.toJson<DateTime?>(nextAttemptAt),
      'lastError': serializer.toJson<String?>(lastError),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SyncOutboxData copyWith(
          {String? clientOperationId,
          String? entityType,
          String? entityId,
          String? operation,
          Value<int?> baseVersion = const Value.absent(),
          String? payloadJson,
          String? state,
          int? attempts,
          Value<DateTime?> nextAttemptAt = const Value.absent(),
          Value<String?> lastError = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      SyncOutboxData(
        clientOperationId: clientOperationId ?? this.clientOperationId,
        entityType: entityType ?? this.entityType,
        entityId: entityId ?? this.entityId,
        operation: operation ?? this.operation,
        baseVersion: baseVersion.present ? baseVersion.value : this.baseVersion,
        payloadJson: payloadJson ?? this.payloadJson,
        state: state ?? this.state,
        attempts: attempts ?? this.attempts,
        nextAttemptAt:
            nextAttemptAt.present ? nextAttemptAt.value : this.nextAttemptAt,
        lastError: lastError.present ? lastError.value : this.lastError,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  SyncOutboxData copyWithCompanion(SyncOutboxCompanion data) {
    return SyncOutboxData(
      clientOperationId: data.clientOperationId.present
          ? data.clientOperationId.value
          : this.clientOperationId,
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      operation: data.operation.present ? data.operation.value : this.operation,
      baseVersion:
          data.baseVersion.present ? data.baseVersion.value : this.baseVersion,
      payloadJson:
          data.payloadJson.present ? data.payloadJson.value : this.payloadJson,
      state: data.state.present ? data.state.value : this.state,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      nextAttemptAt: data.nextAttemptAt.present
          ? data.nextAttemptAt.value
          : this.nextAttemptAt,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncOutboxData(')
          ..write('clientOperationId: $clientOperationId, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('operation: $operation, ')
          ..write('baseVersion: $baseVersion, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('state: $state, ')
          ..write('attempts: $attempts, ')
          ..write('nextAttemptAt: $nextAttemptAt, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      clientOperationId,
      entityType,
      entityId,
      operation,
      baseVersion,
      payloadJson,
      state,
      attempts,
      nextAttemptAt,
      lastError,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncOutboxData &&
          other.clientOperationId == this.clientOperationId &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.operation == this.operation &&
          other.baseVersion == this.baseVersion &&
          other.payloadJson == this.payloadJson &&
          other.state == this.state &&
          other.attempts == this.attempts &&
          other.nextAttemptAt == this.nextAttemptAt &&
          other.lastError == this.lastError &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SyncOutboxCompanion extends UpdateCompanion<SyncOutboxData> {
  final Value<String> clientOperationId;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> operation;
  final Value<int?> baseVersion;
  final Value<String> payloadJson;
  final Value<String> state;
  final Value<int> attempts;
  final Value<DateTime?> nextAttemptAt;
  final Value<String?> lastError;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SyncOutboxCompanion({
    this.clientOperationId = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.operation = const Value.absent(),
    this.baseVersion = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.state = const Value.absent(),
    this.attempts = const Value.absent(),
    this.nextAttemptAt = const Value.absent(),
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncOutboxCompanion.insert({
    required String clientOperationId,
    required String entityType,
    required String entityId,
    required String operation,
    this.baseVersion = const Value.absent(),
    required String payloadJson,
    this.state = const Value.absent(),
    this.attempts = const Value.absent(),
    this.nextAttemptAt = const Value.absent(),
    this.lastError = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : clientOperationId = Value(clientOperationId),
        entityType = Value(entityType),
        entityId = Value(entityId),
        operation = Value(operation),
        payloadJson = Value(payloadJson),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<SyncOutboxData> custom({
    Expression<String>? clientOperationId,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? operation,
    Expression<int>? baseVersion,
    Expression<String>? payloadJson,
    Expression<String>? state,
    Expression<int>? attempts,
    Expression<DateTime>? nextAttemptAt,
    Expression<String>? lastError,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (clientOperationId != null) 'client_operation_id': clientOperationId,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (operation != null) 'operation': operation,
      if (baseVersion != null) 'base_version': baseVersion,
      if (payloadJson != null) 'payload_json': payloadJson,
      if (state != null) 'state': state,
      if (attempts != null) 'attempts': attempts,
      if (nextAttemptAt != null) 'next_attempt_at': nextAttemptAt,
      if (lastError != null) 'last_error': lastError,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncOutboxCompanion copyWith(
      {Value<String>? clientOperationId,
      Value<String>? entityType,
      Value<String>? entityId,
      Value<String>? operation,
      Value<int?>? baseVersion,
      Value<String>? payloadJson,
      Value<String>? state,
      Value<int>? attempts,
      Value<DateTime?>? nextAttemptAt,
      Value<String?>? lastError,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return SyncOutboxCompanion(
      clientOperationId: clientOperationId ?? this.clientOperationId,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      operation: operation ?? this.operation,
      baseVersion: baseVersion ?? this.baseVersion,
      payloadJson: payloadJson ?? this.payloadJson,
      state: state ?? this.state,
      attempts: attempts ?? this.attempts,
      nextAttemptAt: nextAttemptAt ?? this.nextAttemptAt,
      lastError: lastError ?? this.lastError,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (clientOperationId.present) {
      map['client_operation_id'] = Variable<String>(clientOperationId.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (baseVersion.present) {
      map['base_version'] = Variable<int>(baseVersion.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(payloadJson.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (nextAttemptAt.present) {
      map['next_attempt_at'] = Variable<DateTime>(nextAttemptAt.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncOutboxCompanion(')
          ..write('clientOperationId: $clientOperationId, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('operation: $operation, ')
          ..write('baseVersion: $baseVersion, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('state: $state, ')
          ..write('attempts: $attempts, ')
          ..write('nextAttemptAt: $nextAttemptAt, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncCheckpointsTable extends SyncCheckpoints
    with TableInfo<$SyncCheckpointsTable, SyncCheckpoint> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncCheckpointsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _scopeMeta = const VerificationMeta('scope');
  @override
  late final GeneratedColumn<String> scope = GeneratedColumn<String>(
      'scope', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cursorMeta = const VerificationMeta('cursor');
  @override
  late final GeneratedColumn<String> cursor = GeneratedColumn<String>(
      'cursor', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _serverWatermarkMeta =
      const VerificationMeta('serverWatermark');
  @override
  late final GeneratedColumn<DateTime> serverWatermark =
      GeneratedColumn<DateTime>('server_watermark', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [scope, cursor, serverWatermark, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_checkpoints';
  @override
  VerificationContext validateIntegrity(Insertable<SyncCheckpoint> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('scope')) {
      context.handle(
          _scopeMeta, scope.isAcceptableOrUnknown(data['scope']!, _scopeMeta));
    } else if (isInserting) {
      context.missing(_scopeMeta);
    }
    if (data.containsKey('cursor')) {
      context.handle(_cursorMeta,
          cursor.isAcceptableOrUnknown(data['cursor']!, _cursorMeta));
    }
    if (data.containsKey('server_watermark')) {
      context.handle(
          _serverWatermarkMeta,
          serverWatermark.isAcceptableOrUnknown(
              data['server_watermark']!, _serverWatermarkMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {scope};
  @override
  SyncCheckpoint map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncCheckpoint(
      scope: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scope'])!,
      cursor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cursor']),
      serverWatermark: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}server_watermark']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $SyncCheckpointsTable createAlias(String alias) {
    return $SyncCheckpointsTable(attachedDatabase, alias);
  }
}

class SyncCheckpoint extends DataClass implements Insertable<SyncCheckpoint> {
  final String scope;
  final String? cursor;
  final DateTime? serverWatermark;
  final DateTime updatedAt;
  const SyncCheckpoint(
      {required this.scope,
      this.cursor,
      this.serverWatermark,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['scope'] = Variable<String>(scope);
    if (!nullToAbsent || cursor != null) {
      map['cursor'] = Variable<String>(cursor);
    }
    if (!nullToAbsent || serverWatermark != null) {
      map['server_watermark'] = Variable<DateTime>(serverWatermark);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SyncCheckpointsCompanion toCompanion(bool nullToAbsent) {
    return SyncCheckpointsCompanion(
      scope: Value(scope),
      cursor:
          cursor == null && nullToAbsent ? const Value.absent() : Value(cursor),
      serverWatermark: serverWatermark == null && nullToAbsent
          ? const Value.absent()
          : Value(serverWatermark),
      updatedAt: Value(updatedAt),
    );
  }

  factory SyncCheckpoint.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncCheckpoint(
      scope: serializer.fromJson<String>(json['scope']),
      cursor: serializer.fromJson<String?>(json['cursor']),
      serverWatermark: serializer.fromJson<DateTime?>(json['serverWatermark']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'scope': serializer.toJson<String>(scope),
      'cursor': serializer.toJson<String?>(cursor),
      'serverWatermark': serializer.toJson<DateTime?>(serverWatermark),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SyncCheckpoint copyWith(
          {String? scope,
          Value<String?> cursor = const Value.absent(),
          Value<DateTime?> serverWatermark = const Value.absent(),
          DateTime? updatedAt}) =>
      SyncCheckpoint(
        scope: scope ?? this.scope,
        cursor: cursor.present ? cursor.value : this.cursor,
        serverWatermark: serverWatermark.present
            ? serverWatermark.value
            : this.serverWatermark,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  SyncCheckpoint copyWithCompanion(SyncCheckpointsCompanion data) {
    return SyncCheckpoint(
      scope: data.scope.present ? data.scope.value : this.scope,
      cursor: data.cursor.present ? data.cursor.value : this.cursor,
      serverWatermark: data.serverWatermark.present
          ? data.serverWatermark.value
          : this.serverWatermark,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncCheckpoint(')
          ..write('scope: $scope, ')
          ..write('cursor: $cursor, ')
          ..write('serverWatermark: $serverWatermark, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(scope, cursor, serverWatermark, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncCheckpoint &&
          other.scope == this.scope &&
          other.cursor == this.cursor &&
          other.serverWatermark == this.serverWatermark &&
          other.updatedAt == this.updatedAt);
}

class SyncCheckpointsCompanion extends UpdateCompanion<SyncCheckpoint> {
  final Value<String> scope;
  final Value<String?> cursor;
  final Value<DateTime?> serverWatermark;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SyncCheckpointsCompanion({
    this.scope = const Value.absent(),
    this.cursor = const Value.absent(),
    this.serverWatermark = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncCheckpointsCompanion.insert({
    required String scope,
    this.cursor = const Value.absent(),
    this.serverWatermark = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : scope = Value(scope),
        updatedAt = Value(updatedAt);
  static Insertable<SyncCheckpoint> custom({
    Expression<String>? scope,
    Expression<String>? cursor,
    Expression<DateTime>? serverWatermark,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (scope != null) 'scope': scope,
      if (cursor != null) 'cursor': cursor,
      if (serverWatermark != null) 'server_watermark': serverWatermark,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncCheckpointsCompanion copyWith(
      {Value<String>? scope,
      Value<String?>? cursor,
      Value<DateTime?>? serverWatermark,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return SyncCheckpointsCompanion(
      scope: scope ?? this.scope,
      cursor: cursor ?? this.cursor,
      serverWatermark: serverWatermark ?? this.serverWatermark,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (scope.present) {
      map['scope'] = Variable<String>(scope.value);
    }
    if (cursor.present) {
      map['cursor'] = Variable<String>(cursor.value);
    }
    if (serverWatermark.present) {
      map['server_watermark'] = Variable<DateTime>(serverWatermark.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncCheckpointsCompanion(')
          ..write('scope: $scope, ')
          ..write('cursor: $cursor, ')
          ..write('serverWatermark: $serverWatermark, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AttachmentQueueTable extends AttachmentQueue
    with TableInfo<$AttachmentQueueTable, AttachmentQueueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttachmentQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _localPathMeta =
      const VerificationMeta('localPath');
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
      'local_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sha256Meta = const VerificationMeta('sha256');
  @override
  late final GeneratedColumn<String> sha256 = GeneratedColumn<String>(
      'sha256', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sizeBytesMeta =
      const VerificationMeta('sizeBytes');
  @override
  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
      'size_bytes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _mimeTypeMeta =
      const VerificationMeta('mimeType');
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
      'mime_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _attemptsMeta =
      const VerificationMeta('attempts');
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
      'attempts', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, localPath, sha256, sizeBytes, mimeType, state, attempts, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attachment_queue';
  @override
  VerificationContext validateIntegrity(
      Insertable<AttachmentQueueData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(_localPathMeta,
          localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta));
    } else if (isInserting) {
      context.missing(_localPathMeta);
    }
    if (data.containsKey('sha256')) {
      context.handle(_sha256Meta,
          sha256.isAcceptableOrUnknown(data['sha256']!, _sha256Meta));
    } else if (isInserting) {
      context.missing(_sha256Meta);
    }
    if (data.containsKey('size_bytes')) {
      context.handle(_sizeBytesMeta,
          sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta));
    } else if (isInserting) {
      context.missing(_sizeBytesMeta);
    }
    if (data.containsKey('mime_type')) {
      context.handle(_mimeTypeMeta,
          mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta));
    } else if (isInserting) {
      context.missing(_mimeTypeMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('attempts')) {
      context.handle(_attemptsMeta,
          attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AttachmentQueueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttachmentQueueData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      localPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_path'])!,
      sha256: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sha256'])!,
      sizeBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}size_bytes'])!,
      mimeType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mime_type'])!,
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state'])!,
      attempts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attempts'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $AttachmentQueueTable createAlias(String alias) {
    return $AttachmentQueueTable(attachedDatabase, alias);
  }
}

class AttachmentQueueData extends DataClass
    implements Insertable<AttachmentQueueData> {
  final String id;
  final String localPath;
  final String sha256;
  final int sizeBytes;
  final String mimeType;
  final String state;
  final int attempts;
  final DateTime updatedAt;
  const AttachmentQueueData(
      {required this.id,
      required this.localPath,
      required this.sha256,
      required this.sizeBytes,
      required this.mimeType,
      required this.state,
      required this.attempts,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['local_path'] = Variable<String>(localPath);
    map['sha256'] = Variable<String>(sha256);
    map['size_bytes'] = Variable<int>(sizeBytes);
    map['mime_type'] = Variable<String>(mimeType);
    map['state'] = Variable<String>(state);
    map['attempts'] = Variable<int>(attempts);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AttachmentQueueCompanion toCompanion(bool nullToAbsent) {
    return AttachmentQueueCompanion(
      id: Value(id),
      localPath: Value(localPath),
      sha256: Value(sha256),
      sizeBytes: Value(sizeBytes),
      mimeType: Value(mimeType),
      state: Value(state),
      attempts: Value(attempts),
      updatedAt: Value(updatedAt),
    );
  }

  factory AttachmentQueueData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttachmentQueueData(
      id: serializer.fromJson<String>(json['id']),
      localPath: serializer.fromJson<String>(json['localPath']),
      sha256: serializer.fromJson<String>(json['sha256']),
      sizeBytes: serializer.fromJson<int>(json['sizeBytes']),
      mimeType: serializer.fromJson<String>(json['mimeType']),
      state: serializer.fromJson<String>(json['state']),
      attempts: serializer.fromJson<int>(json['attempts']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'localPath': serializer.toJson<String>(localPath),
      'sha256': serializer.toJson<String>(sha256),
      'sizeBytes': serializer.toJson<int>(sizeBytes),
      'mimeType': serializer.toJson<String>(mimeType),
      'state': serializer.toJson<String>(state),
      'attempts': serializer.toJson<int>(attempts),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AttachmentQueueData copyWith(
          {String? id,
          String? localPath,
          String? sha256,
          int? sizeBytes,
          String? mimeType,
          String? state,
          int? attempts,
          DateTime? updatedAt}) =>
      AttachmentQueueData(
        id: id ?? this.id,
        localPath: localPath ?? this.localPath,
        sha256: sha256 ?? this.sha256,
        sizeBytes: sizeBytes ?? this.sizeBytes,
        mimeType: mimeType ?? this.mimeType,
        state: state ?? this.state,
        attempts: attempts ?? this.attempts,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  AttachmentQueueData copyWithCompanion(AttachmentQueueCompanion data) {
    return AttachmentQueueData(
      id: data.id.present ? data.id.value : this.id,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      sha256: data.sha256.present ? data.sha256.value : this.sha256,
      sizeBytes: data.sizeBytes.present ? data.sizeBytes.value : this.sizeBytes,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
      state: data.state.present ? data.state.value : this.state,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentQueueData(')
          ..write('id: $id, ')
          ..write('localPath: $localPath, ')
          ..write('sha256: $sha256, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('mimeType: $mimeType, ')
          ..write('state: $state, ')
          ..write('attempts: $attempts, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, localPath, sha256, sizeBytes, mimeType, state, attempts, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttachmentQueueData &&
          other.id == this.id &&
          other.localPath == this.localPath &&
          other.sha256 == this.sha256 &&
          other.sizeBytes == this.sizeBytes &&
          other.mimeType == this.mimeType &&
          other.state == this.state &&
          other.attempts == this.attempts &&
          other.updatedAt == this.updatedAt);
}

class AttachmentQueueCompanion extends UpdateCompanion<AttachmentQueueData> {
  final Value<String> id;
  final Value<String> localPath;
  final Value<String> sha256;
  final Value<int> sizeBytes;
  final Value<String> mimeType;
  final Value<String> state;
  final Value<int> attempts;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AttachmentQueueCompanion({
    this.id = const Value.absent(),
    this.localPath = const Value.absent(),
    this.sha256 = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.state = const Value.absent(),
    this.attempts = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AttachmentQueueCompanion.insert({
    required String id,
    required String localPath,
    required String sha256,
    required int sizeBytes,
    required String mimeType,
    this.state = const Value.absent(),
    this.attempts = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        localPath = Value(localPath),
        sha256 = Value(sha256),
        sizeBytes = Value(sizeBytes),
        mimeType = Value(mimeType),
        updatedAt = Value(updatedAt);
  static Insertable<AttachmentQueueData> custom({
    Expression<String>? id,
    Expression<String>? localPath,
    Expression<String>? sha256,
    Expression<int>? sizeBytes,
    Expression<String>? mimeType,
    Expression<String>? state,
    Expression<int>? attempts,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (localPath != null) 'local_path': localPath,
      if (sha256 != null) 'sha256': sha256,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
      if (mimeType != null) 'mime_type': mimeType,
      if (state != null) 'state': state,
      if (attempts != null) 'attempts': attempts,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AttachmentQueueCompanion copyWith(
      {Value<String>? id,
      Value<String>? localPath,
      Value<String>? sha256,
      Value<int>? sizeBytes,
      Value<String>? mimeType,
      Value<String>? state,
      Value<int>? attempts,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return AttachmentQueueCompanion(
      id: id ?? this.id,
      localPath: localPath ?? this.localPath,
      sha256: sha256 ?? this.sha256,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      mimeType: mimeType ?? this.mimeType,
      state: state ?? this.state,
      attempts: attempts ?? this.attempts,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (sha256.present) {
      map['sha256'] = Variable<String>(sha256.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentQueueCompanion(')
          ..write('id: $id, ')
          ..write('localPath: $localPath, ')
          ..write('sha256: $sha256, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('mimeType: $mimeType, ')
          ..write('state: $state, ')
          ..write('attempts: $attempts, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalDocumentsTable extends LocalDocuments
    with TableInfo<$LocalDocumentsTable, LocalDocument> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalDocumentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _collectionMeta =
      const VerificationMeta('collection');
  @override
  late final GeneratedColumn<String> collection = GeneratedColumn<String>(
      'collection', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueJsonMeta =
      const VerificationMeta('valueJson');
  @override
  late final GeneratedColumn<String> valueJson = GeneratedColumn<String>(
      'value_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [collection, id, valueJson, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_documents';
  @override
  VerificationContext validateIntegrity(Insertable<LocalDocument> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('collection')) {
      context.handle(
          _collectionMeta,
          collection.isAcceptableOrUnknown(
              data['collection']!, _collectionMeta));
    } else if (isInserting) {
      context.missing(_collectionMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('value_json')) {
      context.handle(_valueJsonMeta,
          valueJson.isAcceptableOrUnknown(data['value_json']!, _valueJsonMeta));
    } else if (isInserting) {
      context.missing(_valueJsonMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {collection, id};
  @override
  LocalDocument map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalDocument(
      collection: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      valueJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value_json'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $LocalDocumentsTable createAlias(String alias) {
    return $LocalDocumentsTable(attachedDatabase, alias);
  }
}

class LocalDocument extends DataClass implements Insertable<LocalDocument> {
  final String collection;
  final String id;
  final String valueJson;
  final DateTime updatedAt;
  const LocalDocument(
      {required this.collection,
      required this.id,
      required this.valueJson,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['collection'] = Variable<String>(collection);
    map['id'] = Variable<String>(id);
    map['value_json'] = Variable<String>(valueJson);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LocalDocumentsCompanion toCompanion(bool nullToAbsent) {
    return LocalDocumentsCompanion(
      collection: Value(collection),
      id: Value(id),
      valueJson: Value(valueJson),
      updatedAt: Value(updatedAt),
    );
  }

  factory LocalDocument.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalDocument(
      collection: serializer.fromJson<String>(json['collection']),
      id: serializer.fromJson<String>(json['id']),
      valueJson: serializer.fromJson<String>(json['valueJson']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'collection': serializer.toJson<String>(collection),
      'id': serializer.toJson<String>(id),
      'valueJson': serializer.toJson<String>(valueJson),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LocalDocument copyWith(
          {String? collection,
          String? id,
          String? valueJson,
          DateTime? updatedAt}) =>
      LocalDocument(
        collection: collection ?? this.collection,
        id: id ?? this.id,
        valueJson: valueJson ?? this.valueJson,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  LocalDocument copyWithCompanion(LocalDocumentsCompanion data) {
    return LocalDocument(
      collection:
          data.collection.present ? data.collection.value : this.collection,
      id: data.id.present ? data.id.value : this.id,
      valueJson: data.valueJson.present ? data.valueJson.value : this.valueJson,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalDocument(')
          ..write('collection: $collection, ')
          ..write('id: $id, ')
          ..write('valueJson: $valueJson, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(collection, id, valueJson, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalDocument &&
          other.collection == this.collection &&
          other.id == this.id &&
          other.valueJson == this.valueJson &&
          other.updatedAt == this.updatedAt);
}

class LocalDocumentsCompanion extends UpdateCompanion<LocalDocument> {
  final Value<String> collection;
  final Value<String> id;
  final Value<String> valueJson;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const LocalDocumentsCompanion({
    this.collection = const Value.absent(),
    this.id = const Value.absent(),
    this.valueJson = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalDocumentsCompanion.insert({
    required String collection,
    required String id,
    required String valueJson,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : collection = Value(collection),
        id = Value(id),
        valueJson = Value(valueJson),
        updatedAt = Value(updatedAt);
  static Insertable<LocalDocument> custom({
    Expression<String>? collection,
    Expression<String>? id,
    Expression<String>? valueJson,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (collection != null) 'collection': collection,
      if (id != null) 'id': id,
      if (valueJson != null) 'value_json': valueJson,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalDocumentsCompanion copyWith(
      {Value<String>? collection,
      Value<String>? id,
      Value<String>? valueJson,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return LocalDocumentsCompanion(
      collection: collection ?? this.collection,
      id: id ?? this.id,
      valueJson: valueJson ?? this.valueJson,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (collection.present) {
      map['collection'] = Variable<String>(collection.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (valueJson.present) {
      map['value_json'] = Variable<String>(valueJson.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalDocumentsCompanion(')
          ..write('collection: $collection, ')
          ..write('id: $id, ')
          ..write('valueJson: $valueJson, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$FieldDatabase extends GeneratedDatabase {
  _$FieldDatabase(QueryExecutor e) : super(e);
  $FieldDatabaseManager get managers => $FieldDatabaseManager(this);
  late final $LocalMissionsTable localMissions = $LocalMissionsTable(this);
  late final $FormDraftsTable formDrafts = $FormDraftsTable(this);
  late final $SyncOutboxTable syncOutbox = $SyncOutboxTable(this);
  late final $SyncCheckpointsTable syncCheckpoints =
      $SyncCheckpointsTable(this);
  late final $AttachmentQueueTable attachmentQueue =
      $AttachmentQueueTable(this);
  late final $LocalDocumentsTable localDocuments = $LocalDocumentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        localMissions,
        formDrafts,
        syncOutbox,
        syncCheckpoints,
        attachmentQueue,
        localDocuments
      ];
}

typedef $$LocalMissionsTableCreateCompanionBuilder = LocalMissionsCompanion
    Function({
  required String id,
  required String projectId,
  required String status,
  Value<int> revision,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$LocalMissionsTableUpdateCompanionBuilder = LocalMissionsCompanion
    Function({
  Value<String> id,
  Value<String> projectId,
  Value<String> status,
  Value<int> revision,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$LocalMissionsTableFilterComposer
    extends Composer<_$FieldDatabase, $LocalMissionsTable> {
  $$LocalMissionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get revision => $composableBuilder(
      column: $table.revision, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$LocalMissionsTableOrderingComposer
    extends Composer<_$FieldDatabase, $LocalMissionsTable> {
  $$LocalMissionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get revision => $composableBuilder(
      column: $table.revision, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$LocalMissionsTableAnnotationComposer
    extends Composer<_$FieldDatabase, $LocalMissionsTable> {
  $$LocalMissionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$LocalMissionsTableTableManager extends RootTableManager<
    _$FieldDatabase,
    $LocalMissionsTable,
    LocalMission,
    $$LocalMissionsTableFilterComposer,
    $$LocalMissionsTableOrderingComposer,
    $$LocalMissionsTableAnnotationComposer,
    $$LocalMissionsTableCreateCompanionBuilder,
    $$LocalMissionsTableUpdateCompanionBuilder,
    (
      LocalMission,
      BaseReferences<_$FieldDatabase, $LocalMissionsTable, LocalMission>
    ),
    LocalMission,
    PrefetchHooks Function()> {
  $$LocalMissionsTableTableManager(
      _$FieldDatabase db, $LocalMissionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalMissionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalMissionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalMissionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> projectId = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> revision = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LocalMissionsCompanion(
            id: id,
            projectId: projectId,
            status: status,
            revision: revision,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String projectId,
            required String status,
            Value<int> revision = const Value.absent(),
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              LocalMissionsCompanion.insert(
            id: id,
            projectId: projectId,
            status: status,
            revision: revision,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$LocalMissionsTable, LocalMission>(table),
                    BaseReferences<_$FieldDatabase, $LocalMissionsTable,
                        LocalMission>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalMissionsTableProcessedTableManager = ProcessedTableManager<
    _$FieldDatabase,
    $LocalMissionsTable,
    LocalMission,
    $$LocalMissionsTableFilterComposer,
    $$LocalMissionsTableOrderingComposer,
    $$LocalMissionsTableAnnotationComposer,
    $$LocalMissionsTableCreateCompanionBuilder,
    $$LocalMissionsTableUpdateCompanionBuilder,
    (
      LocalMission,
      BaseReferences<_$FieldDatabase, $LocalMissionsTable, LocalMission>
    ),
    LocalMission,
    PrefetchHooks Function()>;
typedef $$FormDraftsTableCreateCompanionBuilder = FormDraftsCompanion Function({
  required String captureId,
  required String formId,
  required int formVersion,
  required String status,
  required String answersJson,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$FormDraftsTableUpdateCompanionBuilder = FormDraftsCompanion Function({
  Value<String> captureId,
  Value<String> formId,
  Value<int> formVersion,
  Value<String> status,
  Value<String> answersJson,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$FormDraftsTableFilterComposer
    extends Composer<_$FieldDatabase, $FormDraftsTable> {
  $$FormDraftsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get captureId => $composableBuilder(
      column: $table.captureId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get formId => $composableBuilder(
      column: $table.formId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get formVersion => $composableBuilder(
      column: $table.formVersion, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get answersJson => $composableBuilder(
      column: $table.answersJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$FormDraftsTableOrderingComposer
    extends Composer<_$FieldDatabase, $FormDraftsTable> {
  $$FormDraftsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get captureId => $composableBuilder(
      column: $table.captureId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get formId => $composableBuilder(
      column: $table.formId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get formVersion => $composableBuilder(
      column: $table.formVersion, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get answersJson => $composableBuilder(
      column: $table.answersJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$FormDraftsTableAnnotationComposer
    extends Composer<_$FieldDatabase, $FormDraftsTable> {
  $$FormDraftsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get captureId =>
      $composableBuilder(column: $table.captureId, builder: (column) => column);

  GeneratedColumn<String> get formId =>
      $composableBuilder(column: $table.formId, builder: (column) => column);

  GeneratedColumn<int> get formVersion => $composableBuilder(
      column: $table.formVersion, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get answersJson => $composableBuilder(
      column: $table.answersJson, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$FormDraftsTableTableManager extends RootTableManager<
    _$FieldDatabase,
    $FormDraftsTable,
    FormDraft,
    $$FormDraftsTableFilterComposer,
    $$FormDraftsTableOrderingComposer,
    $$FormDraftsTableAnnotationComposer,
    $$FormDraftsTableCreateCompanionBuilder,
    $$FormDraftsTableUpdateCompanionBuilder,
    (FormDraft, BaseReferences<_$FieldDatabase, $FormDraftsTable, FormDraft>),
    FormDraft,
    PrefetchHooks Function()> {
  $$FormDraftsTableTableManager(_$FieldDatabase db, $FormDraftsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FormDraftsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FormDraftsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FormDraftsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> captureId = const Value.absent(),
            Value<String> formId = const Value.absent(),
            Value<int> formVersion = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> answersJson = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FormDraftsCompanion(
            captureId: captureId,
            formId: formId,
            formVersion: formVersion,
            status: status,
            answersJson: answersJson,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String captureId,
            required String formId,
            required int formVersion,
            required String status,
            required String answersJson,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              FormDraftsCompanion.insert(
            captureId: captureId,
            formId: formId,
            formVersion: formVersion,
            status: status,
            answersJson: answersJson,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$FormDraftsTable, FormDraft>(table),
                    BaseReferences<_$FieldDatabase, $FormDraftsTable,
                        FormDraft>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FormDraftsTableProcessedTableManager = ProcessedTableManager<
    _$FieldDatabase,
    $FormDraftsTable,
    FormDraft,
    $$FormDraftsTableFilterComposer,
    $$FormDraftsTableOrderingComposer,
    $$FormDraftsTableAnnotationComposer,
    $$FormDraftsTableCreateCompanionBuilder,
    $$FormDraftsTableUpdateCompanionBuilder,
    (FormDraft, BaseReferences<_$FieldDatabase, $FormDraftsTable, FormDraft>),
    FormDraft,
    PrefetchHooks Function()>;
typedef $$SyncOutboxTableCreateCompanionBuilder = SyncOutboxCompanion Function({
  required String clientOperationId,
  required String entityType,
  required String entityId,
  required String operation,
  Value<int?> baseVersion,
  required String payloadJson,
  Value<String> state,
  Value<int> attempts,
  Value<DateTime?> nextAttemptAt,
  Value<String?> lastError,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$SyncOutboxTableUpdateCompanionBuilder = SyncOutboxCompanion Function({
  Value<String> clientOperationId,
  Value<String> entityType,
  Value<String> entityId,
  Value<String> operation,
  Value<int?> baseVersion,
  Value<String> payloadJson,
  Value<String> state,
  Value<int> attempts,
  Value<DateTime?> nextAttemptAt,
  Value<String?> lastError,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$SyncOutboxTableFilterComposer
    extends Composer<_$FieldDatabase, $SyncOutboxTable> {
  $$SyncOutboxTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get clientOperationId => $composableBuilder(
      column: $table.clientOperationId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get baseVersion => $composableBuilder(
      column: $table.baseVersion, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payloadJson => $composableBuilder(
      column: $table.payloadJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get nextAttemptAt => $composableBuilder(
      column: $table.nextAttemptAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$SyncOutboxTableOrderingComposer
    extends Composer<_$FieldDatabase, $SyncOutboxTable> {
  $$SyncOutboxTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get clientOperationId => $composableBuilder(
      column: $table.clientOperationId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get baseVersion => $composableBuilder(
      column: $table.baseVersion, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payloadJson => $composableBuilder(
      column: $table.payloadJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get nextAttemptAt => $composableBuilder(
      column: $table.nextAttemptAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$SyncOutboxTableAnnotationComposer
    extends Composer<_$FieldDatabase, $SyncOutboxTable> {
  $$SyncOutboxTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get clientOperationId => $composableBuilder(
      column: $table.clientOperationId, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => column);

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<int> get baseVersion => $composableBuilder(
      column: $table.baseVersion, builder: (column) => column);

  GeneratedColumn<String> get payloadJson => $composableBuilder(
      column: $table.payloadJson, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<DateTime> get nextAttemptAt => $composableBuilder(
      column: $table.nextAttemptAt, builder: (column) => column);

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SyncOutboxTableTableManager extends RootTableManager<
    _$FieldDatabase,
    $SyncOutboxTable,
    SyncOutboxData,
    $$SyncOutboxTableFilterComposer,
    $$SyncOutboxTableOrderingComposer,
    $$SyncOutboxTableAnnotationComposer,
    $$SyncOutboxTableCreateCompanionBuilder,
    $$SyncOutboxTableUpdateCompanionBuilder,
    (
      SyncOutboxData,
      BaseReferences<_$FieldDatabase, $SyncOutboxTable, SyncOutboxData>
    ),
    SyncOutboxData,
    PrefetchHooks Function()> {
  $$SyncOutboxTableTableManager(_$FieldDatabase db, $SyncOutboxTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncOutboxTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncOutboxTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncOutboxTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> clientOperationId = const Value.absent(),
            Value<String> entityType = const Value.absent(),
            Value<String> entityId = const Value.absent(),
            Value<String> operation = const Value.absent(),
            Value<int?> baseVersion = const Value.absent(),
            Value<String> payloadJson = const Value.absent(),
            Value<String> state = const Value.absent(),
            Value<int> attempts = const Value.absent(),
            Value<DateTime?> nextAttemptAt = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncOutboxCompanion(
            clientOperationId: clientOperationId,
            entityType: entityType,
            entityId: entityId,
            operation: operation,
            baseVersion: baseVersion,
            payloadJson: payloadJson,
            state: state,
            attempts: attempts,
            nextAttemptAt: nextAttemptAt,
            lastError: lastError,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String clientOperationId,
            required String entityType,
            required String entityId,
            required String operation,
            Value<int?> baseVersion = const Value.absent(),
            required String payloadJson,
            Value<String> state = const Value.absent(),
            Value<int> attempts = const Value.absent(),
            Value<DateTime?> nextAttemptAt = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncOutboxCompanion.insert(
            clientOperationId: clientOperationId,
            entityType: entityType,
            entityId: entityId,
            operation: operation,
            baseVersion: baseVersion,
            payloadJson: payloadJson,
            state: state,
            attempts: attempts,
            nextAttemptAt: nextAttemptAt,
            lastError: lastError,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$SyncOutboxTable, SyncOutboxData>(table),
                    BaseReferences<_$FieldDatabase, $SyncOutboxTable,
                        SyncOutboxData>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncOutboxTableProcessedTableManager = ProcessedTableManager<
    _$FieldDatabase,
    $SyncOutboxTable,
    SyncOutboxData,
    $$SyncOutboxTableFilterComposer,
    $$SyncOutboxTableOrderingComposer,
    $$SyncOutboxTableAnnotationComposer,
    $$SyncOutboxTableCreateCompanionBuilder,
    $$SyncOutboxTableUpdateCompanionBuilder,
    (
      SyncOutboxData,
      BaseReferences<_$FieldDatabase, $SyncOutboxTable, SyncOutboxData>
    ),
    SyncOutboxData,
    PrefetchHooks Function()>;
typedef $$SyncCheckpointsTableCreateCompanionBuilder = SyncCheckpointsCompanion
    Function({
  required String scope,
  Value<String?> cursor,
  Value<DateTime?> serverWatermark,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$SyncCheckpointsTableUpdateCompanionBuilder = SyncCheckpointsCompanion
    Function({
  Value<String> scope,
  Value<String?> cursor,
  Value<DateTime?> serverWatermark,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$SyncCheckpointsTableFilterComposer
    extends Composer<_$FieldDatabase, $SyncCheckpointsTable> {
  $$SyncCheckpointsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get scope => $composableBuilder(
      column: $table.scope, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cursor => $composableBuilder(
      column: $table.cursor, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get serverWatermark => $composableBuilder(
      column: $table.serverWatermark,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$SyncCheckpointsTableOrderingComposer
    extends Composer<_$FieldDatabase, $SyncCheckpointsTable> {
  $$SyncCheckpointsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get scope => $composableBuilder(
      column: $table.scope, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cursor => $composableBuilder(
      column: $table.cursor, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get serverWatermark => $composableBuilder(
      column: $table.serverWatermark,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$SyncCheckpointsTableAnnotationComposer
    extends Composer<_$FieldDatabase, $SyncCheckpointsTable> {
  $$SyncCheckpointsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get scope =>
      $composableBuilder(column: $table.scope, builder: (column) => column);

  GeneratedColumn<String> get cursor =>
      $composableBuilder(column: $table.cursor, builder: (column) => column);

  GeneratedColumn<DateTime> get serverWatermark => $composableBuilder(
      column: $table.serverWatermark, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SyncCheckpointsTableTableManager extends RootTableManager<
    _$FieldDatabase,
    $SyncCheckpointsTable,
    SyncCheckpoint,
    $$SyncCheckpointsTableFilterComposer,
    $$SyncCheckpointsTableOrderingComposer,
    $$SyncCheckpointsTableAnnotationComposer,
    $$SyncCheckpointsTableCreateCompanionBuilder,
    $$SyncCheckpointsTableUpdateCompanionBuilder,
    (
      SyncCheckpoint,
      BaseReferences<_$FieldDatabase, $SyncCheckpointsTable, SyncCheckpoint>
    ),
    SyncCheckpoint,
    PrefetchHooks Function()> {
  $$SyncCheckpointsTableTableManager(
      _$FieldDatabase db, $SyncCheckpointsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncCheckpointsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncCheckpointsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncCheckpointsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> scope = const Value.absent(),
            Value<String?> cursor = const Value.absent(),
            Value<DateTime?> serverWatermark = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncCheckpointsCompanion(
            scope: scope,
            cursor: cursor,
            serverWatermark: serverWatermark,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String scope,
            Value<String?> cursor = const Value.absent(),
            Value<DateTime?> serverWatermark = const Value.absent(),
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncCheckpointsCompanion.insert(
            scope: scope,
            cursor: cursor,
            serverWatermark: serverWatermark,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$SyncCheckpointsTable, SyncCheckpoint>(table),
                    BaseReferences<_$FieldDatabase, $SyncCheckpointsTable,
                        SyncCheckpoint>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncCheckpointsTableProcessedTableManager = ProcessedTableManager<
    _$FieldDatabase,
    $SyncCheckpointsTable,
    SyncCheckpoint,
    $$SyncCheckpointsTableFilterComposer,
    $$SyncCheckpointsTableOrderingComposer,
    $$SyncCheckpointsTableAnnotationComposer,
    $$SyncCheckpointsTableCreateCompanionBuilder,
    $$SyncCheckpointsTableUpdateCompanionBuilder,
    (
      SyncCheckpoint,
      BaseReferences<_$FieldDatabase, $SyncCheckpointsTable, SyncCheckpoint>
    ),
    SyncCheckpoint,
    PrefetchHooks Function()>;
typedef $$AttachmentQueueTableCreateCompanionBuilder = AttachmentQueueCompanion
    Function({
  required String id,
  required String localPath,
  required String sha256,
  required int sizeBytes,
  required String mimeType,
  Value<String> state,
  Value<int> attempts,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$AttachmentQueueTableUpdateCompanionBuilder = AttachmentQueueCompanion
    Function({
  Value<String> id,
  Value<String> localPath,
  Value<String> sha256,
  Value<int> sizeBytes,
  Value<String> mimeType,
  Value<String> state,
  Value<int> attempts,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$AttachmentQueueTableFilterComposer
    extends Composer<_$FieldDatabase, $AttachmentQueueTable> {
  $$AttachmentQueueTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localPath => $composableBuilder(
      column: $table.localPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sha256 => $composableBuilder(
      column: $table.sha256, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sizeBytes => $composableBuilder(
      column: $table.sizeBytes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mimeType => $composableBuilder(
      column: $table.mimeType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$AttachmentQueueTableOrderingComposer
    extends Composer<_$FieldDatabase, $AttachmentQueueTable> {
  $$AttachmentQueueTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localPath => $composableBuilder(
      column: $table.localPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sha256 => $composableBuilder(
      column: $table.sha256, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sizeBytes => $composableBuilder(
      column: $table.sizeBytes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mimeType => $composableBuilder(
      column: $table.mimeType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$AttachmentQueueTableAnnotationComposer
    extends Composer<_$FieldDatabase, $AttachmentQueueTable> {
  $$AttachmentQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<String> get sha256 =>
      $composableBuilder(column: $table.sha256, builder: (column) => column);

  GeneratedColumn<int> get sizeBytes =>
      $composableBuilder(column: $table.sizeBytes, builder: (column) => column);

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AttachmentQueueTableTableManager extends RootTableManager<
    _$FieldDatabase,
    $AttachmentQueueTable,
    AttachmentQueueData,
    $$AttachmentQueueTableFilterComposer,
    $$AttachmentQueueTableOrderingComposer,
    $$AttachmentQueueTableAnnotationComposer,
    $$AttachmentQueueTableCreateCompanionBuilder,
    $$AttachmentQueueTableUpdateCompanionBuilder,
    (
      AttachmentQueueData,
      BaseReferences<_$FieldDatabase, $AttachmentQueueTable,
          AttachmentQueueData>
    ),
    AttachmentQueueData,
    PrefetchHooks Function()> {
  $$AttachmentQueueTableTableManager(
      _$FieldDatabase db, $AttachmentQueueTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttachmentQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttachmentQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttachmentQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> localPath = const Value.absent(),
            Value<String> sha256 = const Value.absent(),
            Value<int> sizeBytes = const Value.absent(),
            Value<String> mimeType = const Value.absent(),
            Value<String> state = const Value.absent(),
            Value<int> attempts = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AttachmentQueueCompanion(
            id: id,
            localPath: localPath,
            sha256: sha256,
            sizeBytes: sizeBytes,
            mimeType: mimeType,
            state: state,
            attempts: attempts,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String localPath,
            required String sha256,
            required int sizeBytes,
            required String mimeType,
            Value<String> state = const Value.absent(),
            Value<int> attempts = const Value.absent(),
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              AttachmentQueueCompanion.insert(
            id: id,
            localPath: localPath,
            sha256: sha256,
            sizeBytes: sizeBytes,
            mimeType: mimeType,
            state: state,
            attempts: attempts,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$AttachmentQueueTable, AttachmentQueueData>(
                        table),
                    BaseReferences<_$FieldDatabase, $AttachmentQueueTable,
                        AttachmentQueueData>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AttachmentQueueTableProcessedTableManager = ProcessedTableManager<
    _$FieldDatabase,
    $AttachmentQueueTable,
    AttachmentQueueData,
    $$AttachmentQueueTableFilterComposer,
    $$AttachmentQueueTableOrderingComposer,
    $$AttachmentQueueTableAnnotationComposer,
    $$AttachmentQueueTableCreateCompanionBuilder,
    $$AttachmentQueueTableUpdateCompanionBuilder,
    (
      AttachmentQueueData,
      BaseReferences<_$FieldDatabase, $AttachmentQueueTable,
          AttachmentQueueData>
    ),
    AttachmentQueueData,
    PrefetchHooks Function()>;
typedef $$LocalDocumentsTableCreateCompanionBuilder = LocalDocumentsCompanion
    Function({
  required String collection,
  required String id,
  required String valueJson,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$LocalDocumentsTableUpdateCompanionBuilder = LocalDocumentsCompanion
    Function({
  Value<String> collection,
  Value<String> id,
  Value<String> valueJson,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$LocalDocumentsTableFilterComposer
    extends Composer<_$FieldDatabase, $LocalDocumentsTable> {
  $$LocalDocumentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get collection => $composableBuilder(
      column: $table.collection, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get valueJson => $composableBuilder(
      column: $table.valueJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$LocalDocumentsTableOrderingComposer
    extends Composer<_$FieldDatabase, $LocalDocumentsTable> {
  $$LocalDocumentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get collection => $composableBuilder(
      column: $table.collection, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get valueJson => $composableBuilder(
      column: $table.valueJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$LocalDocumentsTableAnnotationComposer
    extends Composer<_$FieldDatabase, $LocalDocumentsTable> {
  $$LocalDocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get collection => $composableBuilder(
      column: $table.collection, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get valueJson =>
      $composableBuilder(column: $table.valueJson, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$LocalDocumentsTableTableManager extends RootTableManager<
    _$FieldDatabase,
    $LocalDocumentsTable,
    LocalDocument,
    $$LocalDocumentsTableFilterComposer,
    $$LocalDocumentsTableOrderingComposer,
    $$LocalDocumentsTableAnnotationComposer,
    $$LocalDocumentsTableCreateCompanionBuilder,
    $$LocalDocumentsTableUpdateCompanionBuilder,
    (
      LocalDocument,
      BaseReferences<_$FieldDatabase, $LocalDocumentsTable, LocalDocument>
    ),
    LocalDocument,
    PrefetchHooks Function()> {
  $$LocalDocumentsTableTableManager(
      _$FieldDatabase db, $LocalDocumentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalDocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalDocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalDocumentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> collection = const Value.absent(),
            Value<String> id = const Value.absent(),
            Value<String> valueJson = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LocalDocumentsCompanion(
            collection: collection,
            id: id,
            valueJson: valueJson,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String collection,
            required String id,
            required String valueJson,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              LocalDocumentsCompanion.insert(
            collection: collection,
            id: id,
            valueJson: valueJson,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$LocalDocumentsTable, LocalDocument>(table),
                    BaseReferences<_$FieldDatabase, $LocalDocumentsTable,
                        LocalDocument>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalDocumentsTableProcessedTableManager = ProcessedTableManager<
    _$FieldDatabase,
    $LocalDocumentsTable,
    LocalDocument,
    $$LocalDocumentsTableFilterComposer,
    $$LocalDocumentsTableOrderingComposer,
    $$LocalDocumentsTableAnnotationComposer,
    $$LocalDocumentsTableCreateCompanionBuilder,
    $$LocalDocumentsTableUpdateCompanionBuilder,
    (
      LocalDocument,
      BaseReferences<_$FieldDatabase, $LocalDocumentsTable, LocalDocument>
    ),
    LocalDocument,
    PrefetchHooks Function()>;

class $FieldDatabaseManager {
  final _$FieldDatabase _db;
  $FieldDatabaseManager(this._db);
  $$LocalMissionsTableTableManager get localMissions =>
      $$LocalMissionsTableTableManager(_db, _db.localMissions);
  $$FormDraftsTableTableManager get formDrafts =>
      $$FormDraftsTableTableManager(_db, _db.formDrafts);
  $$SyncOutboxTableTableManager get syncOutbox =>
      $$SyncOutboxTableTableManager(_db, _db.syncOutbox);
  $$SyncCheckpointsTableTableManager get syncCheckpoints =>
      $$SyncCheckpointsTableTableManager(_db, _db.syncCheckpoints);
  $$AttachmentQueueTableTableManager get attachmentQueue =>
      $$AttachmentQueueTableTableManager(_db, _db.attachmentQueue);
  $$LocalDocumentsTableTableManager get localDocuments =>
      $$LocalDocumentsTableTableManager(_db, _db.localDocuments);
}
