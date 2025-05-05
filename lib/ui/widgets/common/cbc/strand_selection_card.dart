import 'package:flutter/material.dart';
import 'package:mtihani_app/models/cbc.dart';
import 'package:mtihani_app/models/exam.dart';

class StrandSelectionCard extends StatelessWidget {
  final GradeModel gradeCbc;
  final List<ScoreModel> gradeStrandScores;
  final List<int> selectedStrands;
  final Function(int val) onStrandSelected;
  final double? cardWidth;
  const StrandSelectionCard({
    super.key,
    required this.gradeCbc,
    required this.gradeStrandScores,
    required this.selectedStrands,
    required this.onStrandSelected,
    this.cardWidth,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.primary),
      ),
      width: cardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'Grade ${gradeCbc.grade ?? '--'}',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: theme.colorScheme.primary,
                thickness: 2,
              ),
            ],
          ),
          Divider(
            thickness: 2.0,
            color: theme.primaryColor,
          ),
          if (gradeCbc.strands != null)
            Padding(
              padding: EdgeInsets.symmetric(vertical: pageSize.height * 0.01),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  StrandModel strand = gradeCbc.strands![index];
                  ScoreModel? strandScore = gradeStrandScores
                      .where((e) => e.name == strand.name)
                      .firstOrNull;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: strand.id != null &&
                                  selectedStrands.contains(strand.id!),
                              onChanged: (val) {
                                if (strand.id != null) {
                                  onStrandSelected(strand.id!);
                                }
                              },
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${strand.number}. ${strand.name}",
                                    style:
                                        theme.textTheme.titleMedium!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.clip,
                                  ),
                                  ...strand.sub_strands!.map(
                                    (subStrand) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Text(
                                        "${subStrand.number}. ${subStrand.name}",
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (strandScore != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: buildScoreCard(
                            theme: theme,
                            score: strandScore.score ?? 0.0,
                          ),
                        ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: gradeCbc.strands?.length ?? 0,
              ),
            ),
        ],
      ),
    );
  }

  buildScoreCard({
    required ThemeData theme,
    required double score,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Mtihani Score",
          style:
              theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
          overflow: TextOverflow.clip,
        ),
        Text(
          "$score%",
          style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}
