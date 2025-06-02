import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AppHalfArcPercentChart extends StatelessWidget {
  final double percent;
  final Color? progressColor;
  final Widget? center;
  final double? centerRadius;
  const AppHalfArcPercentChart({
    super.key,
    required this.percent,
    this.progressColor,
    this.center,
    this.centerRadius,
  });

  @override
  Widget build(BuildContext context) {
    final pageSize = MediaQuery.sizeOf(context);
    double chartRadius = centerRadius ?? pageSize.height * 0.2;

    return Stack(
      children: [
        ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: 0.5,
            child: CircularPercentIndicator(
              radius: chartRadius,
              lineWidth: 40,
              percent: (percent / 2) * 0.01,
              animation: true,
              progressColor: progressColor ?? kcDarkGreyColor,
              animationDuration: 800,
              startAngle: 270,
            ),
          ),
        ),
        if (center != null)
          Positioned(
            bottom: chartRadius * 0.1,
            left: 0,
            right: 0,
            child: center!,
          ),
      ],
    );
  }
}

class AppCircularPercentChart extends StatelessWidget {
  final double percent;
  final Color? progressColor;
  final String? title;
  final double? centerRadius;
  const AppCircularPercentChart({
    super.key,
    required this.percent,
    this.title,
    this.progressColor,
    this.centerRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    double chartRadius = centerRadius ?? pageSize.height * 0.045;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularPercentIndicator(
          radius: chartRadius,
          percent: percent > 100 ? 1.0 : percent * 0.01,
          progressColor: progressColor ?? kcMediumGrey,
          backgroundColor:
              theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.2),
          animation: true,
          animationDuration: 800,
          center: Center(
            child: Text("$percent%",
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(title!, style: theme.textTheme.titleMedium),
          ),
      ],
    );
  }
}
