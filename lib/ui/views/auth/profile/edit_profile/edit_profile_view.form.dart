// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String FirstNameValueKey = 'firstName';
const String LastNameValueKey = 'lastName';
const String EmailValueKey = 'email';
const String PhoneNoValueKey = 'phoneNo';

final Map<String, TextEditingController>
    _EditProfileViewTextEditingControllers = {};

final Map<String, FocusNode> _EditProfileViewFocusNodes = {};

final Map<String, String? Function(String?)?> _EditProfileViewTextValidations =
    {
  FirstNameValueKey: formStrValueValidator,
  LastNameValueKey: formStrValueValidator,
  EmailValueKey: formEmailValidator,
  PhoneNoValueKey: formPhoneNoValidator,
};

mixin $EditProfileView {
  TextEditingController get firstNameController =>
      _getFormTextEditingController(FirstNameValueKey);
  TextEditingController get lastNameController =>
      _getFormTextEditingController(LastNameValueKey);
  TextEditingController get emailController =>
      _getFormTextEditingController(EmailValueKey);
  TextEditingController get phoneNoController =>
      _getFormTextEditingController(PhoneNoValueKey);

  FocusNode get firstNameFocusNode => _getFormFocusNode(FirstNameValueKey);
  FocusNode get lastNameFocusNode => _getFormFocusNode(LastNameValueKey);
  FocusNode get emailFocusNode => _getFormFocusNode(EmailValueKey);
  FocusNode get phoneNoFocusNode => _getFormFocusNode(PhoneNoValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_EditProfileViewTextEditingControllers.containsKey(key)) {
      return _EditProfileViewTextEditingControllers[key]!;
    }

    _EditProfileViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _EditProfileViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_EditProfileViewFocusNodes.containsKey(key)) {
      return _EditProfileViewFocusNodes[key]!;
    }
    _EditProfileViewFocusNodes[key] = FocusNode();
    return _EditProfileViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    phoneNoController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    phoneNoController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          FirstNameValueKey: firstNameController.text,
          LastNameValueKey: lastNameController.text,
          EmailValueKey: emailController.text,
          PhoneNoValueKey: phoneNoController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _EditProfileViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _EditProfileViewFocusNodes.values) {
      focusNode.dispose();
    }

    _EditProfileViewTextEditingControllers.clear();
    _EditProfileViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get firstNameValue => this.formValueMap[FirstNameValueKey] as String?;
  String? get lastNameValue => this.formValueMap[LastNameValueKey] as String?;
  String? get emailValue => this.formValueMap[EmailValueKey] as String?;
  String? get phoneNoValue => this.formValueMap[PhoneNoValueKey] as String?;

  set firstNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FirstNameValueKey: value}),
    );

    if (_EditProfileViewTextEditingControllers.containsKey(FirstNameValueKey)) {
      _EditProfileViewTextEditingControllers[FirstNameValueKey]?.text =
          value ?? '';
    }
  }

  set lastNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({LastNameValueKey: value}),
    );

    if (_EditProfileViewTextEditingControllers.containsKey(LastNameValueKey)) {
      _EditProfileViewTextEditingControllers[LastNameValueKey]?.text =
          value ?? '';
    }
  }

  set emailValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailValueKey: value}),
    );

    if (_EditProfileViewTextEditingControllers.containsKey(EmailValueKey)) {
      _EditProfileViewTextEditingControllers[EmailValueKey]?.text = value ?? '';
    }
  }

  set phoneNoValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PhoneNoValueKey: value}),
    );

    if (_EditProfileViewTextEditingControllers.containsKey(PhoneNoValueKey)) {
      _EditProfileViewTextEditingControllers[PhoneNoValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasFirstName =>
      this.formValueMap.containsKey(FirstNameValueKey) &&
      (firstNameValue?.isNotEmpty ?? false);
  bool get hasLastName =>
      this.formValueMap.containsKey(LastNameValueKey) &&
      (lastNameValue?.isNotEmpty ?? false);
  bool get hasEmail =>
      this.formValueMap.containsKey(EmailValueKey) &&
      (emailValue?.isNotEmpty ?? false);
  bool get hasPhoneNo =>
      this.formValueMap.containsKey(PhoneNoValueKey) &&
      (phoneNoValue?.isNotEmpty ?? false);

  bool get hasFirstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey]?.isNotEmpty ?? false;
  bool get hasLastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey]?.isNotEmpty ?? false;
  bool get hasEmailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneNoValidationMessage =>
      this.fieldsValidationMessages[PhoneNoValueKey]?.isNotEmpty ?? false;

  String? get firstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey];
  String? get lastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey];
  String? get emailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey];
  String? get phoneNoValidationMessage =>
      this.fieldsValidationMessages[PhoneNoValueKey];
}

extension Methods on FormStateHelper {
  setFirstNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FirstNameValueKey] = validationMessage;
  setLastNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastNameValueKey] = validationMessage;
  setEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailValueKey] = validationMessage;
  setPhoneNoValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneNoValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    firstNameValue = '';
    lastNameValue = '';
    emailValue = '';
    phoneNoValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      PhoneNoValueKey: getValidationMessage(PhoneNoValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _EditProfileViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _EditProfileViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      PhoneNoValueKey: getValidationMessage(PhoneNoValueKey),
    });
