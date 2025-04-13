import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/widgets/app_text_form_field.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';

class AppDateFilter extends StatelessWidget {
  final TextEditingController priDateTxtCtrl;
  final TextEditingController? secDateTxtCtrl;
  final DateTime? firstEndPickerDate;
  final DateTime? lastPickerDate;
  final Function(DateTime? pickedDate, bool isStartDate) onDateChanged;
  final bool hideSuffix;
  final double? ftWidth;
  final bool useInColumn;
  final String? label;

  const AppDateFilter({
    super.key,
    required this.priDateTxtCtrl,
    required this.onDateChanged,
    this.secDateTxtCtrl,
    this.firstEndPickerDate,
    this.lastPickerDate,
    this.hideSuffix = false,
    this.ftWidth,
    this.useInColumn = false,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = ftWidth ?? MediaQuery.sizeOf(context).width * 0.45;
    final today = DateTime.now();
    final DateTime lastDefaultDate =
        DateTime(today.year - 10, today.month, today.day);

    onDateTapAction(bool isStartDate) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: firstEndPickerDate ?? lastPickerDate,
        firstDate: (secDateTxtCtrl != null && !isStartDate)
            ? firstEndPickerDate ?? lastDefaultDate
            : lastDefaultDate,
        lastDate: lastPickerDate ?? today,
      );
      if (pickedDate != null) {
        await onDateChanged(
            pickedDate, secDateTxtCtrl != null ? isStartDate : true);
      }
    }

    List<Widget> rangeWidgets = secDateTxtCtrl != null
        ? [
            getRangeDateFilterField(
              width: width,
              dateTxtCtrl: priDateTxtCtrl,
              lastDate: firstEndPickerDate,
              isStartDate: true,
              isRangeFilter: true,
              theme: theme,
              label: label,
              onDateTap: onDateTapAction,
            ),
            getRangeDateFilterField(
              width: width,
              dateTxtCtrl: secDateTxtCtrl!,
              isStartDate: false,
              isRangeFilter: true,
              theme: theme,
              label: label,
              onDateTap: onDateTapAction,
            ),
          ]
        : [];

    return secDateTxtCtrl != null
        ? useInColumn
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: rangeWidgets)
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: rangeWidgets)
        : getRangeDateFilterField(
            width: width,
            dateTxtCtrl: priDateTxtCtrl,
            theme: theme,
            label: label,
            onDateTap: onDateTapAction,
            lastDate: firstEndPickerDate,
          );
  }

  Widget getRangeDateFilterField({
    required ThemeData theme,
    required Function(bool isStartDate) onDateTap,
    required TextEditingController dateTxtCtrl,
    String? label,
    double? width,
    DateTime? lastDate,
    bool isStartDate = true,
    bool isRangeFilter = false,
  }) {
    return SizedBox(
      width: width,
      child: AppTextFormField(
        label: !isRangeFilter
            ? label ?? "Date"
            : isStartDate
                ? "Start Date"
                : "End Date",
        prefixIcon: formPrefixIcon(iconPath: Icons.calendar_month),
        suffixIcon: (!hideSuffix && !isStringEmptyOrNull(dateTxtCtrl.text))
            ? formClearIcon(
                theme: theme,
                onClearSearch: () async {
                  await onDateChanged(null, isStartDate);
                },
              )
            : null,
        onTap: () async {
          await onDateTap(isStartDate);
        },
        onChanged: (String val) {},
        controller: dateTxtCtrl,
        readOnly: true,
      ),
    );
  }
}
