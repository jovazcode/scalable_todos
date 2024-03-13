import 'dart:async';

import 'package:clean_foundations/clean_foundations.dart';

/// Repository can Stream Records
mixin WatchRecords<M extends Model> on Repository<M> {
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
        final records =
            dtoRecords.map((dto) => toDomain(dto as Dto<M>)).toList();
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
