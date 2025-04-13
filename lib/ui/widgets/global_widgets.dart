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
  bool isFullWidth = true,
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
              ),
            ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        backgroundColor: isEnabled ? theme.primaryColor : Colors.grey,
        foregroundColor: theme.colorScheme.onPrimary,
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
  bool isFullWidth = true,
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
  required Function() onAction,
  required IconData iconPath,
}) {
  return GestureDetector(
    onTap: onAction,
    child: CircleAvatar(
      backgroundColor: theme.primaryColor,
      foregroundColor: theme.colorScheme.onPrimary,
      child: Icon(
        iconPath,
        color: theme.primaryColor,
      ),
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
              style: theme.textTheme.headlineMedium!
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
  return Row(
    children: [
      if (leadingWidget != null)
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: leadingWidget,
        ),
      Text(
        title,
        style: style ?? theme.textTheme.titleSmall,
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

buildLoadingWidget(ThemeData theme, String loadTxt) {
  return Padding(
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
  );
}

buildNoItemsWidget(String noItemsItx) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(astLottieNoItems, height: 120, repeat: true),
        const SizedBox(height: 4),
        Text(noItemsItx),
      ],
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
    {required ThemeData theme, required String label, required int count}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        label,
        style: theme.textTheme.titleLarge!.copyWith(
          color: theme.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(width: 5),
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
  );
}
