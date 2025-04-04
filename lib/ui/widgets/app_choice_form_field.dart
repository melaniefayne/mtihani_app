import 'package:flutter/material.dart';

class AppChoicesFormField<T> extends StatefulWidget {
  final String label;
  final List<T> selectedValues;
  final List<T> items;
  final ValueChanged<T> onSelected;
  final ValueChanged<T> onRemoved;
  final bool isDateTimeField;

  const AppChoicesFormField({
    super.key,
    required this.label,
    required this.items,
    required this.selectedValues,
    required this.onSelected,
    required this.onRemoved,
    this.isDateTimeField = false,
  });

  @override
  State<AppChoicesFormField<T>> createState() => _AppChoicesFormFieldState<T>();
}

class _AppChoicesFormFieldState<T> extends State<AppChoicesFormField<T>> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.of(context).size;

    return Column(
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
                child: Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: widget.selectedValues.map((e) {
                    return InputChip(
                      label: Text(e.toString()),
                      selected: true,
                      onSelected: (_) => widget.onRemoved(e),
                      deleteIcon: const Icon(Icons.close),
                      onDeleted: () => widget.onRemoved(e),
                    );
                  }).toList(),
                ),
              ),
              body: SizedBox(
                height: pageSize.height * 0.2,
                child: ListView.builder(
                  itemCount: widget.items.length,
                  itemBuilder: (_, index) {
                    final item = widget.items[index];
                    final selected = widget.selectedValues.contains(item);
                    return CheckboxListTile(
                      value: selected,
                      onChanged: (checked) {
                        setState(() {
                          if (checked == true) {
                            widget.onSelected(item);
                          } else {
                            widget.onRemoved(item);
                          }
                        });
                      },
                      title: Text(item.toString(),
                          style: theme.textTheme.bodyMedium),
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
