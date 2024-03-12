/// DataSource Exception
sealed class DataSourceException implements Exception {
  const DataSourceException(this.excp);

  /// Exception
  final Exception? excp;
}

/// Connection Exception
final class ConnectionException extends DataSourceException {
  /// Connection Exception
  const ConnectionException(super.excp);
}

/// Remote Exception
final class RemoteException extends DataSourceException {
  /// Remote Exception
  const RemoteException({
    Exception? exception,
    this.code = '',
    this.message = '',
  }) : super(exception);

  /// Error Code
  final String code;

  /// Error Message
  final String message;
}

/// Data Exception
final class DataException extends DataSourceException {
  /// Data Exception
  const DataException({
    Exception? exception,
    this.message = '',
  }) : super(exception);

  /// Error Message
  final String message;
}
