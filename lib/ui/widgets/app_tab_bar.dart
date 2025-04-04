import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';

/// ==================================================== View
///
class AppTabBar extends StatefulWidget {
  final List<TabViewItem> tabs;
  final Function(int? val)? onIndexChange;
  final bool showUnViewedIndicator;
  final double sectionsGapSize;
  final bool isScrollable;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final double indicatorWeight;
  final Color? dividerColor;
  final double? sectionWidth;

  /// [AppTabBar]
  /// When defining tabs for this scaffold,
  /// avoid wrapping the widgets or the children within the widgets with 'Expanded'.
  /// Leads to RenderFlex issues and would force defining children height!
  const AppTabBar({
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
    this.sectionWidth,
  });

  @override
  State<AppTabBar> createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> {
  List<bool> viewedTabs = [];
  int currentTabIdx = 0;

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
        currentTabIdx = val;

        if (widget.showUnViewedIndicator) updateViewedTabs(val);

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
    final pageWidth = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        buildTabHeader(
          theme: theme,
          sectionWidth: widget.sectionWidth ?? pageWidth,
          tabs: widget.tabs,
          currentTabIdx: currentTabIdx,
          onTabIndexChange: onTabIndexChange,
          viewedTabs: viewedTabs,
        ),
        widget.tabs[currentTabIdx].widget,
      ],
    );
  }
}

buildTabHeader({
  required ThemeData theme,
  required double sectionWidth,
  required List<TabViewItem> tabs,
  required int currentTabIdx,
  required Function(int idx) onTabIndexChange,
  List<bool>? viewedTabs,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: tabs.asMap().entries.map((e) {
      bool isSelected = e.key == currentTabIdx;
      Color tabColor = isSelected ? theme.colorScheme.primary : Colors.grey;
      return GestureDetector(
        onTap: () => onTabIndexChange(e.key),
        child: Container(
          color: Colors.transparent,
          width: (sectionWidth * 0.93) / tabs.length,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  e.value.imagePath != null
                      ? buildLocalImage(
                          imagePath: e.value.imagePath, radius: 40)
                      : e.value.icon != null
                          ? Icon(
                              e.value.icon,
                              color: tabColor,
                            )
                          : const SizedBox(),
                  const SizedBox(width: 5),
                  Text(
                    e.value.label,
                    style: theme.textTheme.bodyLarge!.copyWith(color: tabColor),
                  ),
                  if (viewedTabs != null && !viewedTabs[e.key])
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: CircleAvatar(
                        radius: 2.5,
                        backgroundColor: theme.primaryColor,
                      ),
                    ),
                ],
              ),
              SizedBox(height: currentTabIdx == e.key ? 10 : 13),
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: currentTabIdx == e.key ? 3 : 1,
              ),
            ],
          ),
        ),
      );
    }).toList(),
  );
}

/// ==================================================== Models
///
class TabViewItem {
  final String label;
  final IconData? icon;
  final String? imagePath;
  final Widget widget;

  TabViewItem({
    required this.label,
    this.icon,
    this.imagePath,
    required this.widget,
  });
}
