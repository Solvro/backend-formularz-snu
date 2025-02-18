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
import 'sleep_score.dart' as _i3;

abstract class FormEntry implements _i1.SerializableModel {
  FormEntry._({
    this.id,
    required this.participantId,
    this.participant,
    DateTime? timestamp,
    required this.inBedStartTime,
    required this.fallingAsleepTime,
    required this.midNightAwaikingsCount,
    required this.totalMidNightAwaikingsTime,
    required this.wakeUpTime,
    required this.outBedTime,
    required this.sleepQuality,
  }) : timestamp = timestamp ?? DateTime.now();

  factory FormEntry({
    int? id,
    required int participantId,
    _i2.Participant? participant,
    DateTime? timestamp,
    required DateTime inBedStartTime,
    required DateTime fallingAsleepTime,
    required int midNightAwaikingsCount,
    required Duration totalMidNightAwaikingsTime,
    required DateTime wakeUpTime,
    required DateTime outBedTime,
    required _i3.SleepScore sleepQuality,
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
      sleepQuality: _i3.SleepScore.fromJson(
          (jsonSerialization['sleepQuality'] as String)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int participantId;

  _i2.Participant? participant;

  DateTime timestamp;

  DateTime inBedStartTime;

  DateTime fallingAsleepTime;

  int midNightAwaikingsCount;

  Duration totalMidNightAwaikingsTime;

  DateTime wakeUpTime;

  DateTime outBedTime;

  _i3.SleepScore sleepQuality;

  FormEntry copyWith({
    int? id,
    int? participantId,
    _i2.Participant? participant,
    DateTime? timestamp,
    DateTime? inBedStartTime,
    DateTime? fallingAsleepTime,
    int? midNightAwaikingsCount,
    Duration? totalMidNightAwaikingsTime,
    DateTime? wakeUpTime,
    DateTime? outBedTime,
    _i3.SleepScore? sleepQuality,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'participantId': participantId,
      if (participant != null) 'participant': participant?.toJson(),
      'timestamp': timestamp.toJson(),
      'inBedStartTime': inBedStartTime.toJson(),
      'fallingAsleepTime': fallingAsleepTime.toJson(),
      'midNightAwaikingsCount': midNightAwaikingsCount,
      'totalMidNightAwaikingsTime': totalMidNightAwaikingsTime.toJson(),
      'wakeUpTime': wakeUpTime.toJson(),
      'outBedTime': outBedTime.toJson(),
      'sleepQuality': sleepQuality.toJson(),
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
    required DateTime inBedStartTime,
    required DateTime fallingAsleepTime,
    required int midNightAwaikingsCount,
    required Duration totalMidNightAwaikingsTime,
    required DateTime wakeUpTime,
    required DateTime outBedTime,
    required _i3.SleepScore sleepQuality,
  }) : super._(
          id: id,
          participantId: participantId,
          participant: participant,
          timestamp: timestamp,
          inBedStartTime: inBedStartTime,
          fallingAsleepTime: fallingAsleepTime,
          midNightAwaikingsCount: midNightAwaikingsCount,
          totalMidNightAwaikingsTime: totalMidNightAwaikingsTime,
          wakeUpTime: wakeUpTime,
          outBedTime: outBedTime,
          sleepQuality: sleepQuality,
        );

  @override
  FormEntry copyWith({
    Object? id = _Undefined,
    int? participantId,
    Object? participant = _Undefined,
    DateTime? timestamp,
    DateTime? inBedStartTime,
    DateTime? fallingAsleepTime,
    int? midNightAwaikingsCount,
    Duration? totalMidNightAwaikingsTime,
    DateTime? wakeUpTime,
    DateTime? outBedTime,
    _i3.SleepScore? sleepQuality,
  }) {
    return FormEntry(
      id: id is int? ? id : this.id,
      participantId: participantId ?? this.participantId,
      participant: participant is _i2.Participant?
          ? participant
          : this.participant?.copyWith(),
      timestamp: timestamp ?? this.timestamp,
      inBedStartTime: inBedStartTime ?? this.inBedStartTime,
      fallingAsleepTime: fallingAsleepTime ?? this.fallingAsleepTime,
      midNightAwaikingsCount:
          midNightAwaikingsCount ?? this.midNightAwaikingsCount,
      totalMidNightAwaikingsTime:
          totalMidNightAwaikingsTime ?? this.totalMidNightAwaikingsTime,
      wakeUpTime: wakeUpTime ?? this.wakeUpTime,
      outBedTime: outBedTime ?? this.outBedTime,
      sleepQuality: sleepQuality ?? this.sleepQuality,
    );
  }
}
