import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/widgets/common/exam_list_secton/exam_list_section.dart';
import 'package:mtihani_app/ui/widgets/app_start_end_date_form.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';

class ExamDetailsWidget extends StatelessWidget {
  final ExamModel examItem;
  final Function() onEditExamTime;
  final Function(DateTime startTime, DateTime endTime) onDateTimesSelected;

  const ExamDetailsWidget({
    super.key,
    required this.examItem,
    required this.onEditExamTime,
    required this.onDateTimesSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    ExamStatus examStatus = getExamEnumStatus(examItem.status);

    return SingleChildScrollView(
      child: Column(
        children: [
          buildPageAppHeader(
            theme: theme,
            iconPath: Icons.av_timer,
            pageTitle: "Time Details",
            trailing: examStatus == ExamStatus.upcoming
                ? buildPriBtn(
                    theme: theme,
                    btnTxt: "Edit",
                    onAction: onEditExamTime,
                  )
                : null,
          ),
          AppStartEndDateForm(
            isReadOnly: examStatus != ExamStatus.upcoming,
            setDateTimes: [examItem.start_time!, examItem.end_time!],
            onDateTimesSelected: onDateTimesSelected,
          ),
          buildPageAppHeader(
            theme: theme,
            iconPath: FontAwesomeIcons.chartPie,
            pageTitle: "Question Analysis",
          ),
          const Center(child: Text("Coming Soon ...")),
          buildPageAppHeader(
            theme: theme,
            iconPath: FontAwesomeIcons.rectangleList,
            pageTitle: "Question Listings",
          ),
          const Center(child: Text("Coming Soon ...")),
        ],
      ),
    );
  }
}
