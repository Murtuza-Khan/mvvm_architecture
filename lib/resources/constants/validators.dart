part of 'constants.dart';

class Validators {
  static final emailValidator = MultiValidator(
    [
      ..._minMaxValidator(title: 'Email / User Name', min: 4, max: 100),
      EmailValidator(errorText: "Enter a valid email address."),
    ],
  );

  static List<TextFieldValidator> _minMaxValidator({
    required String title,
    required int min,
    required int max,
  }) =>
      [
        _minValidator(title: title, min: min),
        _maxValidator(title: title, max: max),
      ];

  static TextFieldValidator _minValidator({
    required String title,
    required int min,
  }) =>
      MinLengthValidator(
        min,
        errorText: '$title must be at least $min characters long.',
      );

  static TextFieldValidator _maxValidator({
    required String title,
    required int max,
  }) =>
      MaxLengthValidator(
        max,
        errorText: '$title should not be greater than $max characters.',
      );

  static String? emailValidation(String? value) {
    if (value.toString().isNotEmpty) {
      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
        return 'Enter valid Email';
      }
    }
    return null;
  }
}
