import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/widgets/app_filters.dart';
import 'package:mtihani_app/ui/widgets/common/cbc/strand_card.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';

import 'cbc_viewmodel.dart';

class CbcView extends StackedView<CbcViewModel> {
  const CbcView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CbcViewModel viewModel,
    Widget? child,
  ) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPageFilters(
              filters: [
                AppFilterItem(
                  label: "Grade",
                  selectedValue: viewModel.selectedGrade,
                  onChanged: (val) {
                    viewModel.onChangeGrade(val);
                  },
                  items: allGradesList.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text("Grade ${value.toString()}"),
                    );
                  }).toList(),
                ),
              ],
            ),
            const Divider(),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, idx) => StrandCard(
                strand: viewModel.gradeStrandsList[idx],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CbcViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CbcViewModel();

  @override
  void onViewModelReady(CbcViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.filterCurriculum();
  }
}
