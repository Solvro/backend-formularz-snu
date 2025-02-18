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

enum SleepScore implements _i1.SerializableModel {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten;

  static SleepScore fromJson(int index) {
    switch (index) {
      case 0:
        return one;
      case 1:
        return two;
      case 2:
        return three;
      case 3:
        return four;
      case 4:
        return five;
      case 5:
        return six;
      case 6:
        return seven;
      case 7:
        return eight;
      case 8:
        return nine;
      case 9:
        return ten;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "SleepScore"');
    }
  }

  @override
  int toJson() => index;
  @override
  String toString() => name;
}
