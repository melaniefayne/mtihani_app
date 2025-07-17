import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:mtihani_app/models/docs.dart';
import 'package:mtihani_app/ui/widgets/app_carousel.dart';
import 'package:mtihani_app/ui/widgets/app_filters.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';

import 'tr_docs_viewmodel.dart';

class TrDocsView extends StackedView<TrDocsViewModel> {
  const TrDocsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TrDocsViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPageFilters(
              fullWidth: pageSize.width * 0.85,
              filters: [
                AppFilterItem(
                  label: "Owner",
                  selectedValue: viewModel.selectedOwner,
                  onChanged: (val) {
                    viewModel.onChangeOwner(val);
                  },
                  items: appDocOwners
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                AppFilterItem(
                  label: "Status",
                  selectedValue: viewModel.selectedStatus,
                  onChanged: (val) {
                    viewModel.onChangeApproveStatus(val);
                  },
                  items: appDocApproveStates
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: pageSize.height * 0.02),

            //
            if (viewModel.isBusy)
              buildLoadingWidget(
                theme,
                "Fetching community docs",
                isLinear: true,
              ),

            //

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCountWidget(
                  theme: theme,
                  label: "Your Contributions",
                  count: viewModel.userDocs.length,
                ),
                buildPriBtn(
                  theme: theme,
                  btnTxt: "Contribute",
                  iconPath: Icons.upload_file_outlined,
                  onAction: viewModel.onUploadDocument,
                ),
              ],
            ),
            const Divider(),

            //
            viewModel.userDocs.isEmpty
                ? buildNoItemsWidget("Contribute your first document today")
                : AppCarousel(
                    children: viewModel.userDocs
                        .map((e) => buildDoc(
                              e,
                              viewModel.onDeleteDocument,
                            ))
                        .toList(),
                  ),
            SizedBox(height: pageSize.height * 0.02),

            //
            buildHeaderWidget(theme: theme, title: 'Community'),
            viewModel.communityDocs.isEmpty
                ? buildNoItemsWidget("No community docs available")
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 1.4,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    padding: EdgeInsets.zero,
                    itemCount: viewModel.communityDocs.length,
                    itemBuilder: (context, idx) => buildDoc(
                      viewModel.communityDocs[idx],
                      null,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget buildDoc(
    TeacherDocumentModel doc,
    Function(TeacherDocumentModel doc)? onDeleteDoc,
  ) {
    if (isStringEmptyOrNull(doc.file_url)) {
      return const SizedBox.shrink();
    }

    return DocumentCard(doc: doc, onDeleteDoc: onDeleteDoc);
  }

  @override
  void onViewModelReady(TrDocsViewModel viewModel) {
    viewModel.onViewModelReady();
    super.onViewModelReady(viewModel);
  }

  @override
  TrDocsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TrDocsViewModel();
}

class DocumentCard extends StatelessWidget {
  final TeacherDocumentModel doc;
  final Function(TeacherDocumentModel doc)? onDeleteDoc;
  const DocumentCard({
    super.key,
    required this.doc,
    this.onDeleteDoc,
  });

  void _openInNewTab() {
    html.window.open(doc.file_url!, '_blank');
  }

  IconData _getIconForExtension(String ext) {
    switch (ext.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'txt':
        return Icons.description;
      case 'md':
        return Icons.notes;
      default:
        return Icons.insert_drive_file;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    final String extension = doc.extension ?? 'pdf';

    return GestureDetector(
      onTap: _openInNewTab,
      child: buildWhiteCard(
        theme,
        margin: const EdgeInsets.all(10),
        height: pageSize.height * 0.18,
        Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  _getIconForExtension(extension),
                  color: kcLightGrey,
                ),
                const SizedBox(height: 4),
                Text(
                  doc.title ?? '--',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  "Type: ${extension.toUpperCase()} | Uploaded: ${getFormattedDate(doc.uploaded_at?.toLocal(), shortDateTimeFormat)}",
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 7),
                if (onDeleteDoc != null)
                  IconButton(
                    onPressed: () => onDeleteDoc!(doc),
                    icon: Icon(
                      Icons.delete,
                      color: theme.colorScheme.error,
                    ),
                  ),
              ],
            ),
            if (doc.approved_for_rag == true)
              buildIconBtn(
                theme: theme,
                iconPath: Icons.verified,
              ),
          ],
        ),
      ),
    );
  }
}
