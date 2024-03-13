import 'package:clean_foundations/clean_foundations.dart';

import 'package:fpdart/fpdart.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ValidatedType<T> {
  const ValidatedType();

  @override
  int get hashCode => value.hashCode;

  Either<Failure, T> get value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValidatedType<T> && other.value == value;
  }

  Either<Failure, Unit> get failureOrUnit =>
      value.fold(left, (T r) => right(unit));

  T getOrCrash() => value.fold(
        (Failure failure) => throw Exception(failure.toString()),
        identity,
      );

  bool isValid() => value.isRight();

  @override
  String toString() => 'Value:$value';
}
