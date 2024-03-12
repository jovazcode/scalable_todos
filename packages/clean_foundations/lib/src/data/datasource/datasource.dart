// ignore_for_file: strict_raw_type

import 'package:clean_foundations/clean_foundations.dart';

export 'exceptions.dart';
export 'reader.dart';
export 'writer.dart';

/// A DataSource Definition
abstract class DataSource<M extends Model, DTO extends Dto<M>> {
  /// A DataSource Definition
  DataSource({
    this.reader,
    this.writer,
  });

  /// Data reader
  final DataReader<DTO>? reader;

  /// Data writer
  final DataWriter<DTO>? writer;

  /// Create new [records].
  Future<ResultSet<Dto<M>>> create(List<Dto<M>> records) =>
      throw UnimplementedError();

  /// Update given [records].
  Future<ResultSet<Dto<M>>> update(List<Dto<M>> records) =>
      throw UnimplementedError();

  /// Delete given [records].
  Future<ResultSet<Dto<M>>> delete(List<Dto<M>> records) =>
      throw UnimplementedError();

  /// List all 'records'.
  Future<ResultSet<Dto<M>>> list({
    Pagination? pagination,
    List<DataFilter>? filters,
    List<DataSorter>? sorters,
  }) =>
      throw UnimplementedError();

  /// Filter current 'records'.
  Future<ResultSet<Dto<M>>> filter({
    required List<DataFilter> filters,
  }) =>
      throw UnimplementedError();

  /// Stream of records.
  Stream<List<Dto<M>>> watch({
    Pagination? pagination,
    List<DataFilter>? filters,
    List<DataSorter>? sorters,
  }) =>
      throw UnimplementedError();
}
