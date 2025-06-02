import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/ui/widgets/charts/chart_indicators.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// Constants
//
const double defChartWidth = 200.0;

// Models
//
class AppDtChartData {
  final String label;
  final double value;
  final double radius;
  final double percent;
  final Color sectionColor;
  final double startAngle;

  AppDtChartData({
    required this.label,
    required this.value,
    required this.radius,
    required this.percent,
    required this.sectionColor,
    required this.startAngle,
  });
}

// View
//
class AppStackedDonutChart extends StatelessWidget {
  final List<double> dataSeries;
  final List<String> chartLabels;
  final List<Color>? dtColors;
  // final Axis? chartDirection;
  final String? chartTitle;
  final double? chartWidth;
  final Widget? centerWidget;
  final bool? useIndIcons;
  final double? firstStartAngle;
  final String indicatorPrefix;
  final bool hideIndicators;
  final String? selectedIndicator;
  final Function(String val)? onIndicatorTap;

  ///[AppStackedDonutChart] renders custom Sisitech Stack of Donut Charts
  /// Required Fields:
  ///- List<double> dataSeries: single series of data points
  ///- List<String> chartLabels: list of labels for each data point
  const AppStackedDonutChart({
    super.key,
    required this.dataSeries,
    required this.chartLabels,
    this.dtColors,
    // this.chartDirection,
    this.chartTitle,
    this.chartWidth = defChartWidth,
    this.centerWidget,
    this.useIndIcons,
    this.firstStartAngle,
    this.indicatorPrefix = '',
    this.hideIndicators = false,
    this.onIndicatorTap,
    this.selectedIndicator,
  });

  /// [_createChartData]
  ///Returns [0]: chartData, [1] chartIndicators
  List<dynamic> _createChartData(ThemeData theme, Size pageSize) {
    List<Color> chartColors =
        dtColors ?? getChartColors(dataSeries.length, theme);
    double seriesTotal = getListOfDoublesSum(dataSeries);
    double startRadius = (chartWidth ?? defChartWidth) * 0.6;
    double radDcr = 10;
    double startAngle = 28;
    double angleIncr = 6;

    List<AppDtChartData> chartData = dataSeries.asMap().entries.map((entry) {
      int index = entry.key;
      var e = entry.value;
      var angle = startAngle + ((index + 1) * angleIncr);

      return AppDtChartData(
        label: chartLabels[index],
        value: e,
        percent: e / seriesTotal,
        radius: startRadius - ((index + 1) * radDcr),
        sectionColor: chartColors[index],
        startAngle: index == 0
            ? (firstStartAngle ?? 30)
            : angle + ((index - 1) * angleIncr),
      );
    }).toList();

    List<Widget> stackedChartIndicators = getChartIndicators(
        chartLabels, chartColors, chartData.map((e) => e.value).toList(),
        useIcons: useIndIcons,
        indicatorPrefix: indicatorPrefix,
        hidePerc: false,
        selectedIndicator: selectedIndicator,
        theme: theme,
        pageSize: pageSize,
        onIndicatorTap:
            // chartDirection != Axis.horizontal ?
            onIndicatorTap
        //: null,
        );

    return [chartData, stackedChartIndicators];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    // bool isHorizFormat = chartDirection == Axis.horizontal;

    var createChartRes = _createChartData(theme, pageSize);
    List<AppDtChartData> chartData = createChartRes[0];
    List<Widget> stackedChartIndicators = createChartRes[1];

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(height: 10),
          if (chartTitle != null)
            Text(
              chartTitle!,
              style: textTheme.titleLarge!.copyWith(
                  color: colorScheme.primary, fontWeight: FontWeight.bold),
            ),
          const SizedBox(height: 10),
          // isHorizFormat
          //     ? Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           _getChartSection(isHorizFormat, colorScheme),
          //           if (!hideIndicators)
          //             Padding(
          //               padding: const EdgeInsets.only(top: 10),
          //               child: _getIndicatorsSection(isHorizFormat),
          //             ),
          //         ],
          //       )
          // :
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getChartSection(
                isHorizFormat: false,
                colorScheme: colorScheme,
                context: context,
                chartData: chartData,
              ),
              if (!hideIndicators)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: _getIndicatorsSection(
                    isHorizFormat: false,
                    chartIndicators: stackedChartIndicators,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getChartSection({
    required bool isHorizFormat,
    required ColorScheme colorScheme,
    required BuildContext context,
    required List<AppDtChartData> chartData,
  }) {
    return SizedBox(
      width: isHorizFormat
          ? MediaQuery.of(context).size.width * 0.5
          : MediaQuery.of(context).size.width,
      // height: widget.chartWidth ?? defChartWidth,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ...chartData.map(
            (e) => GestureDetector(
              onTap: onIndicatorTap == null
                  ? null
                  : () => onIndicatorTap!(e.label),
              child: CircularPercentIndicator(
                radius: e.radius,
                lineWidth: selectedIndicator == e.label ? 7 : 5.0,
                startAngle: e.startAngle,
                animation: true,
                animationDuration: 1000,
                percent: e.percent,
                backgroundColor: colorScheme.surface,
                progressColor: e.sectionColor,
              ),
            ),
          ),
          centerWidget ?? const SizedBox()
        ],
      ),
    );
  }

  Widget _getIndicatorsSection({
    required bool isHorizFormat,
    required List<Widget> chartIndicators,
  }) {
    return
        // Container(
        //   margin: isHorizFormat
        //       ? null
        //       : EdgeInsets.only(left: MediaQuery.of(context).size.width / 12),
        //   width: isHorizFormat
        //       ? MediaQuery.of(context).size.width * 0.25
        //       : MediaQuery.of(context).size.width,
        //   child:
        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: chartIndicators.map((indicator) => indicator).toList(),
      // ),
    );
  }
}
