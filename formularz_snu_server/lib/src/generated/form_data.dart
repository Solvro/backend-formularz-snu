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

abstract class FormData implements _i1.TableRow, _i1.ProtocolSerialization {
  FormData._({
    this.id,
    required this.inBedStartTime,
    required this.fallingAsleepTime,
    required this.midNightAwaikingsCount,
    required this.totalMidNightAwaikingsTime,
    required this.wakeUpTime,
    required this.outBedTime,
  });

  factory FormData({
    int? id,
    required DateTime inBedStartTime,
    required DateTime fallingAsleepTime,
    required int midNightAwaikingsCount,
    required Duration totalMidNightAwaikingsTime,
    required DateTime wakeUpTime,
    required DateTime outBedTime,
  }) = _FormDataImpl;

  factory FormData.fromJson(Map<String, dynamic> jsonSerialization) {
    return FormData(
      id: jsonSerialization['id'] as int?,
      inBedStartTime: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['inBedStartTime']),
      fallingAsleepTime: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['fallingAsleepTime']),
      midNightAwaikingsCount:
          jsonSerialization['midNightAwaikingsCount'] as int,
      totalMidNightAwaikingsTime: _i1.DurationJsonExtension.fromJson(
          jsonSerialization['totalMidNightAwaikingsTime']),
      wakeUpTime:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['wakeUpTime']),
      outBedTime:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['outBedTime']),
    );
  }

  static final t = FormDataTable();

  static const db = FormDataRepository._();

  @override
  int? id;

  DateTime inBedStartTime;

  DateTime fallingAsleepTime;

  int midNightAwaikingsCount;

  Duration totalMidNightAwaikingsTime;

  DateTime wakeUpTime;

  DateTime outBedTime;

  @override
  _i1.Table get table => t;

  FormData copyWith({
    int? id,
    DateTime? inBedStartTime,
    DateTime? fallingAsleepTime,
    int? midNightAwaikingsCount,
    Duration? totalMidNightAwaikingsTime,
    DateTime? wakeUpTime,
    DateTime? outBedTime,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'inBedStartTime': inBedStartTime.toJson(),
      'fallingAsleepTime': fallingAsleepTime.toJson(),
      'midNightAwaikingsCount': midNightAwaikingsCount,
      'totalMidNightAwaikingsTime': totalMidNightAwaikingsTime.toJson(),
      'wakeUpTime': wakeUpTime.toJson(),
      'outBedTime': outBedTime.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'inBedStartTime': inBedStartTime.toJson(),
      'fallingAsleepTime': fallingAsleepTime.toJson(),
      'midNightAwaikingsCount': midNightAwaikingsCount,
      'totalMidNightAwaikingsTime': totalMidNightAwaikingsTime.toJson(),
      'wakeUpTime': wakeUpTime.toJson(),
      'outBedTime': outBedTime.toJson(),
    };
  }

  static FormDataInclude include() {
    return FormDataInclude._();
  }

  static FormDataIncludeList includeList({
    _i1.WhereExpressionBuilder<FormDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FormDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FormDataTable>? orderByList,
    FormDataInclude? include,
  }) {
    return FormDataIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FormData.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(FormData.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FormDataImpl extends FormData {
  _FormDataImpl({
    int? id,
    required DateTime inBedStartTime,
    required DateTime fallingAsleepTime,
    required int midNightAwaikingsCount,
    required Duration totalMidNightAwaikingsTime,
    required DateTime wakeUpTime,
    required DateTime outBedTime,
  }) : super._(
          id: id,
          inBedStartTime: inBedStartTime,
          fallingAsleepTime: fallingAsleepTime,
          midNightAwaikingsCount: midNightAwaikingsCount,
          totalMidNightAwaikingsTime: totalMidNightAwaikingsTime,
          wakeUpTime: wakeUpTime,
          outBedTime: outBedTime,
        );

  @override
  FormData copyWith({
    Object? id = _Undefined,
    DateTime? inBedStartTime,
    DateTime? fallingAsleepTime,
    int? midNightAwaikingsCount,
    Duration? totalMidNightAwaikingsTime,
    DateTime? wakeUpTime,
    DateTime? outBedTime,
  }) {
    return FormData(
      id: id is int? ? id : this.id,
      inBedStartTime: inBedStartTime ?? this.inBedStartTime,
      fallingAsleepTime: fallingAsleepTime ?? this.fallingAsleepTime,
      midNightAwaikingsCount:
          midNightAwaikingsCount ?? this.midNightAwaikingsCount,
      totalMidNightAwaikingsTime:
          totalMidNightAwaikingsTime ?? this.totalMidNightAwaikingsTime,
      wakeUpTime: wakeUpTime ?? this.wakeUpTime,
      outBedTime: outBedTime ?? this.outBedTime,
    );
  }
}

class FormDataTable extends _i1.Table {
  FormDataTable({super.tableRelation}) : super(tableName: 'form_data') {
    inBedStartTime = _i1.ColumnDateTime(
      'inBedStartTime',
      this,
    );
    fallingAsleepTime = _i1.ColumnDateTime(
      'fallingAsleepTime',
      this,
    );
    midNightAwaikingsCount = _i1.ColumnInt(
      'midNightAwaikingsCount',
      this,
    );
    totalMidNightAwaikingsTime = _i1.ColumnDuration(
      'totalMidNightAwaikingsTime',
      this,
    );
    wakeUpTime = _i1.ColumnDateTime(
      'wakeUpTime',
      this,
    );
    outBedTime = _i1.ColumnDateTime(
      'outBedTime',
      this,
    );
  }

  late final _i1.ColumnDateTime inBedStartTime;

  late final _i1.ColumnDateTime fallingAsleepTime;

  late final _i1.ColumnInt midNightAwaikingsCount;

  late final _i1.ColumnDuration totalMidNightAwaikingsTime;

  late final _i1.ColumnDateTime wakeUpTime;

  late final _i1.ColumnDateTime outBedTime;

  @override
  List<_i1.Column> get columns => [
        id,
        inBedStartTime,
        fallingAsleepTime,
        midNightAwaikingsCount,
        totalMidNightAwaikingsTime,
        wakeUpTime,
        outBedTime,
      ];
}

class FormDataInclude extends _i1.IncludeObject {
  FormDataInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => FormData.t;
}

class FormDataIncludeList extends _i1.IncludeList {
  FormDataIncludeList._({
    _i1.WhereExpressionBuilder<FormDataTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(FormData.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => FormData.t;
}

class FormDataRepository {
  const FormDataRepository._();

  Future<List<FormData>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FormDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FormDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FormDataTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<FormData>(
      where: where?.call(FormData.t),
      orderBy: orderBy?.call(FormData.t),
      orderByList: orderByList?.call(FormData.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<FormData?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FormDataTable>? where,
    int? offset,
    _i1.OrderByBuilder<FormDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FormDataTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<FormData>(
      where: where?.call(FormData.t),
      orderBy: orderBy?.call(FormData.t),
      orderByList: orderByList?.call(FormData.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<FormData?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<FormData>(
      id,
      transaction: transaction,
    );
  }

  Future<List<FormData>> insert(
    _i1.Session session,
    List<FormData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<FormData>(
      rows,
      transaction: transaction,
    );
  }

  Future<FormData> insertRow(
    _i1.Session session,
    FormData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<FormData>(
      row,
      transaction: transaction,
    );
  }

  Future<List<FormData>> update(
    _i1.Session session,
    List<FormData> rows, {
    _i1.ColumnSelections<FormDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<FormData>(
      rows,
      columns: columns?.call(FormData.t),
      transaction: transaction,
    );
  }

  Future<FormData> updateRow(
    _i1.Session session,
    FormData row, {
    _i1.ColumnSelections<FormDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<FormData>(
      row,
      columns: columns?.call(FormData.t),
      transaction: transaction,
    );
  }

  Future<List<FormData>> delete(
    _i1.Session session,
    List<FormData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<FormData>(
      rows,
      transaction: transaction,
    );
  }

  Future<FormData> deleteRow(
    _i1.Session session,
    FormData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<FormData>(
      row,
      transaction: transaction,
    );
  }

  Future<List<FormData>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FormDataTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<FormData>(
      where: where(FormData.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FormDataTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<FormData>(
      where: where?.call(FormData.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
