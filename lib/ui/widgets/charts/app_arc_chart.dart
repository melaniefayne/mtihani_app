import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AppHalfArcChart extends StatelessWidget {
  final double percent;
  final double chartRadius;
  final Widget? center;
  final Color? progressColor;

  const AppHalfArcChart({
    super.key,
    required this.percent,
    required this.chartRadius,
    this.center,
    this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
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
              progressColor: progressColor,
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
