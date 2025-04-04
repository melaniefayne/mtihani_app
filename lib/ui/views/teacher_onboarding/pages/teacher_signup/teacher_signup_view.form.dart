// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = false;

const String FirstNameValueKey = 'firstName';
const String LastNameValueKey = 'lastName';
const String TeacherEmailValueKey = 'teacherEmail';
const String PhoneNoValueKey = 'phoneNo';
const String TeacherPasswordValueKey = 'teacherPassword';
const String TeacherConfirmPasswordValueKey = 'teacherConfirmPassword';

final Map<String, TextEditingController>
    _TeacherSignupViewTextEditingControllers = {};

final Map<String, FocusNode> _TeacherSignupViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _TeacherSignupViewTextValidations = {
  FirstNameValueKey: formStrValueValidator,
  LastNameValueKey: formStrValueValidator,
  TeacherEmailValueKey: formEmailValidator,
  PhoneNoValueKey: formPhoneNoValidator,
  TeacherPasswordValueKey: formPasswordValidator,
  TeacherConfirmPasswordValueKey: null,
};

mixin $TeacherSignupView {
  TextEditingController get firstNameController =>
      _getFormTextEditingController(FirstNameValueKey);
  TextEditingController get lastNameController =>
      _getFormTextEditingController(LastNameValueKey);
  TextEditingController get teacherEmailController =>
      _getFormTextEditingController(TeacherEmailValueKey);
  TextEditingController get phoneNoController =>
      _getFormTextEditingController(PhoneNoValueKey);
  TextEditingController get teacherPasswordController =>
      _getFormTextEditingController(TeacherPasswordValueKey);
  TextEditingController get teacherConfirmPasswordController =>
      _getFormTextEditingController(TeacherConfirmPasswordValueKey);

  FocusNode get firstNameFocusNode => _getFormFocusNode(FirstNameValueKey);
  FocusNode get lastNameFocusNode => _getFormFocusNode(LastNameValueKey);
  FocusNode get teacherEmailFocusNode =>
      _getFormFocusNode(TeacherEmailValueKey);
  FocusNode get phoneNoFocusNode => _getFormFocusNode(PhoneNoValueKey);
  FocusNode get teacherPasswordFocusNode =>
      _getFormFocusNode(TeacherPasswordValueKey);
  FocusNode get teacherConfirmPasswordFocusNode =>
      _getFormFocusNode(TeacherConfirmPasswordValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_TeacherSignupViewTextEditingControllers.containsKey(key)) {
      return _TeacherSignupViewTextEditingControllers[key]!;
    }

    _TeacherSignupViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _TeacherSignupViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_TeacherSignupViewFocusNodes.containsKey(key)) {
      return _TeacherSignupViewFocusNodes[key]!;
    }
    _TeacherSignupViewFocusNodes[key] = FocusNode();
    return _TeacherSignupViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    teacherEmailController.addListener(() => _updateFormData(model));
    phoneNoController.addListener(() => _updateFormData(model));
    teacherPasswordController.addListener(() => _updateFormData(model));
    teacherConfirmPasswordController.addListener(() => _updateFormData(model));

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
    teacherEmailController.addListener(() => _updateFormData(model));
    phoneNoController.addListener(() => _updateFormData(model));
    teacherPasswordController.addListener(() => _updateFormData(model));
    teacherConfirmPasswordController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          FirstNameValueKey: firstNameController.text,
          LastNameValueKey: lastNameController.text,
          TeacherEmailValueKey: teacherEmailController.text,
          PhoneNoValueKey: phoneNoController.text,
          TeacherPasswordValueKey: teacherPasswordController.text,
          TeacherConfirmPasswordValueKey: teacherConfirmPasswordController.text,
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

    for (var controller in _TeacherSignupViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _TeacherSignupViewFocusNodes.values) {
      focusNode.dispose();
    }

    _TeacherSignupViewTextEditingControllers.clear();
    _TeacherSignupViewFocusNodes.clear();
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
  String? get teacherEmailValue =>
      this.formValueMap[TeacherEmailValueKey] as String?;
  String? get phoneNoValue => this.formValueMap[PhoneNoValueKey] as String?;
  String? get teacherPasswordValue =>
      this.formValueMap[TeacherPasswordValueKey] as String?;
  String? get teacherConfirmPasswordValue =>
      this.formValueMap[TeacherConfirmPasswordValueKey] as String?;

  set firstNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FirstNameValueKey: value}),
    );

    if (_TeacherSignupViewTextEditingControllers.containsKey(
        FirstNameValueKey)) {
      _TeacherSignupViewTextEditingControllers[FirstNameValueKey]?.text =
          value ?? '';
    }
  }

  set lastNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({LastNameValueKey: value}),
    );

    if (_TeacherSignupViewTextEditingControllers.containsKey(
        LastNameValueKey)) {
      _TeacherSignupViewTextEditingControllers[LastNameValueKey]?.text =
          value ?? '';
    }
  }

  set teacherEmailValue(String? value) {
    this.setData(
      this.formValueMap..addAll({TeacherEmailValueKey: value}),
    );

    if (_TeacherSignupViewTextEditingControllers.containsKey(
        TeacherEmailValueKey)) {
      _TeacherSignupViewTextEditingControllers[TeacherEmailValueKey]?.text =
          value ?? '';
    }
  }

  set phoneNoValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PhoneNoValueKey: value}),
    );

    if (_TeacherSignupViewTextEditingControllers.containsKey(PhoneNoValueKey)) {
      _TeacherSignupViewTextEditingControllers[PhoneNoValueKey]?.text =
          value ?? '';
    }
  }

  set teacherPasswordValue(String? value) {
    this.setData(
      this.formValueMap..addAll({TeacherPasswordValueKey: value}),
    );

    if (_TeacherSignupViewTextEditingControllers.containsKey(
        TeacherPasswordValueKey)) {
      _TeacherSignupViewTextEditingControllers[TeacherPasswordValueKey]?.text =
          value ?? '';
    }
  }

  set teacherConfirmPasswordValue(String? value) {
    this.setData(
      this.formValueMap..addAll({TeacherConfirmPasswordValueKey: value}),
    );

    if (_TeacherSignupViewTextEditingControllers.containsKey(
        TeacherConfirmPasswordValueKey)) {
      _TeacherSignupViewTextEditingControllers[TeacherConfirmPasswordValueKey]
          ?.text = value ?? '';
    }
  }

  bool get hasFirstName =>
      this.formValueMap.containsKey(FirstNameValueKey) &&
      (firstNameValue?.isNotEmpty ?? false);
  bool get hasLastName =>
      this.formValueMap.containsKey(LastNameValueKey) &&
      (lastNameValue?.isNotEmpty ?? false);
  bool get hasTeacherEmail =>
      this.formValueMap.containsKey(TeacherEmailValueKey) &&
      (teacherEmailValue?.isNotEmpty ?? false);
  bool get hasPhoneNo =>
      this.formValueMap.containsKey(PhoneNoValueKey) &&
      (phoneNoValue?.isNotEmpty ?? false);
  bool get hasTeacherPassword =>
      this.formValueMap.containsKey(TeacherPasswordValueKey) &&
      (teacherPasswordValue?.isNotEmpty ?? false);
  bool get hasTeacherConfirmPassword =>
      this.formValueMap.containsKey(TeacherConfirmPasswordValueKey) &&
      (teacherConfirmPasswordValue?.isNotEmpty ?? false);

  bool get hasFirstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey]?.isNotEmpty ?? false;
  bool get hasLastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey]?.isNotEmpty ?? false;
  bool get hasTeacherEmailValidationMessage =>
      this.fieldsValidationMessages[TeacherEmailValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneNoValidationMessage =>
      this.fieldsValidationMessages[PhoneNoValueKey]?.isNotEmpty ?? false;
  bool get hasTeacherPasswordValidationMessage =>
      this.fieldsValidationMessages[TeacherPasswordValueKey]?.isNotEmpty ??
      false;
  bool get hasTeacherConfirmPasswordValidationMessage =>
      this
          .fieldsValidationMessages[TeacherConfirmPasswordValueKey]
          ?.isNotEmpty ??
      false;

  String? get firstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey];
  String? get lastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey];
  String? get teacherEmailValidationMessage =>
      this.fieldsValidationMessages[TeacherEmailValueKey];
  String? get phoneNoValidationMessage =>
      this.fieldsValidationMessages[PhoneNoValueKey];
  String? get teacherPasswordValidationMessage =>
      this.fieldsValidationMessages[TeacherPasswordValueKey];
  String? get teacherConfirmPasswordValidationMessage =>
      this.fieldsValidationMessages[TeacherConfirmPasswordValueKey];
}

extension Methods on FormStateHelper {
  setFirstNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FirstNameValueKey] = validationMessage;
  setLastNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastNameValueKey] = validationMessage;
  setTeacherEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TeacherEmailValueKey] = validationMessage;
  setPhoneNoValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneNoValueKey] = validationMessage;
  setTeacherPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TeacherPasswordValueKey] =
          validationMessage;
  setTeacherConfirmPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TeacherConfirmPasswordValueKey] =
          validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    firstNameValue = '';
    lastNameValue = '';
    teacherEmailValue = '';
    phoneNoValue = '';
    teacherPasswordValue = '';
    teacherConfirmPasswordValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      TeacherEmailValueKey: getValidationMessage(TeacherEmailValueKey),
      PhoneNoValueKey: getValidationMessage(PhoneNoValueKey),
      TeacherPasswordValueKey: getValidationMessage(TeacherPasswordValueKey),
      TeacherConfirmPasswordValueKey:
          getValidationMessage(TeacherConfirmPasswordValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _TeacherSignupViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _TeacherSignupViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      TeacherEmailValueKey: getValidationMessage(TeacherEmailValueKey),
      PhoneNoValueKey: getValidationMessage(PhoneNoValueKey),
      TeacherPasswordValueKey: getValidationMessage(TeacherPasswordValueKey),
      TeacherConfirmPasswordValueKey:
          getValidationMessage(TeacherConfirmPasswordValueKey),
    });
