import 'package:flutter/material.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked_services/stacked_services.dart';

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
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                color: theme.colorScheme.onPrimary,
              ),
            )
          : Text(btnTxt),
      icon: (iconPath == null || isLoading)
          ? null
          : Padding(
              padding: const EdgeInsets.only(right: 3),
              child: Icon(
                iconPath,
                size: theme.textTheme.bodyLarge!.fontSize,
              ),
            ),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          isEnabled ? theme.primaryColor : Colors.grey,
        ),
        foregroundColor: WidgetStatePropertyAll(theme.colorScheme.onPrimary),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
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
