import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/cbc.dart';
import 'package:mtihani_app/ui/widgets/app_animated_counter.dart';
import 'package:mtihani_app/ui/widgets/app_collapsible_bar.dart';
import 'package:mtihani_app/ui/widgets/app_search_table.dart';
import 'package:mtihani_app/ui/widgets/app_tab_bar.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';

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
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeaderWidget(
          theme: theme,
          title: "Lesson Count",
          leadingWidget: const Icon(FontAwesomeIcons.chalkboardUser),
        ),
        Center(
          child: AppAnimatedCounter(
            valueToAnimate: subStrand.lesson_count ?? 0,
            postTexts: const [TextSpan(text: "Lessons")],
          ),
        ),
        const Divider(),
        if (subStrand.descriptions != null &&
            subStrand.descriptions!.isNotEmpty)
          buildSection(
            theme: theme,
            label: "Description",
            mainIcon: Icons.summarize,
            subIcon: Icons.summarize_outlined,
            items: subStrand.descriptions!,
          ),
        if (subStrand.key_inquiries != null &&
            subStrand.key_inquiries!.isNotEmpty)
          buildSection(
            theme: theme,
            label: "Key Inquiries",
            mainIcon: Icons.help,
            subIcon: Icons.question_mark,
            items: subStrand.key_inquiries!,
          ),
        if (subStrand.learning_outcomes != null &&
            subStrand.learning_outcomes!.isNotEmpty)
          buildSection(
            theme: theme,
            label: "Learning Outcomes",
            mainIcon: Icons.outbox_rounded,
            subIcon: Icons.outbox_outlined,
            items: subStrand.learning_outcomes!,
          ),
        if (subStrand.skills != null && subStrand.skills!.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildHeaderWidget(
                theme: theme,
                title: "Assessment Rubrics",
                leadingWidget: const Icon(Icons.check_circle),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: subStrand.skills!.length,
                itemBuilder: (context, idx) => AppSearchTable(
                  hasCount: false,
                  hideTotalCount: true,
                  tableTitle: subStrand.skills![idx].skill ?? "--",
                  tableHeaders: const ["Expectation Level", "Description"],
                  tableRows: List.generate(
                    (subStrand.skills![idx].skillRubrics ?? []).length,
                    (int idx) {
                      SkillRubricModel skillRubric =
                          (subStrand.skills![idx].skillRubrics ?? [])[idx];

                      return DataRow(
                        cells: [
                          DataCell(Text(
                            skillRubric.expectation ?? "--",
                            style: theme.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.primaryColor,
                            ),
                          )),
                          DataCell(
                            Text(
                              skillRubric.description ?? "--",
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  itemsText: "No skill rubrics available",
                ),
              ),
              const Divider(),
            ],
          ),
        if (subStrand.learning_experiences != null &&
            subStrand.learning_experiences!.isNotEmpty)
          buildSection(
            theme: theme,
            label: "Learning Experiences",
            mainIcon: Icons.category,
            subIcon: Icons.category_outlined,
            items: subStrand.learning_experiences!,
          ),
        if (subStrand.core_competencies != null &&
            subStrand.core_competencies!.isNotEmpty)
          buildSection(
            theme: theme,
            label: "Core Competencies",
            mainIcon: Icons.language,
            subIcon: Icons.language_outlined,
            items: subStrand.core_competencies!,
          ),
        if (subStrand.values != null && subStrand.values!.isNotEmpty)
          buildSection(
            theme: theme,
            label: "Values",
            mainIcon: Icons.interests,
            subIcon: Icons.interests_outlined,
            items: subStrand.values!,
          ),
        if (subStrand.pertinent_issues != null &&
            subStrand.pertinent_issues!.isNotEmpty)
          buildSection(
            theme: theme,
            label: "Pertinent Issues",
            mainIcon: Icons.star,
            subIcon: Icons.star_border,
            items: subStrand.pertinent_issues!,
          ),
        if (subStrand.other_learning_areas != null &&
            subStrand.other_learning_areas!.isNotEmpty)
          buildSection(
            theme: theme,
            label: "Other Learning Areas",
            mainIcon: FontAwesomeIcons.folderTree,
            subIcon: Icons.folder,
            items: subStrand.other_learning_areas!,
          ),
        if (subStrand.learning_materials != null &&
            subStrand.learning_materials!.isNotEmpty)
          buildSection(
            theme: theme,
            label: "Learning Materials",
            mainIcon: Icons.library_books,
            subIcon: FontAwesomeIcons.book,
            items: subStrand.learning_materials!,
          ),
        if (subStrand.non_formal_activities != null &&
            subStrand.non_formal_activities!.isNotEmpty)
          buildSection(
            theme: theme,
            label: "Non Formal Activities",
            mainIcon: Icons.video_collection,
            subIcon: Icons.video_collection_outlined,
            items: subStrand.non_formal_activities!,
          ),
      ],
    );
  }

  buildSection({
    required ThemeData theme,
    required String label,
    required IconData mainIcon,
    required IconData subIcon,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        buildHeaderWidget(
          theme: theme,
          title: label,
          leadingWidget: Icon(mainIcon),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, idx) => ListTile(
            leading: Icon(subIcon),
            title: Text(
              items[idx],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
