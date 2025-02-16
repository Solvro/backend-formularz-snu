/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'participant.dart' as _i2;
import 'form_data.dart' as _i3;

abstract class FormEntry implements _i1.TableRow, _i1.ProtocolSerialization {
  FormEntry._({
    this.id,
    required this.participantId,
    this.participant,
    DateTime? timestamp,
    required this.data,
  }) : timestamp = timestamp ?? DateTime.now();

  factory FormEntry({
    int? id,
    required int participantId,
    _i2.Participant? participant,
    DateTime? timestamp,
    required _i3.FormData data,
  }) = _FormEntryImpl;

  factory FormEntry.fromJson(Map<String, dynamic> jsonSerialization) {
    return FormEntry(
      id: jsonSerialization['id'] as int?,
      participantId: jsonSerialization['participantId'] as int,
      participant: jsonSerialization['participant'] == null
          ? null
          : _i2.Participant.fromJson(
              (jsonSerialization['participant'] as Map<String, dynamic>)),
      timestamp:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['timestamp']),
      data: _i3.FormData.fromJson(
          (jsonSerialization['data'] as Map<String, dynamic>)),
    );
  }

  static final t = FormEntryTable();

  static const db = FormEntryRepository._();

  @override
  int? id;

  int participantId;

  _i2.Participant? participant;

  DateTime timestamp;

  _i3.FormData data;

  @override
  _i1.Table get table => t;

  FormEntry copyWith({
    int? id,
    int? participantId,
    _i2.Participant? participant,
    DateTime? timestamp,
    _i3.FormData? data,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'participantId': participantId,
      if (participant != null) 'participant': participant?.toJson(),
      'timestamp': timestamp.toJson(),
      'data': data.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'participantId': participantId,
      if (participant != null) 'participant': participant?.toJsonForProtocol(),
      'timestamp': timestamp.toJson(),
      'data': data.toJsonForProtocol(),
    };
  }

  static FormEntryInclude include({_i2.ParticipantInclude? participant}) {
    return FormEntryInclude._(participant: participant);
  }

  static FormEntryIncludeList includeList({
    _i1.WhereExpressionBuilder<FormEntryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FormEntryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FormEntryTable>? orderByList,
    FormEntryInclude? include,
  }) {
    return FormEntryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FormEntry.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(FormEntry.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FormEntryImpl extends FormEntry {
  _FormEntryImpl({
    int? id,
    required int participantId,
    _i2.Participant? participant,
    DateTime? timestamp,
    required _i3.FormData data,
  }) : super._(
          id: id,
          participantId: participantId,
          participant: participant,
          timestamp: timestamp,
          data: data,
        );

  @override
  FormEntry copyWith({
    Object? id = _Undefined,
    int? participantId,
    Object? participant = _Undefined,
    DateTime? timestamp,
    _i3.FormData? data,
  }) {
    return FormEntry(
      id: id is int? ? id : this.id,
      participantId: participantId ?? this.participantId,
      participant: participant is _i2.Participant?
          ? participant
          : this.participant?.copyWith(),
      timestamp: timestamp ?? this.timestamp,
      data: data ?? this.data.copyWith(),
    );
  }
}

class FormEntryTable extends _i1.Table {
  FormEntryTable({super.tableRelation}) : super(tableName: 'form_entries') {
    participantId = _i1.ColumnInt(
      'participantId',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
      this,
      hasDefault: true,
    );
    data = _i1.ColumnSerializable(
      'data',
      this,
    );
  }

  late final _i1.ColumnInt participantId;

  _i2.ParticipantTable? _participant;

  late final _i1.ColumnDateTime timestamp;

  late final _i1.ColumnSerializable data;

  _i2.ParticipantTable get participant {
    if (_participant != null) return _participant!;
    _participant = _i1.createRelationTable(
      relationFieldName: 'participant',
      field: FormEntry.t.participantId,
      foreignField: _i2.Participant.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ParticipantTable(tableRelation: foreignTableRelation),
    );
    return _participant!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        participantId,
        timestamp,
        data,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'participant') {
      return participant;
    }
    return null;
  }
}

class FormEntryInclude extends _i1.IncludeObject {
  FormEntryInclude._({_i2.ParticipantInclude? participant}) {
    _participant = participant;
  }

  _i2.ParticipantInclude? _participant;

  @override
  Map<String, _i1.Include?> get includes => {'participant': _participant};

  @override
  _i1.Table get table => FormEntry.t;
}

class FormEntryIncludeList extends _i1.IncludeList {
  FormEntryIncludeList._({
    _i1.WhereExpressionBuilder<FormEntryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(FormEntry.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => FormEntry.t;
}

class FormEntryRepository {
  const FormEntryRepository._();

  final attachRow = const FormEntryAttachRowRepository._();

  Future<List<FormEntry>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FormEntryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FormEntryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FormEntryTable>? orderByList,
    _i1.Transaction? transaction,
    FormEntryInclude? include,
  }) async {
    return session.db.find<FormEntry>(
      where: where?.call(FormEntry.t),
      orderBy: orderBy?.call(FormEntry.t),
      orderByList: orderByList?.call(FormEntry.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<FormEntry?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FormEntryTable>? where,
    int? offset,
    _i1.OrderByBuilder<FormEntryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FormEntryTable>? orderByList,
    _i1.Transaction? transaction,
    FormEntryInclude? include,
  }) async {
    return session.db.findFirstRow<FormEntry>(
      where: where?.call(FormEntry.t),
      orderBy: orderBy?.call(FormEntry.t),
      orderByList: orderByList?.call(FormEntry.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<FormEntry?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    FormEntryInclude? include,
  }) async {
    return session.db.findById<FormEntry>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<FormEntry>> insert(
    _i1.Session session,
    List<FormEntry> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<FormEntry>(
      rows,
      transaction: transaction,
    );
  }

  Future<FormEntry> insertRow(
    _i1.Session session,
    FormEntry row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<FormEntry>(
      row,
      transaction: transaction,
    );
  }

  Future<List<FormEntry>> update(
    _i1.Session session,
    List<FormEntry> rows, {
    _i1.ColumnSelections<FormEntryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<FormEntry>(
      rows,
      columns: columns?.call(FormEntry.t),
      transaction: transaction,
    );
  }

  Future<FormEntry> updateRow(
    _i1.Session session,
    FormEntry row, {
    _i1.ColumnSelections<FormEntryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<FormEntry>(
      row,
      columns: columns?.call(FormEntry.t),
      transaction: transaction,
    );
  }

  Future<List<FormEntry>> delete(
    _i1.Session session,
    List<FormEntry> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<FormEntry>(
      rows,
      transaction: transaction,
    );
  }

  Future<FormEntry> deleteRow(
    _i1.Session session,
    FormEntry row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<FormEntry>(
      row,
      transaction: transaction,
    );
  }

  Future<List<FormEntry>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FormEntryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<FormEntry>(
      where: where(FormEntry.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FormEntryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<FormEntry>(
      where: where?.call(FormEntry.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class FormEntryAttachRowRepository {
  const FormEntryAttachRowRepository._();

  Future<void> participant(
    _i1.Session session,
    FormEntry formEntry,
    _i2.Participant participant, {
    _i1.Transaction? transaction,
  }) async {
    if (formEntry.id == null) {
      throw ArgumentError.notNull('formEntry.id');
    }
    if (participant.id == null) {
      throw ArgumentError.notNull('participant.id');
    }

    var $formEntry = formEntry.copyWith(participantId: participant.id);
    await session.db.updateRow<FormEntry>(
      $formEntry,
      columns: [FormEntry.t.participantId],
      transaction: transaction,
    );
  }
}
