// ignore_for_file: strict_raw_type

import 'package:clean_foundations/clean_foundations.dart';

export 'exceptions.dart';

/// A DataSource Definition
abstract class DataSource {
  /// A DataSource Definition
  DataSource();

  /// Create new [records].
  Future<ResultSet<Dto>> create(List<Dto> records) =>
      throw UnimplementedError();

  /// Update given [records].
  Future<ResultSet<Dto>> update(List<Dto> records) =>
      throw UnimplementedError();

  /// Delete given [records].
  Future<ResultSet<Dto>> delete(List<Dto> records) =>
      throw UnimplementedError();

  /// List all 'records'.
  Future<ResultSet<Dto>> list({
    Pagination? pagination,
    List<DataFilter>? filters,
    List<DataSorter>? sorters,
  }) =>
      throw UnimplementedError();

  /// Filter current 'records'.
  Future<ResultSet<Dto>> filter({
    required List<DataFilter> filters,
  }) =>
      throw UnimplementedError();

  /// Stream of records.
  Stream<List<Dto>> watch({
    Pagination? pagination,
    List<DataFilter>? filters,
    List<DataSorter>? sorters,
  }) =>
      throw UnimplementedError();
}
