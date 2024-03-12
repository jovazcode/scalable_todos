import 'package:clean_foundations/clean_foundations.dart';

/// Repository can Create Records
mixin CreateRecords<M extends Model> on Repository<M> {
  /// Create new records from [data].
  Future<RepositoryResponse<ResultSet<M>>> create(
    List<M> data,
  ) async {
    try {
      final res = await dataSource.create(data.map(fromDomain).toList());
      return RepositorySuccess(res.convert(toDomain));
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
