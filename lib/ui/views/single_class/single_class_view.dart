import 'package:flutter/material.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:stacked/stacked.dart';

import 'single_class_viewmodel.dart';

class SingleClassView extends StackedView<SingleClassViewModel> {
  final ClassModel classItem;
  const SingleClassView({Key? key, required this.classItem}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SingleClassViewModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(
      body: Center(
        child: Text("SingleClassView :)"),
      ),
    );
  }

  @override
  SingleClassViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SingleClassViewModel(classItem);
}
