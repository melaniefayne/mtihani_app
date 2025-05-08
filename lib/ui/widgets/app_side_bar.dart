import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/widgets/app_tab_bar.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';

class AppSideBarScaffold extends StatefulWidget {
  final String pageTitle;
  final List<TabViewItem> tabItems;
  final Widget? trailingWidget;

  const AppSideBarScaffold({
    super.key,
    required this.tabItems,
    required this.pageTitle,
    this.trailingWidget,
  });

  @override
  State<AppSideBarScaffold> createState() => _AppSideBarScaffoldState();
}

class _AppSideBarScaffoldState extends State<AppSideBarScaffold> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    final selectedItem = widget.tabItems[selectedIndex];

    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          buildSideBarScaffold(
            theme: theme,
            pageSize: pageSize,
            bgColor: theme.primaryColor,
            children: widget.tabItems.asMap().entries.map(
              (e) {
                int i = e.key;
                return InkWell(
                  onTap: () {
                    setState(() => selectedIndex = i);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: selectedIndex == i
                        ? theme.colorScheme.onPrimary
                        : Colors.transparent,
                    child: Row(
                      children: [
                        if (widget.tabItems[i].leadingWidget != null)
                          widget.tabItems[i].leadingWidget!
                        else if (widget.tabItems[i].imagePath != null)
                          Image.asset(widget.tabItems[i].imagePath!,
                              width: 20, height: 20)
                        else if (widget.tabItems[i].icon != null)
                          Icon(
                            widget.tabItems[i].icon,
                            color: selectedIndex == i
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onPrimary,
                            size: 20,
                          ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Text(
                            widget.tabItems[i].label,
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: selectedIndex == i
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
          ),

          // Main Content Area
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: pageSize.width * 0.03,
                bottom: pageSize.width * 0.01,
                left: pageSize.height * 0.05,
                right: pageSize.height * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            selectedItem.icon,
                            color: theme.colorScheme.onSurface,
                            size: theme.textTheme.headlineSmall!.fontSize,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                selectedItem.label,
                                style: theme.textTheme.headlineSmall!.copyWith(
                                  color: theme.colorScheme.onSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(widget.pageTitle),
                            ],
                          ),
                        ],
                      ),
                      if (widget.trailingWidget != null) widget.trailingWidget!,
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(height: 1),
                  ),
                  Expanded(
                    child: IndexedStack(
                      index: selectedIndex,
                      children: widget.tabItems.map((e) => e.widget).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
