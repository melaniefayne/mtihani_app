import 'package:flutter/material.dart';
import 'package:mtihani_app/models/cbc.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/widgets/app_filters.dart';
import 'package:mtihani_app/ui/widgets/app_search_list.dart';
import 'package:mtihani_app/ui/widgets/common/exam_widgets.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';

import 'st_exam_answers_list_model.dart';

class StExamAnswersList extends StackedView<StExamAnswersListModel> {
  final List<StudentAnswerModel> answers;
  final Function(StudentAnswerModel answer)? onEditAnswerScore;
  const StExamAnswersList({
    super.key,
    required this.answers,
    this.onEditAnswerScore,
  });

  @override
  Widget builder(
    BuildContext context,
    StExamAnswersListModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppPageFilters(
            fullWidth: pageSize.width * 0.75,
            filters: [
              AppFilterItem(
                label: "Bloom Skill",
                selectedValue: viewModel.selectedBloomSkill,
                onChanged: (val) {
                  viewModel.onChangeSelectedBloomSkill(val);
                },
                items: ['All', ...allBloomSkills]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              AppFilterItem(
                label: "Grade",
                selectedValue: viewModel.selectedGrade?.toString(),
                onChanged: (val) {
                  viewModel.onChangeSelectedGrade(val);
                },
                items: ['All', "7", "8", "9"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value == "All" ? "All" : "Grade $value"),
                  );
                }).toList(),
              ),
              AppFilterItem(
                label: "Strand",
                selectedValue: viewModel.selectedStrand,
                onChanged: (val) {
                  viewModel.onChangeSelectedStrand(val);
                },
                items: [StrandModel(name: "All"), ...viewModel.allStrands]
                    .map<DropdownMenuItem<StrandModel>>((StrandModel value) {
                  return DropdownMenuItem<StrandModel>(
                    value: value,
                    child: Text(value.name ?? "--"),
                  );
                }).toList(),
              ),
              AppFilterItem(
                label: "Sub-Strand",
                selectedValue: viewModel.selectedSubStrand,
                onChanged: (val) {
                  viewModel.onChangeSelectedSubStrand(val);
                },
                items: [
                  SubStrandModel(name: "All"),
                  ...viewModel.allSubStrands
                ].map<DropdownMenuItem<SubStrandModel>>((SubStrandModel value) {
                  return DropdownMenuItem<SubStrandModel>(
                    value: value,
                    child: Text(value.name ?? "--"),
                  );
                }).toList(),
              ),
            ],
          ),
          SizedBox(height: pageSize.height * 0.01),
          if (viewModel.isBusy)
            buildLoadingWidget(theme, "Fetching exam answers", isLinear: true),
          AppSearchList(
            isSearchActive: viewModel.isSearchActive,
            searchTxtCtrl: viewModel.searchTxtCtrl,
            onSearchTermChanged: viewModel.onSearchTermChanged,
            onSearchCanceled: viewModel.onSearchCanceled,
            hintText: "Search by question description",
            itemsText: "answers",
            children: viewModel.answersList
                .map((e) => ExamQuestionCard(
                      question: e.question!,
                      answer: e,
                      onEditAnswerScore: onEditAnswerScore,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  @override
  StExamAnswersListModel viewModelBuilder(
    BuildContext context,
  ) =>
      StExamAnswersListModel(answers);
}
