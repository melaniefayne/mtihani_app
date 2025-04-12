import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class AppMultiFileFormField extends StatefulWidget {
  final List<html.File> selectedFiles;
  final void Function(html.File file) onFileSelected;
  final void Function(int fileIdx) onFileRemoved;
  final int maxFiles;
  final List<String>? allowedExtensions;

  const AppMultiFileFormField({
    super.key,
    required this.selectedFiles,
    required this.onFileSelected,
    required this.onFileRemoved,
    this.maxFiles = 1,
    this.allowedExtensions,
  });

  @override
  State<AppMultiFileFormField> createState() => _AppMultiFileFormFieldState();
}

class _AppMultiFileFormFieldState extends State<AppMultiFileFormField> {
  void _pickFile() {
    if (widget.selectedFiles.length >= widget.maxFiles) return;

    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.accept =
        (widget.allowedExtensions ?? []).map((e) => '.$e').join(',');
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final file = uploadInput.files?.first;

      if (file != null) {
        final alreadySelected = widget.selectedFiles.any((f) =>
            f.name == file.name && f.size == file.size && f.type == file.type);
        if (!alreadySelected) widget.onFileSelected(file);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageSize = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0),
      ),
      width: double.infinity,
      height: pageSize.height * 0.4,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  ...widget.selectedFiles.asMap().entries.map((entry) {
                    final index = entry.key;
                    final file = entry.value;
                    return InputChip(
                      label: Text(file.name),
                      onDeleted: () => widget.onFileRemoved(index),
                    );
                  }).toList(),
                ],
              ),
              const SizedBox(height: 8),
              if (widget.selectedFiles.length < widget.maxFiles)
                ElevatedButton.icon(
                  label: const Text("Add File"),
                  icon: const Icon(Icons.upload_file),
                  onPressed: _pickFile,
                ),
              const SizedBox(height: 8),
              Text(
                  '${widget.selectedFiles.length}/${widget.maxFiles} files selected'),
            ],
          ),
        ),
      ),
    );
  }
}
