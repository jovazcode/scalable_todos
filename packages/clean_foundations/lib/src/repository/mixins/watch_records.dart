import 'dart:async';

import 'package:clean_foundations/clean_foundations.dart';

/// Repository can Stream Records
mixin WatchRecords<M extends Model> on Repository<M> {
  /// Filter the Stream of 'records'.
  Future<RepositoryResponse<ResultSet<M>>> filter({
    required List<DataFilter<dynamic>> filters,
  }) async {
    try {
      final res = await dataSource.filter(
        filters: filters,
      );
      return RepositorySuccess(res.convert<M>(toDomain));
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

  /// Stream of 'records'.
  Stream<RepositoryResponse<List<M>>> watch({
    RepositoryRequest? request,
  }) async* {
    try {
      yield* dataSource
          .watch(
        pagination: request?.pagination,
        filters: request?.filters,
        sorters: request?.sorters,
      )
          .map((dtoRecords) {
        final records = dtoRecords.map(toDomain).toList();
        if (this is StatefulRepository) {
          (this as StatefulRepository).state = records;
        }
        return RepositorySuccess(records);
      });
    } on DataSourceException catch (e) {
      yield switch (e) {
        DataException() => DataFailure(message: e.toString()),
        ConnectionException() => ConnectionFailure(message: e.toString()),
        RemoteException() => RemoteFailure(message: e.toString()),
      };
    } on Exception catch (e) {
      yield switch (e) {
        Exception() => UnknownFailure(message: e.toString()),
      };
    }
  }
}
