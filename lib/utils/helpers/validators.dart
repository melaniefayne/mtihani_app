final onlyLettersRegEx = RegExp(r'^[a-zA-Z]+$');
final onlyDigitsRegEx = RegExp(r'^[0-9]+$');
final emailRegEx = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
final alphanumericRegEx = RegExp(r'^[a-zA-Z0-9]+$');

bool isStringEmptyOrNull(String? value) {
  if (value == null || value.trim().isEmpty) {
    return true;
  }
  return false;
}

bool isStringAllDigits(String value) {
  var isAllDigits = onlyDigitsRegEx.hasMatch(value);
  return isAllDigits;
}

String? formIntValidator(String? val) {
  if (isStringEmptyOrNull(val)) {
    return "Field is required";
  }
  val = val!.trim();
  if (!isStringAllDigits(val)) {
    return 'Value must contain only digits.';
  }

  if (int.tryParse(val) == null) {
    return 'Invalid value';
  }

  return null;
}

String? formPhoneNoValidator(String? val) {
  if (isStringEmptyOrNull(val)) {
    return "Phone number is required";
  }
  val = val!.trim();
  if (!isStringAllDigits(val)) {
    return 'Phone number must contain only digits.';
  }
  if (val.length != 10) {
    return 'Phone number must have 10 digits';
  }

  return null;
}

String? formStrValueValidator(String? val) {
  if (isStringEmptyOrNull(val)) {
    return "Field is required";
  }

  if (!onlyLettersRegEx.hasMatch(val!)) {
    return "Value must contain only letters";
  }

  return null;
}

String? formEmailValidator(String? val) {
  if (isStringEmptyOrNull(val)) {
    return "Email is required";
  }

  if (!emailRegEx.hasMatch(val!)) {
    return "Enter a valid email address";
  }

  return null;
}

String? formAlphanumericValidator(String? val) {
  if (isStringEmptyOrNull(val)) {
    return "Field is required";
  }

  if (!alphanumericRegEx.hasMatch(val!)) {
    return "Only letters and numbers are allowed";
  }

  return null;
}

String? formPasswordValidator(String? val) {
  if (isStringEmptyOrNull(val)) {
    return "Password is required";
  }
  if (!(val!.trim().length > 8)) {
    return "Password must be at least 8 characters";
  }
  return null;
}

String? formConfirmPasswordValidator(String? password, String? conformPass) {
  String? passCheck = formPasswordValidator(password);
  if (!isStringEmptyOrNull(passCheck)) {
    return passCheck;
  }
  if (password != conformPass) {
    return "Passwords do not match";
  }
  return null;
}
