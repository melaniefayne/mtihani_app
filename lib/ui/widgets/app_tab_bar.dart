import 'package:flutter/material.dart';

/// ==================================================== View
///
class AppTabBarScaffold extends StatefulWidget {
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

  /// [AppTabBarScaffold]
  /// When defining tabs for this scaffold,
  /// avoid wrapping the widgets or the children within the widgets with 'Expanded'.
  /// Leads to RenderFlex issues and would force defining children height!
  const AppTabBarScaffold({
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
  State<AppTabBarScaffold> createState() => _AppTabBarScaffoldState();
}

class _AppTabBarScaffoldState extends State<AppTabBarScaffold> {
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

Widget buildTabHeader({
  required ThemeData theme,
  required double sectionWidth,
  required List<TabViewItem> tabs,
  required int currentTabIdx,
  required Function(int idx) onTabIndexChange,
  List<bool>? viewedTabs,
}) {
  return Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: tabs.asMap().entries.map((entry) {
            final idx = entry.key;
            final tab = entry.value;
            final isSelected = idx == currentTabIdx;

            return GestureDetector(
              onTap: () => onTabIndexChange(idx),
              child: Container(
                width: (sectionWidth * 0.93) / tabs.length,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: idx == 0 ? const Radius.circular(16) : Radius.zero,
                    bottomLeft:
                        idx == 0 ? const Radius.circular(16) : Radius.zero,
                    topRight: idx == tabs.length - 1
                        ? const Radius.circular(16)
                        : Radius.zero,
                    bottomRight: idx == tabs.length - 1
                        ? const Radius.circular(16)
                        : Radius.zero,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  tab.label,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    ),
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
