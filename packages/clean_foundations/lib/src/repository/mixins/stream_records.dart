import 'dart:async';

import 'package:clean_foundations/clean_foundations.dart';

/// Repository can Stream Records
mixin StreamRecords<ModelT extends Object> on Repository<ModelT> {
  /// Filter the Stream of 'records'.
  Future<RepositoryResponse<ResultSet<ModelT>>> filter({
    required List<DataFilter<dynamic>> filters,
  }) async {
    try {
      final res = await dataSource.filter(
        filters: filters,
      );
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

  /// Stream of 'records'.
  Stream<RepositoryResponse<List<ModelT>>> watch({
    RepositoryRequest? request,
  }) async* {
    try {
      yield* dataSource
          .watch(
        pagination: request?.pagination,
        filters: request?.filters,
        sorters: request?.sorters,
      )
          .map((records) {
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
