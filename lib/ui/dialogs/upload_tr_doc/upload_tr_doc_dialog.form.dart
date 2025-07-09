// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = false;

const String FileNameValueKey = 'file_name';
const String FileDescriptionValueKey = 'file_description';

final Map<String, TextEditingController>
    _UploadTrDocDialogTextEditingControllers = {};

final Map<String, FocusNode> _UploadTrDocDialogFocusNodes = {};

final Map<String, String? Function(String?)?>
    _UploadTrDocDialogTextValidations = {
  FileNameValueKey: formAlphanumericValidator,
  FileDescriptionValueKey: null,
};

mixin $UploadTrDocDialog {
  TextEditingController get fileNameController =>
      _getFormTextEditingController(FileNameValueKey);
  TextEditingController get fileDescriptionController =>
      _getFormTextEditingController(FileDescriptionValueKey);

  FocusNode get fileNameFocusNode => _getFormFocusNode(FileNameValueKey);
  FocusNode get fileDescriptionFocusNode =>
      _getFormFocusNode(FileDescriptionValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_UploadTrDocDialogTextEditingControllers.containsKey(key)) {
      return _UploadTrDocDialogTextEditingControllers[key]!;
    }

    _UploadTrDocDialogTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _UploadTrDocDialogTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_UploadTrDocDialogFocusNodes.containsKey(key)) {
      return _UploadTrDocDialogFocusNodes[key]!;
    }
    _UploadTrDocDialogFocusNodes[key] = FocusNode();
    return _UploadTrDocDialogFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    fileNameController.addListener(() => _updateFormData(model));
    fileDescriptionController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    fileNameController.addListener(() => _updateFormData(model));
    fileDescriptionController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          FileNameValueKey: fileNameController.text,
          FileDescriptionValueKey: fileDescriptionController.text,
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

    for (var controller in _UploadTrDocDialogTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _UploadTrDocDialogFocusNodes.values) {
      focusNode.dispose();
    }

    _UploadTrDocDialogTextEditingControllers.clear();
    _UploadTrDocDialogFocusNodes.clear();
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

  String? get fileNameValue => this.formValueMap[FileNameValueKey] as String?;
  String? get fileDescriptionValue =>
      this.formValueMap[FileDescriptionValueKey] as String?;

  set fileNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FileNameValueKey: value}),
    );

    if (_UploadTrDocDialogTextEditingControllers.containsKey(
        FileNameValueKey)) {
      _UploadTrDocDialogTextEditingControllers[FileNameValueKey]?.text =
          value ?? '';
    }
  }

  set fileDescriptionValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FileDescriptionValueKey: value}),
    );

    if (_UploadTrDocDialogTextEditingControllers.containsKey(
        FileDescriptionValueKey)) {
      _UploadTrDocDialogTextEditingControllers[FileDescriptionValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasFileName =>
      this.formValueMap.containsKey(FileNameValueKey) &&
      (fileNameValue?.isNotEmpty ?? false);
  bool get hasFileDescription =>
      this.formValueMap.containsKey(FileDescriptionValueKey) &&
      (fileDescriptionValue?.isNotEmpty ?? false);

  bool get hasFileNameValidationMessage =>
      this.fieldsValidationMessages[FileNameValueKey]?.isNotEmpty ?? false;
  bool get hasFileDescriptionValidationMessage =>
      this.fieldsValidationMessages[FileDescriptionValueKey]?.isNotEmpty ??
      false;

  String? get fileNameValidationMessage =>
      this.fieldsValidationMessages[FileNameValueKey];
  String? get fileDescriptionValidationMessage =>
      this.fieldsValidationMessages[FileDescriptionValueKey];
}

extension Methods on FormStateHelper {
  setFileNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FileNameValueKey] = validationMessage;
  setFileDescriptionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FileDescriptionValueKey] =
          validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    fileNameValue = '';
    fileDescriptionValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FileNameValueKey: getValidationMessage(FileNameValueKey),
      FileDescriptionValueKey: getValidationMessage(FileDescriptionValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _UploadTrDocDialogTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _UploadTrDocDialogTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      FileNameValueKey: getValidationMessage(FileNameValueKey),
      FileDescriptionValueKey: getValidationMessage(FileDescriptionValueKey),
    });
