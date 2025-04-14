import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/utils.dart';
import 'dart:convert';
import 'package:universal_html/html.dart' as html;
import 'package:csv/csv.dart';

class ClassDetailsUploader extends StatefulWidget {
  final String? errorText;
  final void Function(List<StudentScores> data)? onParsed;

  const ClassDetailsUploader({Key? key, this.errorText, this.onParsed})
      : super(key: key);

  @override
  State<ClassDetailsUploader> createState() => _ClassDetailsUploaderState();
}

class _ClassDetailsUploaderState extends State<ClassDetailsUploader> {
  List<StudentScores> data = [];
  List<List<dynamic>> rows = [];
  String? _classUploadError;

  pickCSV() async {
    setState(() {
      _classUploadError = null;
    });

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null) {
      final bytes = result.files.single.bytes!;
      final csvString = utf8.decode(bytes);
      List<List<dynamic>> values = [];

      values = const CsvToListConverter()
          .convert(csvString)
          .map((row) => row.map((cell) => cell.toString().trim()).toList())
          .toList();

      if (values.isEmpty || values[0].length != classCsvHeaders.length) {
        setState(() {
          _classUploadError =
              "Invalid file format or empty data. Please use the template.";
        });
      } else {
        setState(() {
          rows = [...values];
          data = toStudentScores(values);
          widget.onParsed?.call(data);
        });
      }
    }
  }

  List<StudentScores> toStudentScores(List<List<dynamic>> rows) {
    final seenNames = <String>{};

    return rows
        .skip(1)
        .map((row) {
          final name = row[0].toString().trim();

          // Skip if name is empty or already exists
          if (name.isEmpty || seenNames.contains(name)) return null;

          seenNames.add(name);
          final scores = <TermScore>[];

          final csvScores =
              row.sublist(1).map((e) => e.toString().trim()).toList();

          for (int i = 0; i < csvScores.length; i++) {
            if (csvScores[i].isEmpty) continue;

            final score = double.tryParse(csvScores[i]);
            if (score == null) continue;

            // Determine grade and term based on index
            final gradeIndex = i ~/ 3; // 0, 1, 2 → Grade 7, 8, 9
            final termIndex = i % 3; // 0, 1, 2 → Term 1, 2, 3

            final grade = appGradeLevels[gradeIndex];
            final term = appAcademicTerms[termIndex];

            scores.add(TermScore(grade: grade, term: term, score: score));
          }

          return StudentScores(name: name, scores: scores);
        })
        .whereType<StudentScores>()
        .toList();
  }

  void downloadTemplate() {
    final csv = const ListToCsvConverter().convert([classCsvHeaders]);
    final blob = html.Blob([csv], 'text/csv');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", "student_template.csv")
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Upload Students' Details"),
              data.isEmpty
                  ? const SizedBox.shrink()
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.check_circle),
                        const SizedBox(width: 3),
                        Text("${data.length} Students Uploaded"),
                      ],
                    ),
            ],
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: theme.primaryColor),
            ),
            child: data.isEmpty
                ? buildUploadSection(theme)
                : buildStudentTable(theme),
          ),
        ],
      ),
    );
  }

  buildUploadSection(ThemeData theme) {
    String headersTxt = classCsvHeaders.join(", ");
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Instructions",
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "1. Open the template on the right in a spreadsheet application and update it with your students' details in this exact order:",
                    overflow: TextOverflow.clip,
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    headersTxt,
                    overflow: TextOverflow.clip,
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "2. Only enter student names and scores, and leave a blank where scores are not available. Kindly do not modify the header columns. Also ensure that each student name is unique",
                    overflow: TextOverflow.clip,
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    "3. Once done, download the CSV file and upload it here.",
                    overflow: TextOverflow.clip,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.download, size: 40),
                  onPressed: downloadTemplate,
                  tooltip: "Download Template",
                ),
                const Text("Download Template"),
              ],
            )
          ],
        ),
        const SizedBox(height: 15),
        if (_classUploadError != null)
          Text(
            _classUploadError!,
            style: theme.textTheme.bodyMedium!
                .copyWith(color: theme.colorScheme.error),
          ),
        ElevatedButton.icon(
          onPressed: () => pickCSV(),
          icon: const Icon(Icons.upload_file),
          label: const Text("Upload CSV"),
        ),
        if (widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              widget.errorText!,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: theme.colorScheme.error),
            ),
          ),
      ],
    );
  }

  buildStudentTable(ThemeData theme) {
    int rowsToShow = 4;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              onPressed: downloadTemplate,
              icon: const Icon(Icons.download),
              label: const Text("Download Template"),
            ),
            ElevatedButton.icon(
              onPressed: () => pickCSV(),
              icon: const Icon(Icons.upload_file),
              label: const Text("Re-upload CSV"),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: WidgetStateColor.resolveWith(
              (states) => theme.colorScheme.onInverseSurface,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: theme.colorScheme.inverseSurface,
              ),
            ),
            border: TableBorder.all(color: theme.colorScheme.inverseSurface),
            headingTextStyle: theme.textTheme.bodySmall!,
            columns:
                classCsvHeaders.map((e) => DataColumn(label: Text(e))).toList(),
            rows: rows
                .skip(1)
                .take(rowsToShow)
                .map(
                  (e) => DataRow(
                    cells: e
                        .map(
                          (cell) => DataCell(
                            Text(cell.toString(),
                                style: theme.textTheme.bodySmall!),
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: Text("Showing the first $rowsToShow rows",
              textAlign: TextAlign.center),
        )
      ],
    );
  }
}
