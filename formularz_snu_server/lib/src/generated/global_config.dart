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

abstract class GlobalConfig implements _i1.TableRow, _i1.ProtocolSerialization {
  GlobalConfig._({
    this.id,
    required this.researchStartDate,
    required this.researchEndDate,
  });

  factory GlobalConfig({
    int? id,
    required DateTime researchStartDate,
    required DateTime researchEndDate,
  }) = _GlobalConfigImpl;

  factory GlobalConfig.fromJson(Map<String, dynamic> jsonSerialization) {
    return GlobalConfig(
      id: jsonSerialization['id'] as int?,
      researchStartDate: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['researchStartDate']),
      researchEndDate: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['researchEndDate']),
    );
  }

  static final t = GlobalConfigTable();

  static const db = GlobalConfigRepository._();

  @override
  int? id;

  DateTime researchStartDate;

  DateTime researchEndDate;

  @override
  _i1.Table get table => t;

  GlobalConfig copyWith({
    int? id,
    DateTime? researchStartDate,
    DateTime? researchEndDate,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'researchStartDate': researchStartDate.toJson(),
      'researchEndDate': researchEndDate.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'researchStartDate': researchStartDate.toJson(),
      'researchEndDate': researchEndDate.toJson(),
    };
  }

  static GlobalConfigInclude include() {
    return GlobalConfigInclude._();
  }

  static GlobalConfigIncludeList includeList({
    _i1.WhereExpressionBuilder<GlobalConfigTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GlobalConfigTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GlobalConfigTable>? orderByList,
    GlobalConfigInclude? include,
  }) {
    return GlobalConfigIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GlobalConfig.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GlobalConfig.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GlobalConfigImpl extends GlobalConfig {
  _GlobalConfigImpl({
    int? id,
    required DateTime researchStartDate,
    required DateTime researchEndDate,
  }) : super._(
          id: id,
          researchStartDate: researchStartDate,
          researchEndDate: researchEndDate,
        );

  @override
  GlobalConfig copyWith({
    Object? id = _Undefined,
    DateTime? researchStartDate,
    DateTime? researchEndDate,
  }) {
    return GlobalConfig(
      id: id is int? ? id : this.id,
      researchStartDate: researchStartDate ?? this.researchStartDate,
      researchEndDate: researchEndDate ?? this.researchEndDate,
    );
  }
}

class GlobalConfigTable extends _i1.Table {
  GlobalConfigTable({super.tableRelation}) : super(tableName: 'global_config') {
    researchStartDate = _i1.ColumnDateTime(
      'researchStartDate',
      this,
    );
    researchEndDate = _i1.ColumnDateTime(
      'researchEndDate',
      this,
    );
  }

  late final _i1.ColumnDateTime researchStartDate;

  late final _i1.ColumnDateTime researchEndDate;

  @override
  List<_i1.Column> get columns => [
        id,
        researchStartDate,
        researchEndDate,
      ];
}

class GlobalConfigInclude extends _i1.IncludeObject {
  GlobalConfigInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => GlobalConfig.t;
}

class GlobalConfigIncludeList extends _i1.IncludeList {
  GlobalConfigIncludeList._({
    _i1.WhereExpressionBuilder<GlobalConfigTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GlobalConfig.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => GlobalConfig.t;
}

class GlobalConfigRepository {
  const GlobalConfigRepository._();

  Future<List<GlobalConfig>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GlobalConfigTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GlobalConfigTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GlobalConfigTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<GlobalConfig>(
      where: where?.call(GlobalConfig.t),
      orderBy: orderBy?.call(GlobalConfig.t),
      orderByList: orderByList?.call(GlobalConfig.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<GlobalConfig?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GlobalConfigTable>? where,
    int? offset,
    _i1.OrderByBuilder<GlobalConfigTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GlobalConfigTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<GlobalConfig>(
      where: where?.call(GlobalConfig.t),
      orderBy: orderBy?.call(GlobalConfig.t),
      orderByList: orderByList?.call(GlobalConfig.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<GlobalConfig?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<GlobalConfig>(
      id,
      transaction: transaction,
    );
  }

  Future<List<GlobalConfig>> insert(
    _i1.Session session,
    List<GlobalConfig> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GlobalConfig>(
      rows,
      transaction: transaction,
    );
  }

  Future<GlobalConfig> insertRow(
    _i1.Session session,
    GlobalConfig row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GlobalConfig>(
      row,
      transaction: transaction,
    );
  }

  Future<List<GlobalConfig>> update(
    _i1.Session session,
    List<GlobalConfig> rows, {
    _i1.ColumnSelections<GlobalConfigTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GlobalConfig>(
      rows,
      columns: columns?.call(GlobalConfig.t),
      transaction: transaction,
    );
  }

  Future<GlobalConfig> updateRow(
    _i1.Session session,
    GlobalConfig row, {
    _i1.ColumnSelections<GlobalConfigTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GlobalConfig>(
      row,
      columns: columns?.call(GlobalConfig.t),
      transaction: transaction,
    );
  }

  Future<List<GlobalConfig>> delete(
    _i1.Session session,
    List<GlobalConfig> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GlobalConfig>(
      rows,
      transaction: transaction,
    );
  }

  Future<GlobalConfig> deleteRow(
    _i1.Session session,
    GlobalConfig row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GlobalConfig>(
      row,
      transaction: transaction,
    );
  }

  Future<List<GlobalConfig>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GlobalConfigTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GlobalConfig>(
      where: where(GlobalConfig.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GlobalConfigTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GlobalConfig>(
      where: where?.call(GlobalConfig.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
