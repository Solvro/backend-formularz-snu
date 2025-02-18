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
import 'sleep_score.dart' as _i2;

abstract class FormData implements _i1.SerializableModel {
  FormData._({
    required this.inBedStartTime,
    required this.fallingAsleepTime,
    required this.midNightAwaikingsCount,
    required this.totalMidNightAwaikingsTime,
    required this.wakeUpTime,
    required this.outBedTime,
    required this.sleepQuality,
  });

  factory FormData({
    required DateTime inBedStartTime,
    required DateTime fallingAsleepTime,
    required int midNightAwaikingsCount,
    required Duration totalMidNightAwaikingsTime,
    required DateTime wakeUpTime,
    required DateTime outBedTime,
    required _i2.SleepScore sleepQuality,
  }) = _FormDataImpl;

  factory FormData.fromJson(Map<String, dynamic> jsonSerialization) {
    return FormData(
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
      sleepQuality:
          _i2.SleepScore.fromJson((jsonSerialization['sleepQuality'] as int)),
    );
  }

  DateTime inBedStartTime;

  DateTime fallingAsleepTime;

  int midNightAwaikingsCount;

  Duration totalMidNightAwaikingsTime;

  DateTime wakeUpTime;

  DateTime outBedTime;

  _i2.SleepScore sleepQuality;

  FormData copyWith({
    DateTime? inBedStartTime,
    DateTime? fallingAsleepTime,
    int? midNightAwaikingsCount,
    Duration? totalMidNightAwaikingsTime,
    DateTime? wakeUpTime,
    DateTime? outBedTime,
    _i2.SleepScore? sleepQuality,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
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

class _FormDataImpl extends FormData {
  _FormDataImpl({
    required DateTime inBedStartTime,
    required DateTime fallingAsleepTime,
    required int midNightAwaikingsCount,
    required Duration totalMidNightAwaikingsTime,
    required DateTime wakeUpTime,
    required DateTime outBedTime,
    required _i2.SleepScore sleepQuality,
  }) : super._(
          inBedStartTime: inBedStartTime,
          fallingAsleepTime: fallingAsleepTime,
          midNightAwaikingsCount: midNightAwaikingsCount,
          totalMidNightAwaikingsTime: totalMidNightAwaikingsTime,
          wakeUpTime: wakeUpTime,
          outBedTime: outBedTime,
          sleepQuality: sleepQuality,
        );

  @override
  FormData copyWith({
    DateTime? inBedStartTime,
    DateTime? fallingAsleepTime,
    int? midNightAwaikingsCount,
    Duration? totalMidNightAwaikingsTime,
    DateTime? wakeUpTime,
    DateTime? outBedTime,
    _i2.SleepScore? sleepQuality,
  }) {
    return FormData(
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
