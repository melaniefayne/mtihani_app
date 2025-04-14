import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/class_form/class_form_view.form.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/utils.dart';
import 'package:mtihani_app/ui/widgets/app_class_upload_field.dart';
import 'package:mtihani_app/ui/widgets/app_dates_form_field.dart';
import 'package:mtihani_app/ui/widgets/app_text_form_field.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'class_form_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'className', validator: formStrValueValidator),
  FormTextField(name: 'schoolName', validator: formStrValueValidator),
  FormTextField(name: 'schoolAddress', validator: formStrValueValidator),
])
class ClassFormView extends StackedView<ClassFormViewModel>
    with $ClassFormView {
  const ClassFormView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ClassFormViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    double rowFieldFactor = 0.33;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(pageSize.width * 0.04),
        child: Column(
          children: [
            buildPageTitle(
              theme: theme,
              pageTitle: "Create A Class",
              actionTxt: viewModel.isFromOnboarding ? "Skip" : "Back",
              action: viewModel.onGoToHome,
            ),
            SizedBox(height: pageSize.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: pageSize.width * rowFieldFactor,
                  child: AppTextFormField(
                    label: "School Name",
                    inputType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    controller: schoolNameController,
                    errorText: viewModel.schoolNameValidationMessage,
                  ),
                ),
                SizedBox(
                  width: pageSize.width * rowFieldFactor,
                  child: AppTextFormField(
                    label: "School Address",
                    inputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: schoolAddressController,
                    errorText: viewModel.schoolAddressValidationMessage,
                  ),
                ),
              ],
            ),
            AppTextFormField(
              label: "Class Name",
              inputType: TextInputType.name,
              textInputAction: TextInputAction.next,
              controller: classNameController,
              hintText: "Example: 8 Blue, 7 North, 9A",
              errorText: viewModel.classNameValidationMessage,
            ),
            buildDropDownFormField(
              theme: theme,
              label: "Grade",
              selectedValue: viewModel.selectedGrade,
              errorText: viewModel.gradeErrorMsg,
              items: appGradeLevels.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text("Grade $value"),
                );
              }).toList(),
              onChanged: (val) => viewModel.onGradeChanged(val),
            ),
            AppDatesFormField(
              label: 'Lesson Times',
              selectedValues: viewModel.selectedLessonTimes,
              onSelected: viewModel.onSelectedLessonTime,
              onRemoved: viewModel.onRemovedLessonTime,
              errorText: viewModel.lessonTimesErrorMsg,
            ),
            ClassDetailsUploader(
              onParsed: viewModel.onClassCsvUploaded,
              errorText: viewModel.uploadStudentsErrorMsg,
            ),
            SizedBox(height: pageSize.height * 0.02),
            buildPriBtn(
              theme: theme,
              btnTxt: 'Create a Class',
              isLoading: viewModel.isLoading,
              onAction: viewModel.onApiClassCreate,
            ),
          ],
        ),
      ),
    );
  }

  @override
  ClassFormViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ClassFormViewModel();

  @override
  void onViewModelReady(ClassFormViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }
}
