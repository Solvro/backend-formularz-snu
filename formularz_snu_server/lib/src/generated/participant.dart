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

abstract class Participant implements _i1.TableRow, _i1.ProtocolSerialization {
  Participant._({
    this.id,
    required this.name,
    required this.email,
  });

  factory Participant({
    int? id,
    required String name,
    required String email,
  }) = _ParticipantImpl;

  factory Participant.fromJson(Map<String, dynamic> jsonSerialization) {
    return Participant(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      email: jsonSerialization['email'] as String,
    );
  }

  static final t = ParticipantTable();

  static const db = ParticipantRepository._();

  @override
  int? id;

  String name;

  String email;

  @override
  _i1.Table get table => t;

  Participant copyWith({
    int? id,
    String? name,
    String? email,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'email': email,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'email': email,
    };
  }

  static ParticipantInclude include() {
    return ParticipantInclude._();
  }

  static ParticipantIncludeList includeList({
    _i1.WhereExpressionBuilder<ParticipantTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ParticipantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ParticipantTable>? orderByList,
    ParticipantInclude? include,
  }) {
    return ParticipantIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Participant.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Participant.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ParticipantImpl extends Participant {
  _ParticipantImpl({
    int? id,
    required String name,
    required String email,
  }) : super._(
          id: id,
          name: name,
          email: email,
        );

  @override
  Participant copyWith({
    Object? id = _Undefined,
    String? name,
    String? email,
  }) {
    return Participant(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}

class ParticipantTable extends _i1.Table {
  ParticipantTable({super.tableRelation}) : super(tableName: 'participants') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString email;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        email,
      ];
}

class ParticipantInclude extends _i1.IncludeObject {
  ParticipantInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Participant.t;
}

class ParticipantIncludeList extends _i1.IncludeList {
  ParticipantIncludeList._({
    _i1.WhereExpressionBuilder<ParticipantTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Participant.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Participant.t;
}

class ParticipantRepository {
  const ParticipantRepository._();

  Future<List<Participant>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ParticipantTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ParticipantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ParticipantTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Participant>(
      where: where?.call(Participant.t),
      orderBy: orderBy?.call(Participant.t),
      orderByList: orderByList?.call(Participant.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Participant?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ParticipantTable>? where,
    int? offset,
    _i1.OrderByBuilder<ParticipantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ParticipantTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Participant>(
      where: where?.call(Participant.t),
      orderBy: orderBy?.call(Participant.t),
      orderByList: orderByList?.call(Participant.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Participant?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Participant>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Participant>> insert(
    _i1.Session session,
    List<Participant> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Participant>(
      rows,
      transaction: transaction,
    );
  }

  Future<Participant> insertRow(
    _i1.Session session,
    Participant row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Participant>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Participant>> update(
    _i1.Session session,
    List<Participant> rows, {
    _i1.ColumnSelections<ParticipantTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Participant>(
      rows,
      columns: columns?.call(Participant.t),
      transaction: transaction,
    );
  }

  Future<Participant> updateRow(
    _i1.Session session,
    Participant row, {
    _i1.ColumnSelections<ParticipantTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Participant>(
      row,
      columns: columns?.call(Participant.t),
      transaction: transaction,
    );
  }

  Future<List<Participant>> delete(
    _i1.Session session,
    List<Participant> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Participant>(
      rows,
      transaction: transaction,
    );
  }

  Future<Participant> deleteRow(
    _i1.Session session,
    Participant row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Participant>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Participant>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ParticipantTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Participant>(
      where: where(Participant.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ParticipantTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Participant>(
      where: where?.call(Participant.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
