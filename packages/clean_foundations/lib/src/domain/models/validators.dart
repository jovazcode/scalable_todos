import 'package:clean_foundations/clean_foundations.dart';

import 'package:dartx/dartx.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fpdart/fpdart.dart';

Either<Failure, String> validateEmailAddress(String email) {
  final isEmailValid = EmailValidator.validate(email, true);

  return isEmailValid ? right(email) : left(Failure.invalidEmailFormat());
}

Either<Failure, String> validateLink(String url) => Uri.parse(url).isAbsolute
    ? right(url)
    : left(Failure.invalidUrl(failedValue: url));

Either<Failure, String> validateCharacterLength(
  String input,
  int minCharacter,
  int maxCharacter,
) {
  if (input.length < minCharacter) {
    return left(Failure.exceedingCharacterLength(min: minCharacter));
  } else if (input.length > maxCharacter) {
    return left(Failure.exceedingCharacterLength(max: maxCharacter));
  } else {
    return right(input);
  }
}

Either<Failure, String> validateStringEmpty(String input, String property) =>
    input.isNotNullOrBlank
        ? right(input)
        : left(Failure.emptyString(property: property));

Either<Failure, num> validateNegativeNumber(num value) =>
    value >= 0 ? right(value) : left(Failure.invalidValue(failedValue: value));
