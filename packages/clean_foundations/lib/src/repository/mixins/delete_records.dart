import 'package:clean_foundations/clean_foundations.dart';

/// Repository can Delete Records
mixin DeleteRecords<ModelT extends Object> on Repository<ModelT> {
  /// Delete given [records].
  Future<RepositoryResponse<ResultSet<ModelT>>> delete(
    List<ModelT> records,
  ) async {
    try {
      final res = await dataSource.delete(records);
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
