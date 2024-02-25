import 'dart:async';

import 'package:clean_foundations/clean_foundations.dart';

/// Repository can Update Records
mixin UpdateRecords<ModelT extends Object> on Repository<ModelT> {
  /// Update given [records].
  Future<RepositoryResponse<ResultSet<ModelT>>> update(
    List<ModelT> records,
  ) async {
    try {
      final res = await dataSource.update(records);
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
