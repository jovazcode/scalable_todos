import 'package:clean_foundations/clean_foundations.dart';

/// Repository can Load Records
mixin LoadRecords<ModelT extends Object> on Repository<ModelT> {
  /// Load 'records'.
  Future<RepositoryResponse<ResultSet<ModelT>>> load({
    RepositoryRequest? request,
  }) async {
    try {
      final res = await dataSource.list(
        pagination: request?.pagination,
        filters: request?.filters,
        sorters: request?.sorters,
      );
      if (this is PaginatedRepository) {
        (this as PaginatedRepository).pagination = request?.pagination;
      }
      if (this is StatefulRepository) {
        final repo = this as StatefulRepository;
        if ((request?.addRecords ?? false) && repo.state != null) {
          repo.state = repo.state!..add(res.records);
        } else {
          repo.state = res.records;
        }
      }
      return RepositorySuccess(res);
    } on DataSourceException catch (e) {
      return switch (e) {
        DataException() => DataFailure(message: e.toString()),
        ConnectionException() => ConnectionFailure(message: e.toString()),
        RemoteException() => RemoteFailure(message: e.toString()),
      };
    } on Exception catch (e) {
      return switch (e) {
        Exception() => UnknownFailure(message: e.toString()),
      };
    }
  }
}
