import 'package:clean_foundations/clean_foundations.dart';

/// Repository can Delete Records
mixin DeleteRecords<M extends Model> on Repository<M> {
  /// Delete given [records].
  Future<RepositoryResponse<ResultSet<M>>> delete(
    List<M> records,
  ) async {
    try {
      final res = await dataSource.delete(records.map(fromDomain).toList());
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
}
