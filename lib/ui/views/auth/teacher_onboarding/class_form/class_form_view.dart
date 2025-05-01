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
  FormTextField(name: 'className', validator: formAlphanumericValidator),
  FormTextField(name: 'schoolName', validator: formStrValueValidator),
  FormTextField(name: 'schoolAddress', validator: formStrValueValidator),
])
class ClassFormView extends StackedView<ClassFormViewModel>
    with $ClassFormView {
  const ClassFormView({Key? key}) : super(key: key);

  @override
  void onDispose(ClassFormViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

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
        padding: EdgeInsets.all(pageSize.width * 0.02),
        child: Column(
          children: [
            if (!viewModel.isClassEdit)
              Padding(
                padding: EdgeInsets.only(bottom: pageSize.height * 0.02),
                child: viewModel.isFromOnboarding
                    ? buildPageAppHeader(
                        theme: theme,
                        pageTitle: viewModel.pageTitle,
                        hideBackNav: false,
                      )
                    : buildPageTitle(
                        theme: theme,
                        pageTitle: viewModel.pageTitle,
                        actionTxt: viewModel.isFromOnboarding ? "Skip" : "Back",
                        action: viewModel.onGoToHome,
                      ),
              ),
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
            if (!viewModel.isFromOnboarding && viewModel.classToEdit != null)
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.errorContainer.withOpacity(0.1),
                  border: Border.all(
                      width: 1.0, color: theme.colorScheme.errorContainer),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_amber_outlined,
                      color: theme.colorScheme.onErrorContainer,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Heads up! Uploading a new student list will replace the existing one. If you're updating term scores, be sure to include all scores up to the current term for each student. To add a new student, simply include them as a new row in your file. Also, make sure each student has a unique name to avoid duplicates.",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
              ),
            ClassDetailsUploader(
              onParsed: viewModel.onClassCsvUploaded,
              errorText: viewModel.uploadStudentsErrorMsg,
            ),
            SizedBox(height: pageSize.height * 0.02),
            buildPriBtn(
              theme: theme,
              btnTxt: viewModel.pageTitle,
              isLoading: viewModel.isLoading,
              onAction: viewModel.onApiClassCreate,
              isFullWidth: true,
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
    viewModel.onClassFormViewReady();
    classNameController.text = viewModel.classNameValue ?? "";
    schoolNameController.text = viewModel.schoolNameValue ?? "";
    schoolAddressController.text = viewModel.schoolAddressValue ?? "";
    syncFormWithViewModel(viewModel);
  }
}
