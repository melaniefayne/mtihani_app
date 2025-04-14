import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/ui/widgets/app_filters.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/ui/widgets/model_widgets/exam_widgets.dart';
import 'package:stacked/stacked.dart';

import 'exam_list_viewmodel.dart';

class ExamListView extends StackedView<ExamListViewModel> {
  final UserModel loggedInUser;
  const ExamListView({Key? key, required this.loggedInUser}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ExamListViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCountWidget(
                theme: theme,
                label: "All Exams",
                count: viewModel.userExams.length,
              ),
              buildPriBtn(
                theme: theme,
                btnTxt: "Generate Exam",
                isFullWidth: false,
                iconPath: FontAwesomeIcons.scroll,
                onAction: onGenerateExam,
              ),
            ],
          ),
          const Divider(),
          SizedBox(height: pageSize.height * 0.02),
          AppPageFilters(
            filters: [
              AppFilterItem(
                label: "Class",
                selectedValue: viewModel.selectedClass,
                onChanged: (val) {
                  viewModel.onChangeClass(val);
                },
                items: (loggedInUser.user_classes ?? [])
                    .map<DropdownMenuItem<ClassModel>>((ClassModel value) {
                  return DropdownMenuItem<ClassModel>(
                    value: value,
                    child: Text(value.name ?? "--"),
                  );
                }).toList(),
              ),
              AppFilterItem(
                label: "Status",
                selectedValue: viewModel.selectedExamStatus,
                onChanged: (val) {
                  viewModel.onChangeClass(val);
                },
                items: allExamStatuses
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              AppFilterItem(
                label: "Status",
                priDateCtrl: viewModel.startDateTxtCtrl,
                secDateTxtCtrl: viewModel.endDateTxtCtrl,
                onDateChanged: viewModel.onDateChanged,
                firstEndPickerDate: viewModel.firstEndPickerDate,
              ),
            ],
          ),
          SizedBox(height: pageSize.height * 0.02),
          ExamList(
            examList: viewModel.userExams,
            onViewExam: viewModel.onViewExam,
            onViewMore: viewModel.nextPageUrl != null
                ? viewModel.onViewMoreExams
                : null,
          ),
        ],
      ),
    );
  }

  @override
  ExamListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ExamListViewModel(loggedInUser);
}
