import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/views/teacher_onboarding/utils.dart';

class AppDatesFormField<T> extends StatefulWidget {
  final String label;
  final List<DateTime> selectedValues;
  final ValueChanged<DateTime> onSelected;
  final ValueChanged<DateTime> onRemoved;
  final bool isDateTimeField;
  final String? errorText;

  const AppDatesFormField({
    super.key,
    required this.label,
    required this.selectedValues,
    required this.onSelected,
    required this.onRemoved,
    this.isDateTimeField = false,
    this.errorText,
  });

  @override
  State<AppDatesFormField<T>> createState() => _AppDatesFormFieldState<T>();
}

class _AppDatesFormFieldState<T> extends State<AppDatesFormField<T>> {
  bool _isExpanded = false;
  String? selectedDay;
  TimeOfDay? selectedTime;

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => selectedTime = picked);
    }
  }

  void _addDateTime() {
    if (selectedDay != null && selectedTime != null) {
      final now = DateTime.now();
      final weekdayIndex = appClassDays.indexOf(selectedDay!) + 1;

      // find the nearest next matching weekday
      DateTime selectedDate = now;
      while (selectedDate.weekday != weekdayIndex) {
        selectedDate = selectedDate.add(const Duration(days: 1));
      }

      final dateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );

      if (!widget.selectedValues.contains(dateTime)) {
        widget.onSelected(dateTime);
        setState(() {
          selectedDay = null;
          selectedTime = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label, style: theme.textTheme.bodyMedium),
          ExpansionPanelList(
            expandedHeaderPadding: EdgeInsets.zero,
            elevation: 0,
            expansionCallback: (_, __) =>
                setState(() => _isExpanded = !_isExpanded),
            children: [
              ExpansionPanel(
                canTapOnHeader: true,
                isExpanded: _isExpanded,
                headerBuilder: (context, _) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.selectedValues.isEmpty
                      ? const Text("Tap to select a class time")
                      : Wrap(
                          spacing: 6,
                          runSpacing: 4,
                          children: widget.selectedValues.map((e) {
                            return InputChip(
                              label: Text(appClassDateFormat.format(e)),
                              selected: true,
                              onSelected: (_) => widget.onRemoved(e),
                              deleteIcon: const Icon(Icons.close),
                              onDeleted: () => widget.onRemoved(e),
                            );
                          }).toList(),
                        ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Select a day",
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            const Divider(),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: appClassDays.length,
                              itemBuilder: (context, index) {
                                return CheckboxListTile(
                                  value: selectedDay == appClassDays[index],
                                  onChanged: (checked) {
                                    setState(() {
                                      selectedDay = checked == true
                                          ? appClassDays[index]
                                          : null;
                                    });
                                  },
                                  title: Text(appClassDays[index],
                                      style: theme.textTheme.bodyMedium),
                                  dense: true,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Select a time",
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            const Divider(),
                            TextButton.icon(
                              onPressed: _pickTime,
                              icon: const Icon(Icons.access_time),
                              label: Text(
                                selectedTime != null
                                    ? selectedTime!.format(context)
                                    : 'Choose Time',
                              ),
                            ),
                            if (selectedTime != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: ElevatedButton(
                                  onPressed: _addDateTime,
                                  child: const Text("Add"),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (widget.errorText != null)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                widget.errorText!,
                style: theme.textTheme.bodySmall!
                    .copyWith(color: theme.colorScheme.error),
              ),
            ),
        ],
      ),
    );
  }
}
