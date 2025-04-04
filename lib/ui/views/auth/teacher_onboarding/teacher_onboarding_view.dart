import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/class_form/class_form_view.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/exam_setup/exam_setup_view.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/teacher_signup/teacher_signup_view.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';

import 'teacher_onboarding_viewmodel.dart';

class TeacherOnboardingView extends StackedView<TeacherOnboardingViewModel> {
  const TeacherOnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TeacherOnboardingViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    final bgColor = theme.colorScheme.primary;
    final fgColor = theme.colorScheme.onPrimary;
    const double progressSize = 0.25;
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: pageSize.width * progressSize,
            decoration: BoxDecoration(color: bgColor),
            padding: EdgeInsets.symmetric(
              vertical: pageSize.height * 0.04,
              horizontal: pageSize.width * 0.02,
            ),
            child: Column(
              children: [
                Image.asset(
                  astImagesLightLogo,
                  height: 70,
                ),
                Divider(color: fgColor, thickness: 2.0),
                SizedBox(height: pageSize.height * 0.02),
                ...onboardingWidgets.asMap().entries.map(
                  (e) {
                    int idx = e.key;
                    TeacherOnboardingModel item = e.value;
                    return buildProgressItem(
                      theme: theme,
                      bgColor: bgColor,
                      fgColor: fgColor,
                      item: item,
                      isComplete: idx < viewModel.currentStep,
                      isCurrent: idx == viewModel.currentStep,
                      isLastStep: idx == onboardingWidgets.length - 1,
                    );
                  },
                ).toList(),
                const Spacer(),
                Text(
                  "Copyright © ${today.year}",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: fgColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: pageSize.width * (1 - progressSize),
            child: PageView(
              controller: viewModel.pageCtrl,
              physics: const NeverScrollableScrollPhysics(),
              children: onboardingWidgets.map((e) => e.mainWidget).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProgressItem({
    required ThemeData theme,
    required Color bgColor,
    required Color fgColor,
    required TeacherOnboardingModel item,
    required bool isComplete,
    required bool isCurrent,
    required bool isLastStep,
  }) {
    double radius = 35.0;
    Color txtColor =
        (isComplete || isCurrent) ? fgColor : theme.colorScheme.outlineVariant;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                border: Border.all(color: txtColor, width: 1.0),
                shape: BoxShape.circle,
                color: isComplete ? fgColor : Colors.transparent,
              ),
              child: Icon(
                isComplete ? Icons.check : Icons.circle,
                color: isComplete ? bgColor : fgColor,
              ),
            ),
            if (!isLastStep)
              Container(
                width: 2.0,
                height: radius,
                decoration: BoxDecoration(color: txtColor),
              ),
          ],
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: theme.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold, color: txtColor),
                overflow: TextOverflow.clip,
              ),
              Text(
                item.subtitle,
                style: theme.textTheme.bodySmall!.copyWith(color: txtColor),
                overflow: TextOverflow.clip,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  TeacherOnboardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TeacherOnboardingViewModel();
}

class TeacherOnboardingModel {
  final String title;
  final String subtitle;
  final Widget mainWidget;

  TeacherOnboardingModel({
    required this.title,
    required this.subtitle,
    required this.mainWidget,
  });
}

List<TeacherOnboardingModel> onboardingWidgets = [
  TeacherOnboardingModel(
    title: 'Create An Account',
    subtitle: "Tell us a little about yourself",
    mainWidget: const TeacherSignupView(),
  ),
  TeacherOnboardingModel(
    title: 'Add a class',
    subtitle: "Bring your students onboard",
    mainWidget: const ClassFormView(),
  ),
  TeacherOnboardingModel(
    title: 'Set your first exam',
    subtitle: "A step closer to better insights",
    mainWidget: const ExamSetupView(),
  ),
];
