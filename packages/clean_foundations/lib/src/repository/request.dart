import 'package:clean_foundations/clean_foundations.dart';

/// Repository Request
class RepositoryRequest extends ValueObject {
  /// Create from data
  RepositoryRequest(DataMap data)
      : sync = data['sync'] as bool? ?? false,
        addRecords = data['addRecords'] as bool? ?? false,
        lastFetchTime = data['lastFetchTime'] as DateTime? ??
            DateTime.fromMillisecondsSinceEpoch(0),
        pagination =
            data['pagination'] as Pagination? ?? Pagination.fromMap(data),
        filters = data['filters'] as List<DataFilter>? ?? [],
        sorters = data['sorters'] as List<DataSorter>? ?? [],
        super.fromMap(data: data);

  /// Sync the [Repository] with its [DataSource]
  final bool sync;

  /// Add returned `records` to internal data state
  /// (only for [StatefulRepository])
  final bool addRecords;

  /// Last time a data load has been performed
  final DateTime lastFetchTime;

  /// Pagination infos
  final Pagination pagination;

  /// Filters to be applied to data
  final List<DataFilter<dynamic>> filters;

  /// Sorters to be applied to data
  final List<DataSorter<dynamic>> sorters;
}
