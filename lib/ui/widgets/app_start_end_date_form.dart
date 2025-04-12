import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';

class AppStartEndDateForm extends StatefulWidget {
  final int? minDurationInMin;
  final void Function(DateTime start, DateTime end) onDateTimesSelected;

  const AppStartEndDateForm({
    super.key,
    this.minDurationInMin,
    required this.onDateTimesSelected,
  });

  @override
  State<AppStartEndDateForm> createState() => _AppStartEndDateFormState();
}

class _AppStartEndDateFormState extends State<AppStartEndDateForm> {
  TimeOfDay defaultTime = const TimeOfDay(hour: 9, minute: 0);
  DateTime? _selectedDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  String? _error;

  Duration get _calculatedDuration {
    if (_startTime == null || _endTime == null) return Duration.zero;
    final start = DateTime(0, 1, 1, _startTime!.hour, _startTime!.minute);
    final end = DateTime(0, 1, 1, _endTime!.hour, _endTime!.minute);
    return end.difference(start);
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? tomorrow,
      firstDate: tomorrow,
      lastDate: DateTime(today.year, today.month + 2, today.day),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  Future<void> _pickTime({required bool isStart}) async {
    final picked = await showTimePicker(
      context: context,
      initialTime:
          isStart ? _startTime ?? defaultTime : _endTime ?? defaultTime,
    );
    if (picked != null) {
      if (!isStart && _startTime != null) {
        final now = DateTime.now();
        final start = DateTime(
            now.year, now.month, now.day, _startTime!.hour, _startTime!.minute);
        final pickedEnd =
            DateTime(now.year, now.month, now.day, picked.hour, picked.minute);

        if (pickedEnd.isBefore(start) || pickedEnd == start) {
          setState(() {
            _error = "End time must be after start time";
          });
          return;
        }

        final diffMinutes = pickedEnd.difference(start).inMinutes;
        if (widget.minDurationInMin != null &&
            diffMinutes < widget.minDurationInMin!) {
          setState(() {
            _error =
                "Duration must be at least ${widget.minDurationInMin} minutes";
          });
          return;
        }
      }
      setState(() {
        if (isStart) {
          _endTime = null;
          _startTime = picked;
        } else {
          _endTime = picked;
        }
        _error = null;
      });
    }
  }

  void _handleConfirm() {
    setState(() => _error = null);

    if (_selectedDate == null || _startTime == null || _endTime == null) {
      setState(() => _error = "Please select all fields");
      return;
    }

    final start = DateTime(_selectedDate!.year, _selectedDate!.month,
        _selectedDate!.day, _startTime!.hour, _startTime!.minute);
    final end = DateTime(_selectedDate!.year, _selectedDate!.month,
        _selectedDate!.day, _endTime!.hour, _endTime!.minute);

    widget.onDateTimesSelected(start, end);
  }

  @override
  Widget build(BuildContext context) {
    final dateStr = _selectedDate != null
        ? DateFormat("EEEE, dd/MMM/yyyy").format(_selectedDate!)
        : 'Pick a date';
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_month_outlined,
              size: theme.textTheme.displaySmall!.fontSize,
            ),
            const SizedBox(width: 10),
            buildItemBox(
              theme: theme,
              txt: dateStr,
              action: _pickDate,
              width: pageSize.width * 0.4,
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "S",
              style: TextStyle(
                fontSize: pageSize.height * 0.25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTimeBox(
                  theme: theme,
                  pageSize: pageSize,
                  dateTime: _startTime,
                  isStartTime: true,
                  suffix: "tart",
                ),
                SizedBox(height: pageSize.height * 0.1),
                buildTimeBox(
                  theme: theme,
                  pageSize: pageSize,
                  dateTime: _endTime,
                  isStartTime: false,
                  suffix: "top",
                ),
              ],
            ),
          ],
        ),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: "Duration: "),
              const TextSpan(text: "HRs: "),
              TextSpan(
                text: _calculatedDuration.inHours.toString(),
                style: theme.textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: " MINs: "),
              TextSpan(
                text: _calculatedDuration.inMinutes.remainder(60).toString(),
                style: theme.textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        if (_error != null)
          Text(
            _error!,
            style: theme.textTheme.bodyMedium!
                .copyWith(color: theme.colorScheme.error),
          ),
        ElevatedButton.icon(
          icon: const Icon(Icons.av_timer),
          label: const Text("Confirm Schedule"),
          onPressed: _handleConfirm,
        ),
      ],
    );
  }

  Widget buildItemBox({
    required ThemeData theme,
    required double width,
    required String txt,
    required Function action,
  }) {
    return GestureDetector(
      onTap: () => action(),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        width: width,
        child: Text(txt),
      ),
    );
  }

  Widget buildTimeBox({
    required ThemeData theme,
    required Size pageSize,
    required TimeOfDay? dateTime,
    required bool isStartTime,
    required String suffix,
  }) {
    return GestureDetector(
      onTap: () => _pickTime(isStart: isStartTime),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$suffix: ".toUpperCase(),
            style: theme.textTheme.headlineLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          dateTime == null
              ? buildItemBox(
                  theme: theme,
                  width: pageSize.width * 0.25,
                  txt: "Pick a end time",
                  action: () => _pickTime(isStart: isStartTime),
                )
              : Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: theme.primaryColor),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Text(
                    dateTime.format(context),
                    style: theme.textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
