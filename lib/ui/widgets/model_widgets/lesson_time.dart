import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';

class ClassLessonTime {
  final String className;
  final DateTime lessonTime;

  ClassLessonTime({required this.className, required this.lessonTime});
}

Widget buildLessonTimeCard(
    {required ThemeData theme, required ClassLessonTime classLesson}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                appTimeFormat.format(classLesson.lessonTime),
                style: theme.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Icon(FontAwesomeIcons.personChalkboard),
            ],
          ),
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Grade ${classLesson.className} Lesson",
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: " • Integrated Science"),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
