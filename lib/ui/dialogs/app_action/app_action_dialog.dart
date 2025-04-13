import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app_action_dialog_model.dart';

class AppActionDialog extends StackedView<AppActionDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  // final Function? primaryAction;
  // final Function? negativeAction;
  // final String confirmTxt;
  // final IconData? confirmIcon;
  // final String cancelTxt;
  // final IconData? cancelIcon;
  // final Widget? extraWidget;
  // final IconData? iconPath;

  const AppActionDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AppActionDialogModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final widgetConfig = request.data as Map<String, dynamic>?;
    final bool hasDoubleAction = widgetConfig?['negativeAction'] != null &&
        widgetConfig?['primaryAction'] != null;

    Widget buildConfirmBtn = buildPriBtn(
      theme: theme,
      onAction: () {
        if (widgetConfig?['primaryAction'] != null) {
          widgetConfig!['primaryAction']!();
          return;
        }
        completer(DialogResponse(confirmed: true));
      },
      btnTxt: widgetConfig?['confirmTxt'] ?? 'OK',
      iconPath: widgetConfig?['confirmIcon'] ?? Icons.check,
      isFullWidth: !hasDoubleAction,
    );

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                buildPopupHeader(
                  theme: theme,
                  iconPath: widgetConfig?['iconPath'] != null
                      ? (widgetConfig!['iconPath'])
                      : Icons.info,
                  title: request.title ?? '--',
                ),
                if (widgetConfig?['extraWidget'] != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: widgetConfig!['extraWidget'],
                  ),
                Text(
                  request.description ?? '--',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
              ],
            ),
            hasDoubleAction
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildSecBtn(
                        theme: theme,
                        onAction: () {
                          if (widgetConfig?['negativeAction'] != null) {
                            widgetConfig!['negativeAction']!();
                            return;
                          }
                          completer(DialogResponse(confirmed: false));
                        },
                        btnTxt: widgetConfig?['cancelTxt'] ?? 'Cancel',
                        iconPath: widgetConfig?['cancelIcon'] ?? Icons.cancel,
                        isFullWidth: false,
                      ),
                      buildConfirmBtn,
                    ],
                  )
                : buildConfirmBtn
          ],
        ),
      ),
    );
  }

  @override
  AppActionDialogModel viewModelBuilder(BuildContext context) =>
      AppActionDialogModel();
}
