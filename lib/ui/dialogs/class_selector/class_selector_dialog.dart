import 'package:flutter/material.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/ui/widgets/common/class_widgets.dart';
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
    List<ClassModel> userClasses = widgetConfig!['userClasses'];
    return buildDialogScaffold(
        theme: theme,
        pageSize: pageSize,
        title: "Choose a Class",
        children: userClasses
            .map((e) => ClassCard(
                  classItem: e,
                  isDense: true,
                  onTap: (classItem) =>
                      viewModel.onClassSelection(completer, classItem),
                ))
            .toList());
  }

  @override
  ClassSelectorDialogModel viewModelBuilder(BuildContext context) =>
      ClassSelectorDialogModel();
}
