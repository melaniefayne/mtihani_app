import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/widgets/app_text_form_field.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';

class AppSearchList extends StatefulWidget {
  final String itemsText;
  final bool? isSearchActive;
  final Function? onSearchCanceled;
  final Function(String? val)? onSearchTermChanged;
  final TextEditingController? searchTxtCtrl;
  final String? hintText;
  final bool hideSearch;
  final bool hideNoItemsWidget;
  final bool hasPaginate;
  final bool hasCount;
  final List<Widget> children;
  final double? childAspectRatio;

  /// AppSearchList:
  /// If hasSearch:
  /// Pass isSearchActive, onSearchCanceled, searchTxtCtrl, onSearchTermChanged
  const AppSearchList({
    super.key,
    this.isSearchActive,
    this.onSearchCanceled,
    this.onSearchTermChanged,
    this.hintText,
    this.searchTxtCtrl,
    this.hideSearch = false,
    this.hideNoItemsWidget = false,
    this.hasPaginate = true,
    this.hasCount = true,
    required this.itemsText,
    required this.children,
    this.childAspectRatio,
  });

  @override
  State<AppSearchList> createState() => _AppSearchListState();
}

class _AppSearchListState extends State<AppSearchList> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        if (!widget.hideSearch)
          Column(
            children: [
              AppTextFormField(
                prefixIcon: formPrefixIcon(),
                suffixIcon:
                    widget.isSearchActive != null && widget.isSearchActive!
                        ? formClearIcon(
                            theme: theme,
                            onClearSearch: () {
                              if (widget.onSearchCanceled != null) {
                                widget.onSearchCanceled!();
                              }
                            },
                          )
                        : null,
                hintText: widget.hintText ?? "Search ${widget.itemsText} items",
                onChanged: (String val) {
                  if (widget.onSearchTermChanged != null) {
                    widget.onSearchTermChanged!(val);
                  }
                },
                controller: widget.searchTxtCtrl,
              ),
              const SizedBox(height: 10),
            ],
          ),
        if (widget.hasCount)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "${widget.children.length} Items",
              ),
            ],
          ),
        if (widget.children.isNotEmpty)
          widget.childAspectRatio != null
              ? GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: widget.childAspectRatio!,
                  ),
                  itemBuilder: (context, idx) => widget.children[idx],
                  itemCount: widget.children.length,
                )
              : Wrap(
                  children: widget.children,
                ),
        if (widget.children.isEmpty && !widget.hideNoItemsWidget)
          buildNoItemsWidget("No ${widget.itemsText} available"),
      ],
    );
  }
}
