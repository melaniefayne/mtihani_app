import 'package:flutter/material.dart';
import 'package:mtihani_app/models/cbc.dart';
import 'package:mtihani_app/ui/widgets/app_collapsible_bar.dart';
import 'package:mtihani_app/ui/widgets/app_search_table.dart';
import 'package:mtihani_app/ui/widgets/app_tab_bar.dart';

class StrandCard extends StatelessWidget {
  final StrandModel strand;
  const StrandCard({super.key, required this.strand});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.primary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Text(
                  strand.number?.toString() ?? "--",
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                  ),
                ),
              ),
              SizedBox(width: pageSize.width * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    strand.name ?? "--",
                    style: theme.textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.primaryColor,
                    ),
                  ),
                  Text("Grade ${strand.grade}"),
                ],
              ),
            ],
          ),
          Divider(color: theme.primaryColor, thickness: 2.0),
          SizedBox(height: pageSize.height * 0.02),
          AppCollapsibleScaffold(
            tabs: (strand.sub_strands ?? [])
                .map(
                  (subStrand) => TabViewItem(
                    label: subStrand.name ?? "--",
                    leadingWidget: Text(
                      subStrand.number?.toString() ?? "--",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor,
                      ),
                    ),
                    widget: buildSubStrandSection(
                      theme: theme,
                      subStrand: subStrand,
                      pageSize: pageSize,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  buildSubStrandSection({
    required ThemeData theme,
    required SubStrandModel subStrand,
    required Size pageSize,
  }) {
    return AppSearchTable(
      hasCount: false,
      hideTotalCount: true,
      rowHeight: pageSize.height * 0.45,
      tableHeight: pageSize.height * 0.45,
      frozenColumnsCount: 0,
      tableHeaders: const [
        "Description",
        "Key Inquiries",
        "Learning Outcomes",
        "Assessment Rubrics",
        "Learning Experiences",
        "Core Competencies",
        "Values",
        "Pertinent Issues",
        "Other Learning Areas",
        "Learning Materials",
        "Non Formal Activities",
      ],
      tableRows: [
        DataRow(
          cells: [
            DataCell(buildListSection(items: subStrand.descriptions)),
            DataCell(buildListSection(items: subStrand.key_inquiries)),
            DataCell(buildListSection(items: subStrand.learning_outcomes)),
            DataCell(
              (subStrand.skills == null || (subStrand.skills ?? []).isEmpty)
                  ? const SizedBox.shrink()
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: subStrand.skills!.length,
                      itemBuilder: (context, idx) =>
                          SkillRubricWidget(skillData: subStrand.skills![idx]),
                    ),
            ),
            DataCell(buildListSection(items: subStrand.learning_experiences)),
            DataCell(buildListSection(items: subStrand.core_competencies)),
            DataCell(buildListSection(items: subStrand.values)),
            DataCell(buildListSection(items: subStrand.pertinent_issues)),
            DataCell(buildListSection(items: subStrand.other_learning_areas)),
            DataCell(buildListSection(items: subStrand.learning_materials)),
            DataCell(buildListSection(items: subStrand.non_formal_activities)),
          ],
        ),
      ],
      itemsText: "No curriculum for this sub strand found",
    );
  }

  buildListSection({
    List<String>? items,
  }) {
    if (items == null || items.isEmpty) return const SizedBox.shrink();

    return ListView.builder(
      // shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, idx) => Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text("• ${items[idx]}"),
      ),
    );
  }
}

class SkillRubricWidget extends StatelessWidget {
  final SubStrandSkillModel skillData;

  const SkillRubricWidget({super.key, required this.skillData});

  @override
  Widget build(BuildContext context) {
    final String skill = skillData.skill ?? "--";
    final List<SkillRubricModel> rubrics = skillData.rubrics ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("• $skill", style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...rubrics.map<Widget>((rubric) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
            child: Text(
                "• ${rubric.expectation ?? "--"}: ${rubric.description ?? "--"}"),
          );
        }).toList(),
      ],
    );
  }
}
