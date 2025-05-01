import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/dialogs/join_class/join_class_dialog.form.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/ui/widgets/app_text_form_field.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'join_class_dialog_model.dart';

@FormView(fields: [
  FormTextField(name: 'student_code', validator: formAlphanumericValidator),
])
class JoinClassDialog extends StackedView<JoinClassDialogModel>
    with $JoinClassDialog {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const JoinClassDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  void onDispose(JoinClassDialogModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  Widget builder(
    BuildContext context,
    JoinClassDialogModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return buildDialogScaffold(
      theme: theme,
      pageSize: pageSize,
      title: "Join Class",
      children: [
        SizedBox(
          width: pageSize.width * 0.45,
          child: AppTextFormField(
            label: "Student Code",
            inputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            controller: studentCodeController,
            errorText: viewModel.studentCodeValidationMessage,
            hintText: "The alphanumeric code your teacher sent you :)",
          ),
        ),
        const SizedBox(height: 16),
        buildPriBtn(
          theme: theme,
          onAction: () {
            viewModel.onApiJoinClass(completer);
          },
          iconPath: FontAwesomeIcons.usersRectangle,
          btnTxt: 'Join Class',
          isLoading: viewModel.isLoading,
        ),
      ],
    );
  }

  @override
  JoinClassDialogModel viewModelBuilder(BuildContext context) =>
      JoinClassDialogModel();

  @override
  void onViewModelReady(JoinClassDialogModel viewModel) {
    syncFormWithViewModel(viewModel);
  }
}
