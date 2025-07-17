import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/widgets/app_text_form_field.dart';
import 'package:mtihani_app/ui/dialogs/upload_tr_doc/upload_tr_doc_dialog.form.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'upload_tr_doc_dialog_model.dart';

@FormView(fields: [
  FormTextField(name: 'file_name', validator: formAlphanumericValidator),
  FormTextField(name: 'file_description'),
])
class UploadTrDocDialog extends StackedView<UploadTrDocDialogModel>
    with $UploadTrDocDialog {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const UploadTrDocDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UploadTrDocDialogModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    const double formWidth = 0.45;

    return buildDialogScaffold(
      theme: theme,
      pageSize: pageSize,
      title: "Upload a File",
      children: [
        SizedBox(
          width: pageSize.width * formWidth,
          child: AppTextFormField(
            label: "File Name",
            inputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            controller: fileNameController,
            errorText: viewModel.fileNameValidationMessage,
          ),
        ),
        SizedBox(
          width: pageSize.width * formWidth,
          child: AppTextFormField(
            label: "Description",
            inputType: TextInputType.name,
            textInputAction: TextInputAction.done,
            controller: fileDescriptionController,
          ),
        ),
        if (viewModel.selectedFile != null)
          Container(
            width: pageSize.width * formWidth,
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: theme.dividerColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  viewModel.selectedFile!.extension == 'pdf'
                      ? Icons.picture_as_pdf
                      : Icons.insert_drive_file,
                  color: theme.primaryColor,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewModel.selectedFile!.name,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${(viewModel.selectedFile!.size / 1024).toStringAsFixed(1)} KB",
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  tooltip: 'Remove file',
                  onPressed: viewModel.onRemoveFile,
                )
              ],
            ),
          ),

        //
        const SizedBox(height: 16),
        viewModel.selectedFile != null
            ? buildPriBtn(
                theme: theme,
                onAction: () {
                  viewModel.onApiUploadTrDoc(completer);
                },
                iconPath: Icons.upload_file,
                btnTxt: 'Contribute',
                isLoading: viewModel.isLoading,
              )
            : SizedBox(
                width: pageSize.width * formWidth,
                child: ElevatedButton.icon(
                  onPressed: viewModel.onPickFile,
                  icon: const Icon(Icons.upload_file),
                  label: const Text("Upload File"),
                ),
              ),
      ],
    );
  }

  @override
  void onViewModelReady(UploadTrDocDialogModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(UploadTrDocDialogModel viewModel) {
    viewModel.clearForm();
    super.onDispose(viewModel);
  }

  @override
  UploadTrDocDialogModel viewModelBuilder(BuildContext context) =>
      UploadTrDocDialogModel();
}
