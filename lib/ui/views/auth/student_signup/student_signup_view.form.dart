// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = false;

const String StudentEmailValueKey = 'studentEmail';
const String StudentCodeValueKey = 'studentCode';
const String StudentPasswordValueKey = 'studentPassword';
const String StudentConfirmPasswordValueKey = 'studentConfirmPassword';

final Map<String, TextEditingController>
    _StudentSignupViewTextEditingControllers = {};

final Map<String, FocusNode> _StudentSignupViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _StudentSignupViewTextValidations = {
  StudentEmailValueKey: formEmailValidator,
  StudentCodeValueKey: formAlphanumericNoSpaceValidator,
  StudentPasswordValueKey: formPasswordValidator,
  StudentConfirmPasswordValueKey: null,
};

mixin $StudentSignupView {
  TextEditingController get studentEmailController =>
      _getFormTextEditingController(StudentEmailValueKey);
  TextEditingController get studentCodeController =>
      _getFormTextEditingController(StudentCodeValueKey);
  TextEditingController get studentPasswordController =>
      _getFormTextEditingController(StudentPasswordValueKey);
  TextEditingController get studentConfirmPasswordController =>
      _getFormTextEditingController(StudentConfirmPasswordValueKey);

  FocusNode get studentEmailFocusNode =>
      _getFormFocusNode(StudentEmailValueKey);
  FocusNode get studentCodeFocusNode => _getFormFocusNode(StudentCodeValueKey);
  FocusNode get studentPasswordFocusNode =>
      _getFormFocusNode(StudentPasswordValueKey);
  FocusNode get studentConfirmPasswordFocusNode =>
      _getFormFocusNode(StudentConfirmPasswordValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_StudentSignupViewTextEditingControllers.containsKey(key)) {
      return _StudentSignupViewTextEditingControllers[key]!;
    }

    _StudentSignupViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _StudentSignupViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_StudentSignupViewFocusNodes.containsKey(key)) {
      return _StudentSignupViewFocusNodes[key]!;
    }
    _StudentSignupViewFocusNodes[key] = FocusNode();
    return _StudentSignupViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    studentEmailController.addListener(() => _updateFormData(model));
    studentCodeController.addListener(() => _updateFormData(model));
    studentPasswordController.addListener(() => _updateFormData(model));
    studentConfirmPasswordController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    studentEmailController.addListener(() => _updateFormData(model));
    studentCodeController.addListener(() => _updateFormData(model));
    studentPasswordController.addListener(() => _updateFormData(model));
    studentConfirmPasswordController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          StudentEmailValueKey: studentEmailController.text,
          StudentCodeValueKey: studentCodeController.text,
          StudentPasswordValueKey: studentPasswordController.text,
          StudentConfirmPasswordValueKey: studentConfirmPasswordController.text,
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

    for (var controller in _StudentSignupViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _StudentSignupViewFocusNodes.values) {
      focusNode.dispose();
    }

    _StudentSignupViewTextEditingControllers.clear();
    _StudentSignupViewFocusNodes.clear();
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

  String? get studentEmailValue =>
      this.formValueMap[StudentEmailValueKey] as String?;
  String? get studentCodeValue =>
      this.formValueMap[StudentCodeValueKey] as String?;
  String? get studentPasswordValue =>
      this.formValueMap[StudentPasswordValueKey] as String?;
  String? get studentConfirmPasswordValue =>
      this.formValueMap[StudentConfirmPasswordValueKey] as String?;

  set studentEmailValue(String? value) {
    this.setData(
      this.formValueMap..addAll({StudentEmailValueKey: value}),
    );

    if (_StudentSignupViewTextEditingControllers.containsKey(
        StudentEmailValueKey)) {
      _StudentSignupViewTextEditingControllers[StudentEmailValueKey]?.text =
          value ?? '';
    }
  }

  set studentCodeValue(String? value) {
    this.setData(
      this.formValueMap..addAll({StudentCodeValueKey: value}),
    );

    if (_StudentSignupViewTextEditingControllers.containsKey(
        StudentCodeValueKey)) {
      _StudentSignupViewTextEditingControllers[StudentCodeValueKey]?.text =
          value ?? '';
    }
  }

  set studentPasswordValue(String? value) {
    this.setData(
      this.formValueMap..addAll({StudentPasswordValueKey: value}),
    );

    if (_StudentSignupViewTextEditingControllers.containsKey(
        StudentPasswordValueKey)) {
      _StudentSignupViewTextEditingControllers[StudentPasswordValueKey]?.text =
          value ?? '';
    }
  }

  set studentConfirmPasswordValue(String? value) {
    this.setData(
      this.formValueMap..addAll({StudentConfirmPasswordValueKey: value}),
    );

    if (_StudentSignupViewTextEditingControllers.containsKey(
        StudentConfirmPasswordValueKey)) {
      _StudentSignupViewTextEditingControllers[StudentConfirmPasswordValueKey]
          ?.text = value ?? '';
    }
  }

  bool get hasStudentEmail =>
      this.formValueMap.containsKey(StudentEmailValueKey) &&
      (studentEmailValue?.isNotEmpty ?? false);
  bool get hasStudentCode =>
      this.formValueMap.containsKey(StudentCodeValueKey) &&
      (studentCodeValue?.isNotEmpty ?? false);
  bool get hasStudentPassword =>
      this.formValueMap.containsKey(StudentPasswordValueKey) &&
      (studentPasswordValue?.isNotEmpty ?? false);
  bool get hasStudentConfirmPassword =>
      this.formValueMap.containsKey(StudentConfirmPasswordValueKey) &&
      (studentConfirmPasswordValue?.isNotEmpty ?? false);

  bool get hasStudentEmailValidationMessage =>
      this.fieldsValidationMessages[StudentEmailValueKey]?.isNotEmpty ?? false;
  bool get hasStudentCodeValidationMessage =>
      this.fieldsValidationMessages[StudentCodeValueKey]?.isNotEmpty ?? false;
  bool get hasStudentPasswordValidationMessage =>
      this.fieldsValidationMessages[StudentPasswordValueKey]?.isNotEmpty ??
      false;
  bool get hasStudentConfirmPasswordValidationMessage =>
      this
          .fieldsValidationMessages[StudentConfirmPasswordValueKey]
          ?.isNotEmpty ??
      false;

  String? get studentEmailValidationMessage =>
      this.fieldsValidationMessages[StudentEmailValueKey];
  String? get studentCodeValidationMessage =>
      this.fieldsValidationMessages[StudentCodeValueKey];
  String? get studentPasswordValidationMessage =>
      this.fieldsValidationMessages[StudentPasswordValueKey];
  String? get studentConfirmPasswordValidationMessage =>
      this.fieldsValidationMessages[StudentConfirmPasswordValueKey];
}

extension Methods on FormStateHelper {
  setStudentEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StudentEmailValueKey] = validationMessage;
  setStudentCodeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StudentCodeValueKey] = validationMessage;
  setStudentPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StudentPasswordValueKey] =
          validationMessage;
  setStudentConfirmPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StudentConfirmPasswordValueKey] =
          validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    studentEmailValue = '';
    studentCodeValue = '';
    studentPasswordValue = '';
    studentConfirmPasswordValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      StudentEmailValueKey: getValidationMessage(StudentEmailValueKey),
      StudentCodeValueKey: getValidationMessage(StudentCodeValueKey),
      StudentPasswordValueKey: getValidationMessage(StudentPasswordValueKey),
      StudentConfirmPasswordValueKey:
          getValidationMessage(StudentConfirmPasswordValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _StudentSignupViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _StudentSignupViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      StudentEmailValueKey: getValidationMessage(StudentEmailValueKey),
      StudentCodeValueKey: getValidationMessage(StudentCodeValueKey),
      StudentPasswordValueKey: getValidationMessage(StudentPasswordValueKey),
      StudentConfirmPasswordValueKey:
          getValidationMessage(StudentConfirmPasswordValueKey),
    });
