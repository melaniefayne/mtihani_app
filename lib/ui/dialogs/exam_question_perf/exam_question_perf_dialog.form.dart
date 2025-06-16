// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = false;

const String StudentSearchValueKey = 'studentSearch';

final Map<String, TextEditingController>
    _ExamQuestionPerfDialogTextEditingControllers = {};

final Map<String, FocusNode> _ExamQuestionPerfDialogFocusNodes = {};

final Map<String, String? Function(String?)?>
    _ExamQuestionPerfDialogTextValidations = {
  StudentSearchValueKey: formStrValueValidator,
};

mixin $ExamQuestionPerfDialog {
  TextEditingController get studentSearchController =>
      _getFormTextEditingController(StudentSearchValueKey);

  FocusNode get studentSearchFocusNode =>
      _getFormFocusNode(StudentSearchValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_ExamQuestionPerfDialogTextEditingControllers.containsKey(key)) {
      return _ExamQuestionPerfDialogTextEditingControllers[key]!;
    }

    _ExamQuestionPerfDialogTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ExamQuestionPerfDialogTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ExamQuestionPerfDialogFocusNodes.containsKey(key)) {
      return _ExamQuestionPerfDialogFocusNodes[key]!;
    }
    _ExamQuestionPerfDialogFocusNodes[key] = FocusNode();
    return _ExamQuestionPerfDialogFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    studentSearchController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    studentSearchController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          StudentSearchValueKey: studentSearchController.text,
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

    for (var controller
        in _ExamQuestionPerfDialogTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ExamQuestionPerfDialogFocusNodes.values) {
      focusNode.dispose();
    }

    _ExamQuestionPerfDialogTextEditingControllers.clear();
    _ExamQuestionPerfDialogFocusNodes.clear();
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

  String? get studentSearchValue =>
      this.formValueMap[StudentSearchValueKey] as String?;

  set studentSearchValue(String? value) {
    this.setData(
      this.formValueMap..addAll({StudentSearchValueKey: value}),
    );

    if (_ExamQuestionPerfDialogTextEditingControllers.containsKey(
        StudentSearchValueKey)) {
      _ExamQuestionPerfDialogTextEditingControllers[StudentSearchValueKey]
          ?.text = value ?? '';
    }
  }

  bool get hasStudentSearch =>
      this.formValueMap.containsKey(StudentSearchValueKey) &&
      (studentSearchValue?.isNotEmpty ?? false);

  bool get hasStudentSearchValidationMessage =>
      this.fieldsValidationMessages[StudentSearchValueKey]?.isNotEmpty ?? false;

  String? get studentSearchValidationMessage =>
      this.fieldsValidationMessages[StudentSearchValueKey];
}

extension Methods on FormStateHelper {
  setStudentSearchValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StudentSearchValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    studentSearchValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      StudentSearchValueKey: getValidationMessage(StudentSearchValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _ExamQuestionPerfDialogTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _ExamQuestionPerfDialogTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      StudentSearchValueKey: getValidationMessage(StudentSearchValueKey),
    });
