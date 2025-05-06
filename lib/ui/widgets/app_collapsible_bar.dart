import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/widgets/app_tab_bar.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';

/// ==================================================== View
///
class AppCollapsibleScaffold extends StatefulWidget {
  final List<TabViewItem> tabs;
  final Function(int? val)? onIndexChange;
  final bool showUnViewedIndicator;
  final bool isScrollable;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final double indicatorWeight;
  final Color? dividerColor;
  final double sectionsGapSize;

  const AppCollapsibleScaffold({
    super.key,
    required this.tabs,
    this.onIndexChange,
    this.showUnViewedIndicator = true,
    this.isScrollable = false,
    this.dividerColor,
    this.indicatorWeight = 3,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.sectionsGapSize = 16.0,
  });

  @override
  State<AppCollapsibleScaffold> createState() => _AppCollapsibleScaffoldState();
}

class _AppCollapsibleScaffoldState extends State<AppCollapsibleScaffold> {
  List<bool> viewedTabs = [];
  int currentTabIdx = 0;
  bool isCurrentExpanded = false;

  @override
  void initState() {
    super.initState();
    viewedTabs = List.generate(widget.tabs.length, (i) {
      return widget.showUnViewedIndicator
          ? i == 0
              ? true
              : false
          : true;
    });
  }

  onTabIndexChange(int? val) {
    if (val != null) {
      setState(() {
        if (currentTabIdx == val) {
          isCurrentExpanded = !isCurrentExpanded;
        } else {
          currentTabIdx = val;
          isCurrentExpanded = true;
        }

        //
        if (widget.showUnViewedIndicator) updateViewedTabs(val);

        //
        if (widget.onIndexChange != null) widget.onIndexChange!(val);
      });
    }
  }

  updateViewedTabs(int idx) {
    if (idx >= 0 && idx < viewedTabs.length) viewedTabs[idx] = true;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ExpansionPanelList(
        expandedHeaderPadding: EdgeInsets.zero,
        materialGapSize: widget.sectionsGapSize,
        expansionCallback: (int idx, bool isExpanded) {
          onTabIndexChange(idx);
        },
        children: widget.tabs.asMap().entries.map(
          (e) {
            TabViewItem item = e.value;
            return ExpansionPanel(
              canTapOnHeader: true,
              isExpanded: (isCurrentExpanded && currentTabIdx == e.key),
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: buildHeaderWidget(
                    theme: theme,
                    leadingWidget: item.leadingWidget ??
                        (item.imagePath != null
                            ? buildLocalImage(
                                imagePath: item.imagePath, radius: 40)
                            : item.icon != null
                                ? Icon(
                                    e.value.icon,
                                    color: theme.colorScheme.primary,
                                  )
                                : const SizedBox()),
                    title: item.label,
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    trailingWidget: !viewedTabs[e.key]
                        ? CircleAvatar(
                            radius: 2.5,
                            backgroundColor: theme.colorScheme.primary,
                          )
                        : null,
                  ),
                );
              },
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: item.widget,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
