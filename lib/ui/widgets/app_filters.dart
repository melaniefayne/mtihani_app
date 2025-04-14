import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/widgets/app_date_filter.dart';
import 'package:mtihani_app/ui/widgets/app_dropdown_search.dart';
import 'package:mtihani_app/ui/widgets/app_text_form_field.dart';

class AppPageFilters extends StatefulWidget {
  final List<AppFilterItem> filters;
  final double? ftWidth;

  const AppPageFilters({
    super.key,
    required this.filters,
    this.ftWidth,
  });

  @override
  State<AppPageFilters> createState() => _AppPageFiltersState();
}

class _AppPageFiltersState extends State<AppPageFilters> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageWidth = MediaQuery.sizeOf(context).width;
    final filtersLen = widget.filters.length;
    final filterWidth = (pageWidth * 0.82) / filtersLen;
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      direction: widget.ftWidth != null ? Axis.vertical : Axis.horizontal,
      children: widget.filters.map((filterItem) {
        double width = widget.ftWidth ?? filterWidth;

        return SizedBox(
          width: width,
          child: filterItem.isTxtField
              ? AppTextFormField(
                  label: filterItem.label,
                  inputType: filterItem.inputType,
                  onChanged: filterItem.onTxtChanged!,
                  validator: filterItem.txtValidator,
                )
              : filterItem.isDateField
                  ? AppDateFilter(
                      ftWidth: width,
                      label: filterItem.label,
                      priDateTxtCtrl: filterItem.priDateCtrl!,
                      secDateTxtCtrl: filterItem.secDateTxtCtrl,
                      onDateChanged: filterItem.onDateChanged!,
                      hideSuffix: filterItem.onClearSearch == null,
                      lastPickerDate: filterItem.lastPickerDate,
                      firstEndPickerDate: filterItem.firstEndPickerDate,
                    )
                  : filterItem.onSearchChange != null
                      ? AppDropDownSearchField(
                          label: filterItem.label,
                          selectedValue: filterItem.selectedValue,
                          items: filterItem.items!,
                          onChanged: filterItem.onChanged!,
                          onSearchChange: filterItem.onSearchChange!,
                          onClearSearch: filterItem.onClearSearch,
                          hint: filterItem.hint,
                        )
                      : buildDropDownFormField(
                          theme: theme,
                          label: filterItem.label,
                          selectedValue: filterItem.selectedValue,
                          items: filterItem.items!
                              as List<DropdownMenuItem<dynamic>>,
                          onChanged: filterItem.onChanged!,
                        ),
        );
      }).toList(),
    );
  }

  Widget buildDropDownFormField({
    required ThemeData theme,
    required String label,
    double? width,
    required dynamic selectedValue,
    required List<DropdownMenuItem<dynamic>> items,
    required Function(dynamic) onChanged,
    String? hint,
  }) {
    return SizedBox(
      width: width,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField<dynamic>(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              label: Text(
                label,
                style: theme.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            value: selectedValue,
            icon: const Icon(Icons.arrow_drop_down),
            onChanged: (dynamic value) {
              onChanged(value);
            },
            items: items,
            validator: (value) {
              return null;
            },
          ),
        ),
      ),
    );
  }
}

class AppFilterItem {
  final String label;
  final dynamic selectedValue;
  final List<dynamic>? items;
  final Function? onTxtChanged;
  final Function(dynamic)? onChanged;
  dynamic Function()? onClearSearch;
  final TextInputType? inputType;
  final bool isSearchable;
  final bool isTxtField;
  final String? hint;
  final Function? txtValidator;
  final Function(String?)? onSearchChange;
  final bool isDateField;
  final TextEditingController? priDateCtrl;
  final TextEditingController? secDateTxtCtrl;
  final Function(DateTime? pickedDate, bool? isStartDate)? onDateChanged;
  final DateTime? lastPickerDate;
  final DateTime? firstEndPickerDate;

  /// AppFilterItem
  /// isNotSearchable required: selectedValue, onChanged, items;
  /// isSearchable required: selectedValue, onChanged, onSearchChange, items;
  /// isTxtField required: isTxtField, onTxtChanged
  /// isDateField required: isDateField, priDateCtrl, onDateChanged
  AppFilterItem({
    required this.label,
    this.onSearchChange,
    this.onChanged,
    this.selectedValue,
    this.onTxtChanged,
    this.onClearSearch,
    this.items,
    this.hint,
    this.inputType,
    this.txtValidator,
    this.isSearchable = false,
    this.isTxtField = false,
    this.isDateField = false,
    this.priDateCtrl,
    this.secDateTxtCtrl,
    this.onDateChanged,
    this.lastPickerDate,
    this.firstEndPickerDate,
  });
}
