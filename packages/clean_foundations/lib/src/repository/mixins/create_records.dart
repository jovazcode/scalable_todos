import 'package:clean_foundations/clean_foundations.dart';

/// Repository can Create Records
mixin CreateRecords<ModelT extends Object> on Repository<ModelT> {
  /// Create new records from [data].
  Future<RepositoryResponse<ResultSet<ModelT>>> create(
    List<RawData> data,
  ) async {
    try {
      final res = await dataSource.create(data);
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
