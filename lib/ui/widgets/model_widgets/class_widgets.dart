import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';

class ClassCard extends StatelessWidget {
  final ClassModel classItem;
  final Function(ClassModel classItem)? onTap;
  final bool isDense;

  const ClassCard({
    super.key,
    required this.classItem,
    this.onTap,
    this.isDense = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!(classItem);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: isDense
            ? ListTile(
                leading: CircleAvatar(
                  child: Text(
                    "G${classItem.grade ?? "--"}",
                  ),
                ),
                title: Text(classItem.name ?? "--"),
                subtitle: Text('${classItem.student_count} Students'),
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
                            "Grade ${classItem.name}",
                            style: theme.textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          const Text("Integrated Science"),
                          Text('${classItem.student_count} Students'),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Avg Term Score'),
                        Text(
                          '${classItem.avg_term_score ?? "--"}%',
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
