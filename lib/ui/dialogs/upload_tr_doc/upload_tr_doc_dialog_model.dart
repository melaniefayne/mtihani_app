import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mtihani_app/ui/dialogs/upload_tr_doc/upload_tr_doc_dialog.form.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UploadTrDocDialogModel extends BaseViewModel with FormStateHelper {
  bool isLoading = false;
  PlatformFile? selectedFile;

  onPickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'txt', 'md'],
    );

    if (result != null && result.files.isNotEmpty) {
      selectedFile = result.files.first;
      rebuildUi();
    }
  }

  onRemoveFile() {
    selectedFile = null;
    rebuildUi();
  }

  onApiUploadTrDoc(Function(DialogResponse<dynamic>)? completer) async {
    if (completer == null) return;

    validateForm();
    if (!isFormValid) {
      rebuildUi();
      return;
    }

    isLoading = true;
    rebuildUi();

    var apiCallRes = await onApiPostCall(
      postEndpoint: endPointGetUploadDoc,
      isFileDataMap: true,
      dataMap: {
        "title": fileNameValue,
        "description": fileDescriptionValue,
        "file": MultipartFile.fromBytes(
          selectedFile!.bytes!,
          filename: selectedFile!.name,
        ),
      },
    );
    isLoading = false;
    rebuildUi();

    if (apiCallChecks(apiCallRes, "upload result", showSuccessMessage: true) ==
        true) {
      completer(DialogResponse(data: true));
    }
  }
}
