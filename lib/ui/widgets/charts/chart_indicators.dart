import 'package:flutter/material.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';

Widget chartIndicator({
  Color? color,
  function,
  String? extension,
  String? percentage,
  required String label,
  required Size pageSize,
}) {
  return ConstrainedBox(
    constraints: BoxConstraints(
      maxWidth: pageSize.width * 0.6,
    ),
    child: Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text.rich(
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              TextSpan(
                children: [
                  TextSpan(
                    text: label,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: percentage == null ? '' : ' ($percentage)',
                  ),
                  TextSpan(
                    text: extension != null ? ' • $extension' : '',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget actionChartIndicator({
  Color? color,
  function,
  String? extension,
  String? percentage,
  double? value,
  required String label,
  required Function(String val) onIndicatorTap,
  required bool isSelected,
  required ThemeData theme,
  required Size pageSize,
}) {
  return Container(
    padding: EdgeInsets.all(isSelected ? 8 : 5),
    decoration: BoxDecoration(
      color: isSelected
          ? theme.colorScheme.surfaceContainerHighest
          : Colors.transparent,
      borderRadius: BorderRadius.circular(2),
    ),
    width: pageSize.width * 0.6,
    child: GestureDetector(
      onTap: () => onIndicatorTap(label),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 5),
              SizedBox(
                width: pageSize.width * 0.45,
                child: Text.rich(
                  maxLines: 4,
                  overflow: TextOverflow.clip,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: label,
                      ),
                      TextSpan(
                        text: percentage == null ? '' : ' ($percentage)',
                      ),
                      TextSpan(
                        text: extension != null ? ' • $extension' : '',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Icon(
            Icons.read_more_rounded,
            color: theme.colorScheme.primary,
            size: 22,
          ),
        ],
      ),
    ),
  );
}

List<Widget> getChartIndicators(
  List<String> labels,
  List<Color> colors,
  List<double> values, {
  bool hidePerc = true,
  bool? useIcons,
  String? indicatorPrefix,
  String? selectedIndicator,
  Function(String val)? onIndicatorTap,
  required ThemeData theme,
  required Size pageSize,
}) {
  double total = getListOfDoublesSum(values);
  return List.generate(labels.length, (i) {
    double? percentage =
        (total != 0 && values.isNotEmpty) ? (values[i] / total) * 100 : null;
    return onIndicatorTap != null
        ? actionChartIndicator(
            theme: theme,
            pageSize: pageSize,
            percentage: hidePerc || percentage == null
                ? null
                : "${percentage.toStringAsFixed(1)}%",
            label: labels[i],
            extension: values.isNotEmpty
                ? "${indicatorPrefix ?? ''}${addThousandSeparators(values[i])}"
                : null,
            color: colors[i],
            onIndicatorTap: onIndicatorTap,
            isSelected: selectedIndicator == labels[i],
          )
        : chartIndicator(
            pageSize: pageSize,
            percentage: hidePerc || percentage == null
                ? null
                : "${percentage.toStringAsFixed(1)}%",
            label: labels[i],
            extension: values.isNotEmpty
                ? "${indicatorPrefix ?? ''}${addThousandSeparators(values[i])}"
                : null,
            color: colors[i],
          );
  });
}
