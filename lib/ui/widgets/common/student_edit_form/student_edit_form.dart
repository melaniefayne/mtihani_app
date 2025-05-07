import 'package:flutter/material.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/ui/widgets/app_text_form_field.dart';
import 'package:mtihani_app/ui/widgets/common/student_edit_form/student_edit_form.form.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'student_edit_form_model.dart';

@FormView(fields: [
  FormTextField(name: 'studentName', validator: formStrValueValidator),
])
class StudentEditForm extends StackedView<StudentEditFormModel>
    with $StudentEditForm {
  final StudentModel student;
  final Function(Map<String, dynamic> updateBody) onApiUpdateStudent;
  const StudentEditForm({
    super.key,
    required this.student,
    required this.onApiUpdateStudent,
  });

  @override
  Widget builder(
    BuildContext context,
    StudentEditFormModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormField(
            label: "Student Name",
            inputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            controller: studentNameController,
            errorText: viewModel.studentNameValidationMessage,
          ),
          Text(
            "Term Scores",
            style: theme.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          const Divider(),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15.0,
              childAspectRatio: 6.5,
            ),
            itemCount: viewModel.editableTermScores.length,
            itemBuilder: (context, idx) {
              final editableScore = viewModel.editableTermScores[idx];
              return AppTextFormField(
                label:
                    "Grade ${editableScore.termScore!.grade} Term  ${editableScore.termScore!.term}",
                controller: editableScore.scoreTxtCtrl,
                inputType: const TextInputType.numberWithOptions(decimal: true),
                style: theme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
                validator: editableScore.termScore?.score != null
                    ? formDoubleValidator
                    : null,
              );
            },
          ),
          const SizedBox(height: 10),
          buildPriBtn(
            theme: theme,
            iconPath: Icons.edit,
            btnTxt: "Update Student",
            onAction: viewModel.onUpdateStudent,
          ),
        ],
      ),
    );
  }

  @override
  StudentEditFormModel viewModelBuilder(
    BuildContext context,
  ) =>
      StudentEditFormModel(student, onApiUpdateStudent);

  @override
  void onViewModelReady(StudentEditFormModel viewModel) {
    viewModel.onStudentFormViewReady();
    studentNameController.text = viewModel.studentNameValue ?? "";
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(StudentEditFormModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
