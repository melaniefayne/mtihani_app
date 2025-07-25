import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked_services/stacked_services.dart';

Widget buildAppLogo({String? localImgPath, double? height}) {
  return Image.asset(
    localImgPath ?? astImagesDarkLogo,
    height: height ?? 60,
  );
}

Widget formEyePassIcon({
  required bool isVisible,
  required Function onObscurePass,
  required ThemeData theme,
}) {
  return GestureDetector(
    onTap: () => onObscurePass(),
    child: Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Icon(
        isVisible ? Icons.visibility_off : Icons.visibility,
        size: 30,
        color: theme.primaryColor,
      ),
    ),
  );
}

Widget buildPopupHeader(
    {required ThemeData theme,
    required IconData iconPath,
    bool hideClose = false,
    Widget? trailingWidget,
    required String title}) {
  double? iconSize = theme.textTheme.headlineMedium!.fontSize;
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                iconPath,
                size: iconSize,
                color: theme.primaryColor,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          trailingWidget ??
              (!hideClose
                  ? IconButton(
                      onPressed: () {
                        final navigationService = locator<NavigationService>();
                        navigationService.back();
                      },
                      icon: Icon(
                        Icons.close,
                        size: iconSize,
                        color: theme.primaryColor,
                      ),
                    )
                  : const SizedBox())
        ],
      ),
      const Divider(),
      const SizedBox(height: 5),
    ],
  );
}

Widget buildBottomSheetScaffold({
  required ThemeData theme,
  required List<Widget> children,
  required IconData iconPath,
  required String title,
  required double pageHeight,
}) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    padding: const EdgeInsets.all(10),
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          buildPopupHeader(
            theme: theme,
            iconPath: iconPath,
            title: title,
          ),
          SizedBox(
            height: pageHeight * 0.43,
            child: SingleChildScrollView(
              child: Column(
                children: children,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

buildPriBtn({
  required ThemeData theme,
  required String btnTxt,
  required Function() onAction,
  bool isEnabled = true,
  bool isLoading = false,
  IconData? iconPath,
  bool isFullWidth = false,
  Color? bgColor,
  Color? fgColor,
}) {
  return SizedBox(
    width: isFullWidth ? double.infinity : null,
    child: ElevatedButton.icon(
      onPressed: (isEnabled && !isLoading) ? onAction : null,
      label: isLoading
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                color: theme.colorScheme.onPrimary,
              ),
            )
          : Text(btnTxt),
      icon: (iconPath == null || isLoading)
          ? null
          : Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(
                iconPath,
                size: theme.textTheme.bodyLarge!.fontSize,
                color: fgColor ?? theme.colorScheme.onPrimary,
              ),
            ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        backgroundColor:
            isEnabled ? bgColor ?? theme.primaryColor : Colors.grey,
        foregroundColor: fgColor ?? theme.colorScheme.onPrimary,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
    ),
  );
}

Widget buildSecBtn({
  required ThemeData theme,
  required String btnTxt,
  required Function() onAction,
  bool isEnabled = true,
  bool isLoading = false,
  IconData? iconPath,
  bool isFullWidth = false,
}) {
  return Container(
    width: isFullWidth ? double.infinity : null,
    decoration: BoxDecoration(
      border: Border.all(color: theme.primaryColor, width: 2.0),
    ),
    child: ElevatedButton.icon(
      onPressed: (isEnabled && !isLoading) ? onAction : null,
      icon: (iconPath == null || isLoading)
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(
                iconPath,
                size: theme.textTheme.bodyLarge!.fontSize,
              ),
            ),
      label: isLoading
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                color: theme.primaryColor,
              ),
            )
          : Text(btnTxt),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: theme.primaryColor,
        shadowColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      ),
    ),
  );
}

buildIconBtn({
  required ThemeData theme,
  Function()? onAction,
  required IconData iconPath,
  Color? bgColor,
  Color? fgColor,
}) {
  return GestureDetector(
    onTap: onAction,
    child: CircleAvatar(
      backgroundColor: bgColor ?? theme.primaryColor,
      foregroundColor: fgColor ?? theme.colorScheme.onPrimary,
      child: Icon(iconPath),
    ),
  );
}

Widget buildPageTitle({
  required ThemeData theme,
  required String pageTitle,
  Function()? action,
  String? actionTxt,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Text(
              pageTitle,
              style: theme.textTheme.titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          // Positioned Skip button
          if (action != null)
            Positioned(
              right: 0,
              child: TextButton(
                onPressed: action,
                child: Text(
                  actionTxt ?? "Skip",
                  style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
        ],
      ),
      const SizedBox(height: 5),
      const Divider(thickness: 1),
      const SizedBox(height: 5),
    ],
  );
}

Widget buildDropDownFormField({
  required ThemeData theme,
  required String label,
  double? width,
  required dynamic selectedValue,
  required List<DropdownMenuItem<dynamic>> items,
  required Function(dynamic) onChanged,
  String? hint,
  String? errorText,
}) {
  return Container(
    width: width,
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField<dynamic>(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            label: Text(
              label,
              style: theme.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            errorText: errorText,
            errorStyle: theme.textTheme.bodySmall!
                .copyWith(color: theme.colorScheme.error),
          ),
          value: selectedValue,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: (dynamic value) {
            onChanged(value);
          },
          items: items,
          validator: (value) {
            return null;
          },
        ),
      ),
    ),
  );
}

Widget buildLocalImage({
  String? imagePath,
  double radius = 45.0,
  String placeholderImgPath = astImagesLightLogo,
  Color? borderColor,
}) {
  return Image.asset(
    imagePath ?? placeholderImgPath,
    width: radius,
    height: radius,
  );
}

Widget buildHeaderWidget({
  required ThemeData theme,
  required String title,
  TextStyle? style,
  Widget? leadingWidget,
  Widget? trailingWidget,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Row(
      children: [
        if (leadingWidget != null)
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: leadingWidget,
          ),
        Text(
          title,
          style: style ??
              theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Divider(
              color: theme.colorScheme.outline,
            ),
          ),
        ),
        if (trailingWidget != null) trailingWidget,
      ],
    ),
  );
}

Widget buildDetailWidget({
  required ThemeData theme,
  required String label,
  required String value,
  TextStyle? valueStyle,
}) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: "$label: ",
        ),
        TextSpan(
          text: value,
          style: valueStyle ??
              theme.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
        )
      ],
    ),
  );
}

buildLoadingWidget(ThemeData theme, String loadTxt, {bool isLinear = false}) {
  return Center(
    child: isLinear
        ? Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Text(
                  loadTxt,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Lottie.asset(astLottieLoading, repeat: true, width: 20),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Lottie.asset(astLottieLoading, repeat: true),
                ),
                const SizedBox(height: 4),
                Text(loadTxt),
              ],
            ),
          ),
  );
}

buildNoItemsWidget(String noItemsItx, {Widget? extraWidget}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(astLottieNoItems, height: 120, repeat: true),
          const SizedBox(height: 4),
          Text(noItemsItx),
          if (extraWidget != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: extraWidget,
            ),
        ],
      ),
    ),
  );
}

Widget buildSectionDivider({
  required double height,
  required Color color,
}) {
  return Container(
    margin: const EdgeInsets.all(10),
    height: height,
    width: 1.0,
    decoration: BoxDecoration(
      color: color,
    ),
  );
}

Widget formPrefixIcon({IconData? iconPath}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Icon(iconPath ?? Icons.search),
  );
}

Widget formClearIcon({
  required Function onClearSearch,
  required ThemeData theme,
}) {
  return GestureDetector(
    onTap: () => onClearSearch(),
    child: Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Icon(
        Icons.close,
        size: 30,
        color: theme.primaryColor,
      ),
    ),
  );
}

buildCountWidget(
    {required ThemeData theme, String? label, required int count}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      if (label != null)
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Text(
            label,
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      CircleAvatar(
        radius: theme.textTheme.bodyMedium!.fontSize,
        backgroundColor: theme.primaryColor,
        child: Text(
          count.toString(),
          style: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimary,
          ),
        ),
      )
    ],
  );
}

Widget buildPaginationIndicator({
  required ThemeData theme,
  required int listLength,
  required Function() onPrev,
  required Function() onNext,
  required int currentPage,
  required int totalPages,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          IconButton(
            onPressed: () {
              onPrev();
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: (listLength != 0 && currentPage > 1)
                  ? theme.primaryColor
                  : Colors.grey[400],
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: "Page "),
                TextSpan(text: currentPage.toString()),
                const TextSpan(text: " of "),
                TextSpan(text: totalPages.toString()),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              onNext();
            },
            icon: Icon(
              Icons.keyboard_arrow_right,
              color: (listLength != 0 && currentPage < totalPages)
                  ? theme.primaryColor
                  : Colors.grey[400],
            ),
          )
        ],
      ),
    ],
  );
}

buildDialogScaffold({
  required ThemeData theme,
  required Size pageSize,
  required String title,
  required List<Widget> children,
  bool hideLogo = true,
}) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    backgroundColor: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: pageSize.height * 0.03),
          if (!hideLogo) buildAppLogo(),
          SizedBox(
            width: pageSize.width * 0.4,
            child: buildPageTitle(
              theme: theme,
              pageTitle: title,
              actionTxt: "Back",
              action: () {
                final navigationService = locator<NavigationService>();
                navigationService.back();
              },
            ),
          ),
          ...children,
          SizedBox(height: pageSize.height * 0.05),
        ],
      ),
    ),
  );
}

Widget buildPageAppHeader({
  required ThemeData theme,
  required String pageTitle,
  Widget? trailing,
  IconData? iconPath,
  bool hideBackNav = true,
}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (!hideBackNav)
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: IconButton(
                    onPressed: () {
                      final navigationService = locator<NavigationService>();
                      navigationService.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: theme.primaryColor,
                    ),
                  ),
                ),
              if (iconPath != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    iconPath,
                    color: theme.primaryColor,
                  ),
                ),
              Text(
                pageTitle,
                style: (hideBackNav
                        ? theme.textTheme.titleMedium
                        : theme.textTheme.headlineMedium)!
                    .copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
          if (trailing != null) trailing,
        ],
      ),
      const SizedBox(height: 10),
      Divider(
        thickness: hideBackNav ? null : 2.0,
        color: theme.primaryColor,
      )
    ],
  );
}

Widget buildAppPageScaffold({
  required ThemeData theme,
  required String pageTitle,
  required Size pageSize,
  required List<Widget> children,
  Widget? trailing,
}) {
  return Scaffold(
    body: Padding(
      padding: EdgeInsets.all(pageSize.height * 0.04),
      child: Column(
        children: [
          buildPageAppHeader(
            theme: theme,
            hideBackNav: false,
            pageTitle: pageTitle,
            trailing: trailing,
          ),
          SizedBox(height: pageSize.height * 0.01),
          ...children,
        ],
      ),
    ),
  );
}

Widget getScreenMenuItem({
  required ThemeData theme,
  final Function? action,
  required String label,
  String? subtitle,
  required IconData iconPath,
  Color textColor = Colors.black,
}) {
  return GestureDetector(
    onTap: action == null
        ? null
        : () {
            action();
          },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.outlineVariant,
          width: 1,
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
          leading: Icon(
            iconPath,
            color: textColor,
          ),
          title: Text(
            label,
            style: theme.textTheme.titleSmall!.copyWith(
              color: textColor,
            ),
          ),
          subtitle: subtitle != null
              ? Text(subtitle, style: theme.textTheme.bodySmall)
              : null,
          trailing: action == null
              ? const SizedBox()
              : Icon(Icons.arrow_forward_ios,
                  color: theme.primaryColor, size: 16)),
    ),
  );
}

Widget buildStatusDot(
  ThemeData theme,
  String statusLabel,
  Color statusColor, {
  double iconSize = 14,
  TextStyle? txtStyle,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.circle, size: iconSize, color: statusColor),
      const SizedBox(width: 4),
      Text(
        statusLabel,
        style: txtStyle ?? theme.textTheme.labelMedium,
      ),
    ],
  );
}

Widget buildPageSectionScaffold(
    {required ThemeData theme,
    required String title,
    required IconData iconPath,
    required List<Widget> children,
    Widget? headerTrailing}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPageAppHeader(
          theme: theme,
          iconPath: iconPath,
          pageTitle: title,
          trailing: headerTrailing,
        ),
        const SizedBox(height: 10),
        ...children,
      ],
    ),
  );
}

Widget metaIconText(
    ThemeData theme, Size pageSize, IconData icon, String label, String? value,
    {bool isLast = false, double? spacing}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon),
      const SizedBox(width: 10),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            value ?? '—-',
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
      if (!isLast)
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: spacing ?? pageSize.width * 0.035),
          width: 1,
          height: pageSize.height * 0.05,
          color: theme.colorScheme.outlineVariant,
        ),
    ],
  );
}

Widget buildSideBarScaffold({
  required ThemeData theme,
  required Size pageSize,
  required List<Widget> children,
  Color? bgColor,
  double? width,
  CrossAxisAlignment? crossAxisAlignment,
}) {
  return Container(
    width: width ?? pageSize.width * 0.15,
    color: bgColor ?? theme.primaryColor,
    padding: const EdgeInsets.symmetric(vertical: 24),
    child: Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: pageSize.height * 0.02),
            child: buildAppLogo(localImgPath: astImagesLightLogo, height: 45),
          ),
        ),
        Divider(color: theme.colorScheme.onPrimary, height: 1),
        ...children,
      ],
    ),
  );
}

buildWhiteCard(
  ThemeData theme,
  Widget child, {
  EdgeInsetsGeometry? margin,
  double? height,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    margin: margin ?? const EdgeInsets.symmetric(vertical: 5),
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      border: Border.all(color: theme.primaryColor),
      boxShadow: [
        BoxShadow(
          color: theme.primaryColor,
          offset: const Offset(4, 4),
          spreadRadius: -1,
          blurRadius: 0,
        ),
      ],
    ),
    child: child,
  );
}

buildSubTitle({
  required ThemeData theme,
  required String title,
  String? subtitle,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium!.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
        if (subtitle != null)
          Text(
            subtitle,
            style: theme.textTheme.labelMedium!.copyWith(
              fontStyle: FontStyle.italic,
            ),
          ),
      ],
    ),
  );
}

Widget buildSideDialogScaffold({
  required ThemeData theme,
  required Size pageSize,
  required Widget child,
  required IconData iconPath,
  required String title,
}) {
  return Material(
    color: Colors.transparent,
    child: Container(
      width: pageSize.width,
      height: pageSize.height,
      color: Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: pageSize.height,
            width: pageSize.width / 2.2,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLowest,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildPopupHeader(
                    theme: theme,
                    iconPath: iconPath,
                    title: title,
                  ),
                  child,
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

buildVerticalDivider(Size pageSize) {
  return Container(
    color: Colors.grey,
    width: 1,
    height: pageSize.height * 0.3,
    margin: const EdgeInsets.symmetric(horizontal: 10),
  );
}
