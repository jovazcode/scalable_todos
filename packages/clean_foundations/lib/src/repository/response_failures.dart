part of 'response.dart';

/// Unknown Failure
final class UnknownFailure<S> extends RepositoryFailure<S> {
  /// Unknown Failure
  const UnknownFailure({
    super.message,
  });
}

/// Connection Failure
final class ConnectionFailure<S> extends RepositoryFailure<S> {
  /// Connection Failure
  const ConnectionFailure({
    super.code = 'NO_CONNECTIVITY',
    super.name = 'No Connection',
    super.message,
  });
}

/// Remote Failure
final class RemoteFailure<S> extends RepositoryFailure<S> {
  /// Remote Failure
  const RemoteFailure({
    super.code = 'INTERNAL_SERVER_ERROR',
    super.name = 'Internal Server Error',
    super.message,
  });
}

/// Data Failure
final class DataFailure<S> extends RepositoryFailure<S> {
  /// Data Failure
  const DataFailure({
    super.code = 'DATA_PARSING_FAILURE',
    super.name = 'Data Parsing Failure',
    super.message,
  });
}
