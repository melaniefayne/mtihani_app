import 'package:flutter/material.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/models/student.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/ui/widgets/app_filters.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';

import 'student_list_sectionmodel.dart';

class StudentListSection extends StackedView<StudentListSectionModel> {
  final ClassModel classItem;
  final bool showTermScore;
  final bool showMtihaniScore;
  const StudentListSection({
    super.key,
    required this.classItem,
    this.showTermScore = true,
    this.showMtihaniScore = false,
  });

  @override
  Widget builder(
    BuildContext context,
    StudentListSectionModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCountWidget(
            theme: theme,
            label: "Class Students",
            count: viewModel.classStudents.length,
          ),
          const Divider(),
          SizedBox(height: pageSize.height * 0.02),
          AppPageFilters(
            filters: [
              AppFilterItem(
                label: "Expectation Level",
                selectedValue: viewModel.selectedExpectationLevel,
                onChanged: (val) {
                  viewModel.onChangeExpectationLevel(val);
                },
                items: allExpectationLevels
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          SizedBox(height: pageSize.height * 0.02),
          StudentListWidget(
            studentList: viewModel.classStudents,
            onViewStudent: viewModel.onViewStudent,
            showTermScore: showTermScore,
            showMtihaniScore: showMtihaniScore,
            onViewMore: viewModel.nextPageUrl != null
                ? viewModel.onViewMoreStudents
                : null,
          ),
        ],
      ),
    );
  }

  @override
  StudentListSectionModel viewModelBuilder(
    BuildContext context,
  ) =>
      StudentListSectionModel(classItem);
}

class StudentListWidget extends StatelessWidget {
  final List<StudentModel> studentList;
  final Function(StudentModel exam) onViewStudent;
  final Function? onViewMore;
  final bool showTermScore;
  final bool showMtihaniScore;

  const StudentListWidget({
    super.key,
    required this.studentList,
    required this.onViewStudent,
    this.onViewMore,
    required this.showTermScore,
    required this.showMtihaniScore,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return studentList.isEmpty
        ? buildNoItemsWidget("No students available")
        : Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: studentList.length,
                itemBuilder: (context, idx) {
                  StudentModel student = studentList[idx];
                  return StudentCard(
                    student: student,
                    onTap: onViewStudent,
                    showTermScore: showTermScore,
                    showMtihaniScore: showMtihaniScore,
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

class StudentCard extends StatelessWidget {
  final StudentModel student;
  final Function onTap;
  final bool showTermScore;
  final bool showMtihaniScore;

  const StudentCard({
    super.key,
    required this.student,
    required this.onTap,
    required this.showTermScore,
    required this.showMtihaniScore,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String studentStatus = (showTermScore
            ? student.avg_term_expectation_level
            : student.avg_mtihani_expectation_level) ??
        "--";

    return GestureDetector(
      onTap: () => onTap(student),
      child: ListTile(
        leading: Icon(
          Icons.person_outline,
          color: theme.primaryColor,
        ),
        title: Text(
          student.name ?? "--",
          style: theme.textTheme.titleMedium,
        ),
        subtitle: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text:
                    "${(showTermScore ? student.avg_term_score : student.avg_mtihani_score) ?? "--"}%",
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                ),
              ),
              const TextSpan(text: " • "),
              TextSpan(
                text:
                    "${(showTermScore ? student.avg_term_expectation_level : student.avg_term_expectation_level) ?? "--"}%",
              ),
            ],
          ),
        ),
        trailing: Column(
          children: [
            buildStatusDot(
              theme,
              studentStatus,
              getStudentELStatusColor(studentStatus, theme),
            ),
            const SizedBox(height: 8),
            buildIconBtn(
              theme: theme,
              onAction: onTap(student),
              iconPath: Icons.call_made,
            ),
          ],
        ),
      ),
    );
  }
}

const String examStatExceedingKw = "Exceeding";
const String examStatMeetingKw = "Meeting";
const String examStatApproachingKw = "Approaching";
const String examStatBelowKw = "Below";
const List<String> allExpectationLevels = [
  examStatExceedingKw,
  examStatMeetingKw,
  examStatApproachingKw,
  examStatBelowKw,
];

enum StudentELStatus { exceeding, meeting, approaching, below }

StudentELStatus getExamEnumStatus(String? statusStr) {
  switch (statusStr) {
    case examStatExceedingKw:
      return StudentELStatus.exceeding;
    case examStatMeetingKw:
      return StudentELStatus.meeting;
    case examStatApproachingKw:
      return StudentELStatus.approaching;
    case examStatBelowKw:
      return StudentELStatus.below;
    default:
      break;
  }
  return StudentELStatus.exceeding;
}

Color getStudentELStatusColor(String? statusStr, ThemeData theme) {
  if (statusStr != null) {
    StudentELStatus statusEnum = getExamEnumStatus(statusStr);
    switch (statusEnum) {
      case StudentELStatus.exceeding:
        return appGreen;
      case StudentELStatus.meeting:
        return appBlue;
      case StudentELStatus.approaching:
        return appPurple;
      case StudentELStatus.below:
        return appPeach;
      default:
        break;
    }
  }
  return theme.primaryColor;
}
