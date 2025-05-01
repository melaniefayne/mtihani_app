// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = false;

const String StudentNameValueKey = 'studentName';

final Map<String, TextEditingController>
    _StudentEditFormTextEditingControllers = {};

final Map<String, FocusNode> _StudentEditFormFocusNodes = {};

final Map<String, String? Function(String?)?> _StudentEditFormTextValidations =
    {
  StudentNameValueKey: formStrValueValidator,
};

mixin $StudentEditForm {
  TextEditingController get studentNameController =>
      _getFormTextEditingController(StudentNameValueKey);

  FocusNode get studentNameFocusNode => _getFormFocusNode(StudentNameValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_StudentEditFormTextEditingControllers.containsKey(key)) {
      return _StudentEditFormTextEditingControllers[key]!;
    }

    _StudentEditFormTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _StudentEditFormTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_StudentEditFormFocusNodes.containsKey(key)) {
      return _StudentEditFormFocusNodes[key]!;
    }
    _StudentEditFormFocusNodes[key] = FocusNode();
    return _StudentEditFormFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    studentNameController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    studentNameController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          StudentNameValueKey: studentNameController.text,
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

    for (var controller in _StudentEditFormTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _StudentEditFormFocusNodes.values) {
      focusNode.dispose();
    }

    _StudentEditFormTextEditingControllers.clear();
    _StudentEditFormFocusNodes.clear();
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

  String? get studentNameValue =>
      this.formValueMap[StudentNameValueKey] as String?;

  set studentNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({StudentNameValueKey: value}),
    );

    if (_StudentEditFormTextEditingControllers.containsKey(
        StudentNameValueKey)) {
      _StudentEditFormTextEditingControllers[StudentNameValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasStudentName =>
      this.formValueMap.containsKey(StudentNameValueKey) &&
      (studentNameValue?.isNotEmpty ?? false);

  bool get hasStudentNameValidationMessage =>
      this.fieldsValidationMessages[StudentNameValueKey]?.isNotEmpty ?? false;

  String? get studentNameValidationMessage =>
      this.fieldsValidationMessages[StudentNameValueKey];
}

extension Methods on FormStateHelper {
  setStudentNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StudentNameValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    studentNameValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      StudentNameValueKey: getValidationMessage(StudentNameValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _StudentEditFormTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _StudentEditFormTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      StudentNameValueKey: getValidationMessage(StudentNameValueKey),
    });
