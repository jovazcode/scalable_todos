import 'package:clean_foundations/clean_foundations.dart';

/// Data Reader
// ignore: one_member_abstracts
abstract class DataReader<T extends Dto> {
  /// The name of the property which contains the Array of row objects
  String? get rootProperty => null;

  /// Name of the property from which to retrieve the total
  /// number of records in the `Data Source`.
  String? get totalProperty => null;

  /// Create a record from raw data.
  T read(dynamic data);
}
