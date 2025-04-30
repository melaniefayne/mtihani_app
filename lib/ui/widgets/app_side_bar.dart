import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/widgets/app_tab_bar.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';

class AppSideBarScaffold extends StatefulWidget {
  final String pageTitle;
  final List<TabViewItem> tabItems;

  const AppSideBarScaffold({
    super.key,
    required this.tabItems,
    required this.pageTitle,
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
          Container(
            width: pageSize.width * 0.17,
            color: theme.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: pageSize.height * 0.02),
                  child: buildAppLogo(
                      localImgPath: astImagesLightLogo, height: 40),
                ),
                Divider(color: theme.colorScheme.onPrimary, height: 1),
                for (int i = 0; i < widget.tabItems.length; i++)
                  InkWell(
                    onTap: () {
                      setState(() => selectedIndex = i);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16),
                      color: selectedIndex == i
                          ? theme.colorScheme.primaryContainer
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
                                  ? theme.colorScheme.onPrimaryContainer
                                  : theme.colorScheme.onPrimary,
                              size: 20,
                            ),
                          const SizedBox(width: 12),
                          Flexible(
                            child: Text(
                              widget.tabItems[i].label,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: selectedIndex == i
                                    ? theme.colorScheme.onPrimaryContainer
                                    : theme.colorScheme.onPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
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
                    children: [
                      Icon(
                        selectedItem.icon,
                        color: theme.colorScheme.onSurface,
                        size: theme.textTheme.headlineSmall!.fontSize,
                      ),
                      const SizedBox(width: 10),
                      Text.rich(
                        TextSpan(
                          text: widget.pageTitle,
                          children: [
                            const TextSpan(text: ": "),
                            TextSpan(
                              text: selectedItem.label,
                              style: theme.textTheme.headlineSmall!.copyWith(
                                color: theme.colorScheme.onSurface,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 1),
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
