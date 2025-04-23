import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/widgets/app_text_form_field.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';

class AppSearchTable extends StatefulWidget {
  final bool? isSearchActive;
  final Function? onSearchCanceled;
  final Function(String? val)? onSearchTermChanged;
  final TextEditingController? searchTxtCtrl;
  final List<String> tableHeaders;
  final List<DataRow> tableRows;
  final String? hintText;
  final String itemsText;
  final bool hideNoItemsWidget;
  final bool hasPaginate;
  final bool hasCount;
  final int pageSize;
  final bool hideTotalCount;
  final Widget? topRightWidget;
  final Map<String, String>? tableKeys;
  final String? tableTitle;
  final String? downloadFileName;
  const AppSearchTable({
    super.key,
    this.isSearchActive,
    this.onSearchCanceled,
    this.onSearchTermChanged,
    this.hintText,
    this.searchTxtCtrl,
    this.hideNoItemsWidget = false,
    this.hasPaginate = false,
    this.hasCount = true,
    this.pageSize = 50,
    required this.tableHeaders,
    required this.tableRows,
    required this.itemsText,
    this.hideTotalCount = false,
    this.topRightWidget,
    this.tableKeys,
    this.tableTitle,
    this.downloadFileName,
  });

  @override
  State<AppSearchTable> createState() => _AppSearchTableState();
}

class _AppSearchTableState extends State<AppSearchTable> {
  List<DataRow> allRows = [];
  List<DataRow> paginatedRows = [];
  int currentPage = 1;
  int totalPages = 1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.tableRows.isNotEmpty) {
      tablesInit();
    }
  }

  @override
  void didUpdateWidget(covariant AppSearchTable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tableRows != widget.tableRows) {
      tablesInit();
    }
  }

  tablesInit() {
    allRows.clear();
    if (widget.hasCount) {
      for (int i = 0; i < widget.tableRows.length; i++) {
        List<DataCell> rwCells = [
          DataCell(
            Text(
              (i + 1).toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ...widget.tableRows[i].cells
        ];
        allRows.add(DataRow(cells: rwCells));
      }
    } else {
      allRows = [...widget.tableRows];
    }
    paginateTable();
  }

  paginateTable() {
    if (widget.hasPaginate) {
      debugPrint(".... paginating Table");
      int endIdx =
          allRows.length < widget.pageSize ? allRows.length : widget.pageSize;
      totalPages =
          allRows.isEmpty ? 1 : (allRows.length / widget.pageSize).ceil();
      paginatedRows = allRows.isEmpty ? [] : allRows.sublist(0, endIdx);
    } else {
      paginatedRows = allRows;
    }
  }

  onPrevPage() {
    if (allRows.isNotEmpty && currentPage > 1) {
      paginatedRows.clear();
      int startIdx = (currentPage - 2) * widget.pageSize;
      int endIdx = (currentPage - 1) * widget.pageSize;

      currentPage = currentPage - 1;
      paginatedRows = allRows.sublist(startIdx, endIdx);
      setState(() {});
    }
  }

  onNextPage() {
    if (allRows.isNotEmpty && currentPage < totalPages) {
      paginatedRows.clear();
      int startIdx = currentPage * widget.pageSize;
      int endIdx = (currentPage + 1) * widget.pageSize;
      currentPage = currentPage + 1;
      paginatedRows = allRows.sublist(
          startIdx, endIdx > allRows.length ? allRows.length : endIdx);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isSearchActive != null)
          Column(
            children: [
              AppTextFormField(
                prefixIcon: formPrefixIcon(),
                suffixIcon: widget.isSearchActive!
                    ? formClearIcon(
                        theme: theme,
                        onClearSearch: () {
                          if (widget.onSearchCanceled != null) {
                            widget.onSearchCanceled!();
                          }
                        },
                      )
                    : null,
                hintText: widget.hintText ?? "",
                onChanged: (String val) {
                  if (widget.onSearchTermChanged != null) {
                    widget.onSearchTermChanged!(val);
                  }
                },
                controller: widget.searchTxtCtrl,
              ),
              const SizedBox(height: 10),
            ],
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (widget.tableTitle != null)
                    Text(
                      widget.tableTitle!,
                      style: theme.textTheme.titleMedium!.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  if (!widget.hideTotalCount) ...[
                    const Text(' • '),
                    buildCountWidget(
                      theme: theme,
                      count: widget.tableRows.length,
                    ),
                  ],
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (widget.topRightWidget != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: widget.topRightWidget!,
                    ),
                  if (widget.hasPaginate)
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: buildPaginationIndicator(
                        theme: theme,
                        listLength: allRows.length,
                        onPrev: onPrevPage,
                        onNext: onNextPage,
                        currentPage: currentPage,
                        totalPages: totalPages,
                      ),
                    ),
                  if (widget.downloadFileName != null)
                    buildExcelDownloadBtn(widget.downloadFileName!, theme),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        if (widget.tableKeys != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Keys: ",
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                spacing: 10.0,
                children: widget.tableKeys!.entries
                    .map(
                      (e) => Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "• ${e.key}: ",
                              style: theme.textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: e.value,
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        const SizedBox(height: 5),
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
            headingTextStyle: theme.textTheme.titleMedium!
                .copyWith(color: theme.primaryColor),
            columnSpacing: 15,
            columns: (widget.hasCount
                    ? ["No.", ...widget.tableHeaders]
                    : widget.tableHeaders)
                .map((e) => DataColumn(label: Text(e)))
                .toList(),
            rows: paginatedRows,
          ),
        ),
        if (widget.tableRows.isEmpty && !widget.hideNoItemsWidget)
          buildNoItemsWidget(widget.itemsText),
      ],
    );
  }

  Widget buildExcelDownloadBtn(String fileName, ThemeData theme) {
    return
        // ElevatedButton(
        //   onPressed: () {
        //     onDownloadCSVFile(fileName);
        //   },
        //   style: ButtonStyle(
        //     backgroundColor: WidgetStatePropertyAll(theme.primaryColor),
        //     foregroundColor: WidgetStatePropertyAll(theme.colorScheme.onPrimary),
        //   ),
        //   child: Row(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Image.asset(
        //         astImagesExcelLogo,
        //         height: 25,
        //       ),
        //       const SizedBox(width: 4),
        //       const Text("Download")
        //     ],
        //   ),
        // );
        //
        const SizedBox();
  }

  onDownloadCSVFile(String fileName) async {
    // if (widget.tableRows.isEmpty) return;
    // List<List<String>> csvData = [
    //   widget.tableHeaders,
    //   ...widget.tableRows.map((row) => row.cells.map((cell) {
    //         final Widget widget = cell.child;
    //         if (widget is Text) {
    //           return widget.data ?? "--";
    //         } else if (widget is Align && widget.child is Text) {
    //           return (widget.child as Text).data ?? "---";
    //         } else {
    //           return "--";
    //         }
    //       }).toList()),
    // ];

    // String csvString = const ListToCsvConverter().convert(csvData);

    // try {
    //   await onDownloadFile(docId: fileName, csvString: csvString);
    // } catch (e) {
    //   dev.log(e.toString());
    //   final snackbarService = locator<SnackbarService>();
    //   snackbarService.showSnackbar(
    //     title: "Download failed",
    //     message: "Please try again later",
    //     duration: const Duration(seconds: 2),
    //   );
    // }
  }
}
