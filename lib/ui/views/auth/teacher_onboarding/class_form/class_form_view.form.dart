// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String ClassNameValueKey = 'className';
const String SchoolNameValueKey = 'schoolName';
const String SchoolAddressValueKey = 'schoolAddress';

final Map<String, TextEditingController> _ClassFormViewTextEditingControllers =
    {};

final Map<String, FocusNode> _ClassFormViewFocusNodes = {};

final Map<String, String? Function(String?)?> _ClassFormViewTextValidations = {
  ClassNameValueKey: formStrValueValidator,
  SchoolNameValueKey: formStrValueValidator,
  SchoolAddressValueKey: formStrValueValidator,
};

mixin $ClassFormView {
  TextEditingController get classNameController =>
      _getFormTextEditingController(ClassNameValueKey);
  TextEditingController get schoolNameController =>
      _getFormTextEditingController(SchoolNameValueKey);
  TextEditingController get schoolAddressController =>
      _getFormTextEditingController(SchoolAddressValueKey);

  FocusNode get classNameFocusNode => _getFormFocusNode(ClassNameValueKey);
  FocusNode get schoolNameFocusNode => _getFormFocusNode(SchoolNameValueKey);
  FocusNode get schoolAddressFocusNode =>
      _getFormFocusNode(SchoolAddressValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_ClassFormViewTextEditingControllers.containsKey(key)) {
      return _ClassFormViewTextEditingControllers[key]!;
    }

    _ClassFormViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ClassFormViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ClassFormViewFocusNodes.containsKey(key)) {
      return _ClassFormViewFocusNodes[key]!;
    }
    _ClassFormViewFocusNodes[key] = FocusNode();
    return _ClassFormViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    classNameController.addListener(() => _updateFormData(model));
    schoolNameController.addListener(() => _updateFormData(model));
    schoolAddressController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    classNameController.addListener(() => _updateFormData(model));
    schoolNameController.addListener(() => _updateFormData(model));
    schoolAddressController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          ClassNameValueKey: classNameController.text,
          SchoolNameValueKey: schoolNameController.text,
          SchoolAddressValueKey: schoolAddressController.text,
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

    for (var controller in _ClassFormViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ClassFormViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ClassFormViewTextEditingControllers.clear();
    _ClassFormViewFocusNodes.clear();
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

  String? get classNameValue => this.formValueMap[ClassNameValueKey] as String?;
  String? get schoolNameValue =>
      this.formValueMap[SchoolNameValueKey] as String?;
  String? get schoolAddressValue =>
      this.formValueMap[SchoolAddressValueKey] as String?;

  set classNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ClassNameValueKey: value}),
    );

    if (_ClassFormViewTextEditingControllers.containsKey(ClassNameValueKey)) {
      _ClassFormViewTextEditingControllers[ClassNameValueKey]?.text =
          value ?? '';
    }
  }

  set schoolNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({SchoolNameValueKey: value}),
    );

    if (_ClassFormViewTextEditingControllers.containsKey(SchoolNameValueKey)) {
      _ClassFormViewTextEditingControllers[SchoolNameValueKey]?.text =
          value ?? '';
    }
  }

  set schoolAddressValue(String? value) {
    this.setData(
      this.formValueMap..addAll({SchoolAddressValueKey: value}),
    );

    if (_ClassFormViewTextEditingControllers.containsKey(
        SchoolAddressValueKey)) {
      _ClassFormViewTextEditingControllers[SchoolAddressValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasClassName =>
      this.formValueMap.containsKey(ClassNameValueKey) &&
      (classNameValue?.isNotEmpty ?? false);
  bool get hasSchoolName =>
      this.formValueMap.containsKey(SchoolNameValueKey) &&
      (schoolNameValue?.isNotEmpty ?? false);
  bool get hasSchoolAddress =>
      this.formValueMap.containsKey(SchoolAddressValueKey) &&
      (schoolAddressValue?.isNotEmpty ?? false);

  bool get hasClassNameValidationMessage =>
      this.fieldsValidationMessages[ClassNameValueKey]?.isNotEmpty ?? false;
  bool get hasSchoolNameValidationMessage =>
      this.fieldsValidationMessages[SchoolNameValueKey]?.isNotEmpty ?? false;
  bool get hasSchoolAddressValidationMessage =>
      this.fieldsValidationMessages[SchoolAddressValueKey]?.isNotEmpty ?? false;

  String? get classNameValidationMessage =>
      this.fieldsValidationMessages[ClassNameValueKey];
  String? get schoolNameValidationMessage =>
      this.fieldsValidationMessages[SchoolNameValueKey];
  String? get schoolAddressValidationMessage =>
      this.fieldsValidationMessages[SchoolAddressValueKey];
}

extension Methods on FormStateHelper {
  setClassNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ClassNameValueKey] = validationMessage;
  setSchoolNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SchoolNameValueKey] = validationMessage;
  setSchoolAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SchoolAddressValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    classNameValue = '';
    schoolNameValue = '';
    schoolAddressValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      ClassNameValueKey: getValidationMessage(ClassNameValueKey),
      SchoolNameValueKey: getValidationMessage(SchoolNameValueKey),
      SchoolAddressValueKey: getValidationMessage(SchoolAddressValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _ClassFormViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _ClassFormViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      ClassNameValueKey: getValidationMessage(ClassNameValueKey),
      SchoolNameValueKey: getValidationMessage(SchoolNameValueKey),
      SchoolAddressValueKey: getValidationMessage(SchoolAddressValueKey),
    });
