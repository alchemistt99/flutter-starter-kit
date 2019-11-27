import 'package:flutter_starter_kit/constants/Dictionary.dart';

class LoginValidations {
  static String usernameValidation(String val) {
    RegExp regex = RegExp(r'^[a-z0-9_./]+$');

    if (val.isEmpty) return Dictionary.errorEmptyUsername;

    if (val.length < 4) return Dictionary.errorMinimumUsername;

    if (val.length > 255) return Dictionary.errorMaximumUsername;

    if (!regex.hasMatch(val)) return Dictionary.errorInvalidUsername;

    return null;
  }

  static String passwordValidation(String val) {
    if (val.isEmpty) return Dictionary.errorEmptyPassword;

    return null;
  }
}
