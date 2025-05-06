import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';

class ClassroomCard extends StatelessWidget {
  final ClassroomModel classroom;
  final Function(ClassroomModel classroom) onTap;
  final bool isDense;

  const ClassroomCard({
    super.key,
    required this.classroom,
    required this.onTap,
    this.isDense = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: () {
        onTap(classroom);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: isDense
            ? ListTile(
                tileColor: theme.cardColor,
                leading: CircleAvatar(
                  backgroundColor: theme.colorScheme.secondaryContainer,
                  foregroundColor: theme.colorScheme.onPrimaryContainer,
                  child: Text("G${classroom.grade ?? "--"}"),
                ),
                title: Text(classroom.name ?? "--"),
                subtitle: Text('${classroom.student_count} Students'),
                trailing: buildIconBtn(
                  theme: theme,
                  onAction: () => onTap(classroom),
                  iconPath: Icons.call_made,
                ),
              )
            : Container(
                width: pageSize.width * 0.24,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            FontAwesomeIcons.flaskVial,
                            size: theme.textTheme.displayMedium!.fontSize,
                            color: theme.primaryColor,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Grade ${classroom.name}",
                            style: theme.textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          const Text("Integrated Science"),
                          if (classroom.student_count != null)
                            Text('${classroom.student_count} Students'),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Avg Term Score'),
                        Text(
                          '${(classroom.avg_term_score ?? 0.0).toStringAsFixed(1)}%',
                          style: theme.textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class TimeTableWidget extends StatelessWidget {
  final List<ClassLessonTime> lessons;

  const TimeTableWidget({super.key, required this.lessons});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    final grouped = groupLessons(lessons);
    final ScrollController scrollController = ScrollController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Timetable",
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(),
        SizedBox(
          height: pageSize.height * 0.4,
          child: Scrollbar(
            controller: scrollController,
            thumbVisibility: true,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: grouped.entries
                      .where((entry) => entry.value.isNotEmpty)
                      .map((entry) =>
                          buildSection(theme, entry.key, entry.value, context))
                      .toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSection(
    ThemeData theme,
    String label,
    List<ClassLessonTime> lessons,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          label,
          style: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        ...lessons
            .map((lesson) => buildLessonTile(theme, lesson, context))
            .toList(),
      ],
    );
  }

  Widget buildLessonTile(
    ThemeData theme,
    ClassLessonTime lesson,
    BuildContext context,
  ) {
    final timeString =
        TimeOfDay.fromDateTime(lesson.lessonTime).format(context);
    return Card(
      child: ListTile(
        leading: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              timeString,
              style: theme.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Icon(
              FontAwesomeIcons.personChalkboard,
              size: theme.textTheme.bodyMedium!.fontSize,
            ),
          ],
        ),
        title: Text(
          "Grade ${lesson.className} Lesson",
          style: theme.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: const Text("Integrated Science"),
      ),
    );
  }
}

class ClassLessonTime {
  final String className;
  final DateTime lessonTime;

  ClassLessonTime({
    required this.className,
    required this.lessonTime,
  });
}

Map<String, List<ClassLessonTime>> groupLessons(List<ClassLessonTime> lessons) {
  final todayLessons = <ClassLessonTime>[];
  final tomorrowLessons = <ClassLessonTime>[];
  final Map<String, List<ClassLessonTime>> laterLessons = {};

  for (var lesson in lessons) {
    final lessonDate = DateTime(
      lesson.lessonTime.year,
      lesson.lessonTime.month,
      lesson.lessonTime.day,
    );
    final todayDate = DateTime(today.year, today.month, today.day);
    final tomorrowDate = DateTime(tomorrow.year, tomorrow.month, tomorrow.day);

    if (lessonDate == todayDate) {
      todayLessons.add(lesson);
    } else if (lessonDate == tomorrowDate) {
      tomorrowLessons.add(lesson);
    } else {
      final formattedDate = shortDayDateFormat.format(lessonDate);
      laterLessons.putIfAbsent(formattedDate, () => []).add(lesson);
    }
  }

  return {
    'Today, ${shortDayDateFormat.format(today)}': todayLessons,
    'Tomorrow, ${shortDayDateFormat.format(tomorrow)}': tomorrowLessons,
    ...laterLessons,
  };
}
