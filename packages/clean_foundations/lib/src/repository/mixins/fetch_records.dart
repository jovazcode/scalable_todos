import 'package:clean_foundations/clean_foundations.dart';

/// Repository can Fetch Records
mixin FetchRecords<M extends Model> on Repository<M> {
  /// Load 'records'.
  Future<RepositoryResponse<ResultSet<M>>> load({
    RepositoryRequest? request,
  }) async {
    try {
      final res = await dataSource.list(
        pagination: request?.pagination,
        filters: request?.filters,
        sorters: request?.sorters,
      );
      if (this is PaginatedRepository<M>) {
        (this as PaginatedRepository<M>).pagination = request?.pagination;
      }
      if (this is StatefulRepository<M>) {
        final repo = this as StatefulRepository<M>;
        if ((request?.addRecords ?? false) && repo.state != null) {
          repo.state = repo.state!..addAll(res.records.cast());
        } else {
          repo.state = res.records.cast();
        }
      }
      return RepositorySuccess(
        res.convert<M>((dto) => toDomain(dto as Dto<M>)),
      );
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
