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
import 'participant.dart' as _i2;
import 'form_data.dart' as _i3;

abstract class FormEntry implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int participantId;

  _i2.Participant? participant;

  DateTime timestamp;

  _i3.FormData data;

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
