/// Domain Data Failures
class Failure {
  factory Failure.invalidEmailFormat() = InvalidEmailFormat;
  factory Failure.invalidUrl({required String failedValue}) = InvalidUrl;
  factory Failure.exceedingCharacterLength({
    int? min,
    int? max,
  }) = ExceedingCharacterLength;
  factory Failure.emptyString({required String property}) = EmptyString;
  factory Failure.invalidValue({required dynamic failedValue}) = InvalidValue;
}

/// Invalid email format.
class InvalidEmailFormat implements Failure {}

/// Invalid URL.
class InvalidUrl implements Failure {
  InvalidUrl({required this.failedValue});

  final String failedValue;
}

/// Exceding Character Length.
class ExceedingCharacterLength implements Failure {
  ExceedingCharacterLength({this.min, this.max});

  final int? min;
  final int? max;
}

/// Empty String.
class EmptyString implements Failure {
  EmptyString({required this.property});

  final String property;
}

/// Invalid Value.
class InvalidValue implements Failure {
  InvalidValue({required this.failedValue});

  final dynamic failedValue;
}
