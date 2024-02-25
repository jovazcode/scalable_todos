part 'response_failures.dart';

/// Response
sealed class RepositoryResponse<S> {
  const RepositoryResponse();
}

/// Success
final class RepositorySuccess<S> extends RepositoryResponse<S> {
  /// Success
  const RepositorySuccess(
    this.value,
  );

  /// Value
  final S value;
}

/// Repository Failure
sealed class RepositoryFailure<S> extends RepositoryResponse<S> {
  const RepositoryFailure({
    this.code = '',
    this.name = 'Unknown Failure',
    this.message = '',
  });

  /// Error Code
  final String code;

  /// Error Name
  final String name;

  /// Error Message
  final String message;
}
