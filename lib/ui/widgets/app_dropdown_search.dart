import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/widgets/app_text_form_field.dart';

class AppDropDownSearchField extends StatefulWidget {
  final String? label;
  final String? hint;
  final dynamic selectedValue;
  final dynamic Function()? onClearSearch;
  final List<dynamic> items;
  final Function(dynamic) onChanged;
  final Function(String?) onSearchChange;

  const AppDropDownSearchField({
    super.key,
    this.label,
    this.hint,
    this.selectedValue,
    this.onClearSearch,
    required this.items,
    required this.onChanged,
    required this.onSearchChange,
  });

  @override
  State<AppDropDownSearchField> createState() => _AppDropDownSearchFieldState();
}

class _AppDropDownSearchFieldState extends State<AppDropDownSearchField> {
  bool _isExpanded = false;
  TextEditingController searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ExpansionPanelList(
      expandedHeaderPadding: const EdgeInsets.symmetric(vertical: 0),
      elevation: 0,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          isExpanded: _isExpanded,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return _headerSection(theme);
          },
          body: _dropDownWidget(theme),
        ),
      ],
    );
  }

  Widget _headerSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text(widget.label!),
          ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[100]!),
            borderRadius: BorderRadius.circular(7),
          ),
          padding: const EdgeInsets.only(left: 10),
          height: 40,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.selectedValue != null
                      ? widget.selectedValue.toString()
                      : "",
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              if (widget.selectedValue != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(
                    onPressed: widget.onClearSearch,
                    icon: Icon(Icons.close, color: theme.primaryColor),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _dropDownWidget(ThemeData theme) {
    return Column(
      children: [
        AppTextFormField(
          hintText: widget.hint,
          controller: searchCtrl,
          onChanged: (String? val) {
            widget.onSearchChange(val);
          },
        ),
        const SizedBox(height: 10),
        widget.items.isEmpty
            ? const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Center(
                  child: Text("No data found"),
                ),
              )
            : Container(
                height: MediaQuery.sizeOf(context).height * 0.2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[100]!),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return RadioListTile<dynamic>(
                      contentPadding: EdgeInsets.zero,
                      value: widget.items[index],
                      groupValue: widget.selectedValue,
                      onChanged: (dynamic value) {
                        widget.onChanged(value);
                        setState(() {
                          _isExpanded = false;
                        });
                        searchCtrl.clear();
                      },
                      title: Text(
                        widget.items[index].toString(),
                        style: theme.textTheme.bodySmall,
                      ),
                      selected: widget.items[index] == widget.selectedValue,
                      dense: true,
                    );
                  },
                  itemCount: widget.items.length,
                ),
              )
      ],
    );
  }
}
