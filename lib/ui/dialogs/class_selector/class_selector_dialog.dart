import 'package:flutter/material.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/ui/widgets/common/classroom_widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'class_selector_dialog_model.dart';

class ClassSelectorDialog extends StackedView<ClassSelectorDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ClassSelectorDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ClassSelectorDialogModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    final widgetConfig = request.data as Map<String, dynamic>?;
    List<ClassroomModel> userClassrooms = widgetConfig!['userClassrooms'];

    return buildDialogScaffold(
        theme: theme,
        pageSize: pageSize,
        title: "Choose a Class",
        children: userClassrooms
            .map((e) => SizedBox(
                width: pageSize.width * 0.3,
                child: ClassroomCard(
                  classroom: e,
                  isDense: true,
                  onTap: (classroom) =>
                      viewModel.onClassSelection(completer, classroom),
                )))
            .toList());
  }

  @override
  ClassSelectorDialogModel viewModelBuilder(BuildContext context) =>
      ClassSelectorDialogModel();
}
