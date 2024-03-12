import 'package:clean_foundations/clean_foundations.dart';

/// Data Writer
// ignore: one_member_abstracts
abstract class DataWriter<T extends Dto> {
  /// Returns raw data given a record.
  dynamic write(T record);
}
