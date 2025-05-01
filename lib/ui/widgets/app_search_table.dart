import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/widgets/app_text_form_field.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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
  final bool hideTableTop;
  final bool hasTotalRow;
  final double? tableHeight;

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
    this.hideTableTop = false,
    this.hasTotalRow = false,
    this.tableHeight,
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
        bool isLastRow = i == widget.tableRows.length - 1;
        List<DataCell> rwCells = [
          DataCell(
            Text(
              isLastRow && widget.hasTotalRow ? '' : (i + 1).toString(),
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
        if (!widget.hideTableTop)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  if (widget.tableTitle != null)
                    Text(
                      widget.tableTitle!,
                      style: theme.textTheme.titleMedium!.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                  if (!widget.hideTotalCount) ...[
                    const Text(' • '),
                    Text(
                      "${widget.hasTotalRow ? widget.tableRows.length - 1 : widget.tableRows.length} Items",
                    ),
                  ],
                ],
              ),
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     if (widget.topRightWidget != null)
              //       Padding(
              //         padding: const EdgeInsets.only(right: 5),
              //         child: widget.topRightWidget!,
              //       ),
              //     if (widget.hasPaginate)
              //       Padding(
              //         padding: const EdgeInsets.only(right: 5),
              //         child: buildPaginationIndicator(
              //           theme: theme,
              //           listLength: allRows.length,
              //           onPrev: onPrevPage,
              //           onNext: onNextPage,
              //           currentPage: currentPage,
              //           totalPages: totalPages,
              //         ),
              //       ),
              //   ],
              // ),
            ],
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
        LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: widget.tableHeight,
              child: SfDataGrid(
                source: V8GridDataSource(tableRows: paginatedRows),
                columns: [
                  if (widget.hasCount)
                    GridColumn(
                      columnName: 'No.',
                      label: buildHeaderCell(theme: theme, value: ""),
                    ),
                  ...List.generate(widget.tableHeaders.length, (index) {
                    return GridColumn(
                      columnName: 'col_$index',
                      label: buildHeaderCell(
                        theme: theme,
                        value: widget.tableHeaders[index],
                      ),
                    );
                  }),
                ],
                frozenColumnsCount: 2,
                gridLinesVisibility: GridLinesVisibility.both,
                headerGridLinesVisibility: GridLinesVisibility.both,
                columnWidthMode: ColumnWidthMode.fitByCellValue,
                rowHeight: 55,
              ),
            );
          },
        ),
        if (widget.tableRows.isEmpty && !widget.hideNoItemsWidget)
          buildNoItemsWidget(widget.itemsText),
      ],
    );
  }

  Widget buildHeaderCell({
    required String value,
    required ThemeData theme,
  }) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey[100],
      ),
      child: Text(
        value,
        style: theme.textTheme.bodyLarge!
            .copyWith(color: theme.primaryColor, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class V8GridDataSource extends DataGridSource {
  late final List<DataGridRow> _gridRows;

  V8GridDataSource({
    required List<DataRow> tableRows,
  }) {
    _gridRows = tableRows.map((row) {
      List<DataGridCell<dynamic>> cells = [];

      for (int i = 0; i < row.cells.length; i++) {
        cells.add(DataGridCell<dynamic>(
          columnName: 'col_$i',
          value: row.cells[i],
        ));
      }

      return DataGridRow(cells: cells);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _gridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        return GestureDetector(
          onTap: cell.value.onTap,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: cell.value.child,
          ),
        );
      }).toList(),
    );
  }
}

DataCell buildCellTxt(
  String? value, {
  TextStyle? txtStyle,
  Function()? onAction,
  bool useLeftAlign = false,
  bool useRightAlign = false,
}) {
  return DataCell(
    onTap: onAction,
    Align(
      alignment: useRightAlign
          ? Alignment.centerRight
          : useLeftAlign
              ? Alignment.centerLeft
              : Alignment.center,
      child: Text(
        value ?? "--",
        style: txtStyle,
        textAlign: useRightAlign
            ? TextAlign.right
            : useLeftAlign
                ? TextAlign.left
                : TextAlign.center,
      ),
    ),
  );
}

DataCell buildCellViewAction({
  required ThemeData theme,
  Function()? onAction,
}) {
  return DataCell(
    onTap: onAction,
    Align(
      alignment: Alignment.center,
      child: Icon(
        Icons.visibility,
        color: theme.primaryColor,
        size: theme.textTheme.headlineMedium!.fontSize,
      ),
    ),
  );
}
