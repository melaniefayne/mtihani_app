// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String StudentCodeValueKey = 'student_code';

final Map<String, TextEditingController>
    _JoinClassDialogTextEditingControllers = {};

final Map<String, FocusNode> _JoinClassDialogFocusNodes = {};

final Map<String, String? Function(String?)?> _JoinClassDialogTextValidations =
    {
  StudentCodeValueKey: formAlphanumericValidator,
};

mixin $JoinClassDialog {
  TextEditingController get studentCodeController =>
      _getFormTextEditingController(StudentCodeValueKey);

  FocusNode get studentCodeFocusNode => _getFormFocusNode(StudentCodeValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_JoinClassDialogTextEditingControllers.containsKey(key)) {
      return _JoinClassDialogTextEditingControllers[key]!;
    }

    _JoinClassDialogTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _JoinClassDialogTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_JoinClassDialogFocusNodes.containsKey(key)) {
      return _JoinClassDialogFocusNodes[key]!;
    }
    _JoinClassDialogFocusNodes[key] = FocusNode();
    return _JoinClassDialogFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    studentCodeController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    studentCodeController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          StudentCodeValueKey: studentCodeController.text,
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

    for (var controller in _JoinClassDialogTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _JoinClassDialogFocusNodes.values) {
      focusNode.dispose();
    }

    _JoinClassDialogTextEditingControllers.clear();
    _JoinClassDialogFocusNodes.clear();
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

  String? get studentCodeValue =>
      this.formValueMap[StudentCodeValueKey] as String?;

  set studentCodeValue(String? value) {
    this.setData(
      this.formValueMap..addAll({StudentCodeValueKey: value}),
    );

    if (_JoinClassDialogTextEditingControllers.containsKey(
        StudentCodeValueKey)) {
      _JoinClassDialogTextEditingControllers[StudentCodeValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasStudentCode =>
      this.formValueMap.containsKey(StudentCodeValueKey) &&
      (studentCodeValue?.isNotEmpty ?? false);

  bool get hasStudentCodeValidationMessage =>
      this.fieldsValidationMessages[StudentCodeValueKey]?.isNotEmpty ?? false;

  String? get studentCodeValidationMessage =>
      this.fieldsValidationMessages[StudentCodeValueKey];
}

extension Methods on FormStateHelper {
  setStudentCodeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StudentCodeValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    studentCodeValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      StudentCodeValueKey: getValidationMessage(StudentCodeValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _JoinClassDialogTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _JoinClassDialogTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      StudentCodeValueKey: getValidationMessage(StudentCodeValueKey),
    });
