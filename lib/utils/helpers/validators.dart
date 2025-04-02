bool isStringEmptyOrNull(String? value) {
  if (value == null || value.trim().isEmpty) {
    return true;
  }
  return false;
}

bool isStringAllDigits(String value) {
  var isAllDigits = RegExp(r'^[0-9]+$').hasMatch(value);
  return isAllDigits;
}

String? formIntAmountValidator(String? val) {
  if (isStringEmptyOrNull(val)) {
    return "Amount is required";
  }
  val = val!.trim();
  if (!isStringAllDigits(val)) {
    return 'Amount must contain only digits.';
  }

  if (int.tryParse(val) == null) {
    return 'Invalid amount';
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

String? formValueValidator(String? val) {
  if (isStringEmptyOrNull(val)) {
    return "Field is required";
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

String? formConfirmPasswordValidator(String? val, String? password) {
  String? passCheck = formPasswordValidator(val);
  if (!isStringEmptyOrNull(passCheck)) {
    return passCheck;
  }
  if (val != password) {
    return "Passwords do not match";
  }
  return null;
}
