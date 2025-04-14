import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/app/app.dialogs.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/services/auth_service.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/ui/widgets/app_filters.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'exam_list_sectionmodel.dart';

class ExamListSection extends StackedView<ExamListSectionModel> {
  final List<ClassModel> userClasses;
  const ExamListSection({Key? key, required this.userClasses})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ExamListSectionModel viewModel,
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
                label: "Grade",
                selectedValue: viewModel.selectedExamGrade,
                onChanged: (val) {
                  viewModel.onChangeExamGrade(val);
                },
                items: [7, 8, 9].map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text("Grade ${value.toString()}"),
                  );
                }).toList(),
              ),
              AppFilterItem(
                label: "Class",
                selectedValue: viewModel.selectedClass,
                onChanged: (val) {
                  viewModel.onChangeClass(val);
                },
                items: userClasses
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
                label: "Date Range",
                priDateCtrl: viewModel.startDateTxtCtrl,
                secDateTxtCtrl: viewModel.endDateTxtCtrl,
                onDateChanged: viewModel.onDateChanged,
                firstEndPickerDate: viewModel.firstEndPickerDate,
              ),
            ],
          ),
          SizedBox(height: pageSize.height * 0.02),
          ExamListWidget(
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
  ExamListSectionModel viewModelBuilder(
    BuildContext context,
  ) =>
      ExamListSectionModel();
}

class ExamListWidget extends StatelessWidget {
  final List<ExamModel> examList;
  final Function(ExamModel exam) onViewExam;
  final Function? onViewMore;

  const ExamListWidget({
    super.key,
    required this.examList,
    required this.onViewExam,
    this.onViewMore,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return examList.isEmpty
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildNoItemsWidget("You have no available exams"),
              buildPriBtn(
                theme: theme,
                btnTxt: "Generate Exam",
                iconPath: FontAwesomeIcons.scroll,
                onAction: onGenerateExam,
              ),
            ],
          )
        : Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: examList.length,
                itemBuilder: (context, idx) {
                  ExamModel exam = examList[idx];
                  return ExamCard(
                    exam: exam,
                    onTap: onViewExam,
                  );
                },
              ),
              if (onViewMore != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: buildPriBtn(
                    theme: theme,
                    btnTxt: "View More",
                    iconPath: Icons.read_more,
                    onAction: () => onViewMore!(),
                  ),
                ),
            ],
          );
  }
}

class ExamCard extends StatelessWidget {
  final ExamModel exam;
  final Function onTap;

  const ExamCard({
    super.key,
    required this.exam,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateStr = exam.start_time != null
        ? appDayDateFormat.format(exam.start_time!)
        : '--';
    final durationStr = exam.duration_min != null
        ? '${exam.duration_min! ~/ 60}hr ${exam.duration_min! % 60} minutes'
        : '--';

    return GestureDetector(
      onTap: () => onTap(exam),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: theme.primaryColor,
              offset: const Offset(4, 4),
              spreadRadius: -1,
              blurRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.scroll,
                  size: theme.textTheme.headlineMedium!.fontSize,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Exam ${exam.code ?? "--"}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text('Grade ${exam.class_name ?? "--"} • $dateStr'),
                    Text(durationStr),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                buildStatusDot(
                  theme,
                  exam.status ?? "--",
                  getExamStatusColor(exam.status, theme),
                ),
                const SizedBox(height: 8),
                buildSecBtn(
                  theme: theme,
                  btnTxt: "View",
                  iconPath: Icons.open_in_new,
                  onAction: () => onTap(exam),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildWaitingWidget(double pageHeight) {
  return Image.asset(
    astImagesWaiting,
    height: pageHeight * 0.3,
  );
}

const String examStatProcessingKw = "Processing";
const String examStatUpcomingKw = "Upcoming";
const String examStatOngoingKw = "Ongoing";
const String examStatGradingKw = "Grading";
const String examStatCompleteKw = "Complete";
const List<String> allExamStatuses = [
  examStatProcessingKw,
  examStatUpcomingKw,
  examStatOngoingKw,
  examStatGradingKw,
  examStatCompleteKw,
];

enum ExamStatus { processing, upcoming, ongoing, grading, complete }

ExamStatus getExamEnumStatus(String? statusStr) {
  switch (statusStr) {
    case examStatProcessingKw:
      return ExamStatus.processing;
    case examStatUpcomingKw:
      return ExamStatus.upcoming;
    case examStatOngoingKw:
      return ExamStatus.ongoing;
    case examStatGradingKw:
      return ExamStatus.grading;
    case examStatCompleteKw:
      return ExamStatus.complete;
    default:
      break;
  }
  return ExamStatus.processing;
}

Color getExamStatusColor(String? statusStr, ThemeData theme) {
  if (statusStr != null) {
    ExamStatus statusEnum = getExamEnumStatus(statusStr);
    switch (statusEnum) {
      case ExamStatus.processing:
        return appPeach;
      case ExamStatus.upcoming:
        return appBlue;
      case ExamStatus.ongoing:
        return appGreen;
      case ExamStatus.grading:
        return appPurple;
      case ExamStatus.complete:
        return theme.primaryColor;
      default:
        break;
    }
  }
  return theme.primaryColor;
}

onGenerateExam() async {
  final dialogService = locator<DialogService>();
  final authService = locator<AuthService>();

  UserModel? loggedInUser = await authService.getUserProfile();
  final userClasses = loggedInUser?.user_classes;
  final hasMultipleClasses = (userClasses?.length ?? 0) > 1;

  final selectedClass = hasMultipleClasses
      ? (await dialogService.showCustomDialog(
          variant: DialogType.classSelector,
          data: {'userClasses': userClasses},
        ))
          ?.data as ClassModel?
      : userClasses?.first;

  if (selectedClass != null) {
    onGenerateClassExam(selectedClass);
  }
}

onGenerateClassExam(ClassModel classItem) async {
  final trOnboardService = locator<TeacherOnboardingService>();
  trOnboardService.onSetCurrentClass(classItem);
  trOnboardService.onSetIsFromOnboarding(false);
  final navigationService = locator<NavigationService>();
  navigationService.navigateToExamSetupView();
}
