import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/classroom.dart';
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
