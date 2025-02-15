/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class GlobalConfig implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime researchStartDate;

  DateTime researchEndDate;

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
