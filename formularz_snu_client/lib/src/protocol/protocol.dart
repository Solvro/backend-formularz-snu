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
import 'form_data.dart' as _i2;
import 'form_entry.dart' as _i3;
import 'global_config.dart' as _i4;
import 'participant.dart' as _i5;
export 'form_data.dart';
export 'form_entry.dart';
export 'global_config.dart';
export 'participant.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.FormData) {
      return _i2.FormData.fromJson(data) as T;
    }
    if (t == _i3.FormEntry) {
      return _i3.FormEntry.fromJson(data) as T;
    }
    if (t == _i4.GlobalConfig) {
      return _i4.GlobalConfig.fromJson(data) as T;
    }
    if (t == _i5.Participant) {
      return _i5.Participant.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.FormData?>()) {
      return (data != null ? _i2.FormData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.FormEntry?>()) {
      return (data != null ? _i3.FormEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.GlobalConfig?>()) {
      return (data != null ? _i4.GlobalConfig.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Participant?>()) {
      return (data != null ? _i5.Participant.fromJson(data) : null) as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.FormData) {
      return 'FormData';
    }
    if (data is _i3.FormEntry) {
      return 'FormEntry';
    }
    if (data is _i4.GlobalConfig) {
      return 'GlobalConfig';
    }
    if (data is _i5.Participant) {
      return 'Participant';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'FormData') {
      return deserialize<_i2.FormData>(data['data']);
    }
    if (dataClassName == 'FormEntry') {
      return deserialize<_i3.FormEntry>(data['data']);
    }
    if (dataClassName == 'GlobalConfig') {
      return deserialize<_i4.GlobalConfig>(data['data']);
    }
    if (dataClassName == 'Participant') {
      return deserialize<_i5.Participant>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
