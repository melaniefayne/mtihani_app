import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';

class ClassroomCard extends StatelessWidget {
  final ClassroomModel classroom;
  final Function(ClassroomModel classroom)? onTap;
  final bool isDense;

  const ClassroomCard({
    super.key,
    required this.classroom,
    this.onTap,
    this.isDense = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!(classroom);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: isDense
            ? ListTile(
                leading: CircleAvatar(
                  child: Text(
                    "G${classroom.grade ?? "--"}",
                  ),
                ),
                title: Text(classroom.name ?? "--"),
                subtitle: Text('${classroom.student_count} Students'),
                trailing: onTap != null
                    ? buildIconBtn(
                        theme: theme,
                        onAction: () => onTap!,
                        iconPath: Icons.call_made)
                    : null,
              )
            : Container(
                width: pageSize.width * 0.2,
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
                          Text('${classroom.student_count} Students'),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Avg Term Score'),
                        Text(
                          '${classroom.avg_term_score ?? "--"}%',
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

class StudentClassroomCard extends StatelessWidget {
  final StudentClassModel studentClassroom;
  final Function(StudentClassModel studentClassroom)? onTap;

  const StudentClassroomCard({
    super.key,
    required this.studentClassroom,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    ClassroomModel classroom = studentClassroom.classroom!;
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!(studentClassroom);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: pageSize.width * 0.2,
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
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Avg Term Score'),
                  Text(
                    '${classroom.avg_term_score ?? "--"}%',
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
    final grouped = groupLessons(lessons);

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
        ...grouped.entries
            .where((entry) => entry.value.isNotEmpty)
            .map(
                (entry) => buildSection(theme, entry.key, entry.value, context))
            .toList(),
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
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            label,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
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
    return ListTile(
      leading: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            timeString,
            style: theme.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Icon(FontAwesomeIcons.personChalkboard),
        ],
      ),
      title: Text(
        "Grade ${lesson.className} 'Lesson'}",
        style: theme.textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: const Text("Integrated Science"),
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
  final now = DateTime.now();
  final today = <ClassLessonTime>[];
  final tomorrow = <ClassLessonTime>[];
  final later = <ClassLessonTime>[];

  for (var lesson in lessons) {
    final lessonDate = DateTime(
        lesson.lessonTime.year, lesson.lessonTime.month, lesson.lessonTime.day);
    final todayDate = DateTime(now.year, now.month, now.day);
    final tomorrowDate = todayDate.add(const Duration(days: 1));

    if (lessonDate == todayDate) {
      today.add(lesson);
    } else if (lessonDate == tomorrowDate) {
      tomorrow.add(lesson);
    } else {
      later.add(lesson);
    }
  }

  return {
    'Today': today,
    'Tomorrow': tomorrow,
    'Later': later,
  };
}
