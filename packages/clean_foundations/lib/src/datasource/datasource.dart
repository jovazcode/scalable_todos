// ignore_for_file: strict_raw_type

import 'package:clean_foundations/clean_foundations.dart';

export 'exceptions.dart';
export 'reader.dart';
export 'writer.dart';

/// A DataSource Definition
abstract class DataSource<ModelT extends Object> {
  /// A DataSource Definition
  DataSource({
    this.reader,
    this.writer,
  });

  /// Data reader
  final DataReader<ModelT>? reader;

  /// Data writer
  final DataWriter<ModelT>? writer;

  /// Create new records from [data].
  Future<ResultSet<ModelT>> create(List<RawData> data) =>
      throw UnimplementedError();

  /// Update given [records].
  Future<ResultSet<ModelT>> update(List<ModelT> records) =>
      throw UnimplementedError();

  /// Delete given [records].
  Future<ResultSet<ModelT>> delete(List<ModelT> records) =>
      throw UnimplementedError();

  /// List all 'records'.
  Future<ResultSet<ModelT>> list({
    Pagination? pagination,
    List<DataFilter>? filters,
    List<DataSorter>? sorters,
  }) =>
      throw UnimplementedError();

  /// Filter current 'records'.
  Future<ResultSet<ModelT>> filter({
    required List<DataFilter> filters,
  }) =>
      throw UnimplementedError();

  /// Stream of records.
  Stream<List<ModelT>> watch({
    Pagination? pagination,
    List<DataFilter>? filters,
    List<DataSorter>? sorters,
  }) =>
      throw UnimplementedError();
}
