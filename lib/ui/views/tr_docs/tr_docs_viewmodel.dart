import 'dart:async';
import 'package:mtihani_app/app/app.dialogs.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/models/docs.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/services/auth_service.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TrDocsViewModel extends FutureViewModel<List<TeacherDocumentModel>> {
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  String? selectedOwner;
  String? selectedStatus;
  List<TeacherDocumentModel> docsList = [];
  bool isLoadMore = false;
  String? nextPageUrl;
  int? userId;
  final Completer<void> _userIdLoaded = Completer<void>();

  onViewModelReady() async {
    UserModel? user = await _authService.getUserProfile();
    userId = user?.user_id;
    _userIdLoaded.complete();
  }

  @override
  Future<List<TeacherDocumentModel>> futureToRun() async {
    await _userIdLoaded.future; // wait until student is loaded

    Map<String, dynamic> queryParams = {};

    if (selectedOwner != null) {
      queryParams["mine"] = selectedOwner;
    }

    if (selectedStatus != null) {
      queryParams["approved"] = selectedStatus == approvedKw;
    }

    var apiCallRes = await onApiGetCall<TeacherDocumentModel>(
      getEndpoint: endPointGetDocs,
      queryParams: queryParams,
      dataField: "documents",
      listDataFromJson: TeacherDocumentModel.fromJson,
    );

    if (apiCallChecks(apiCallRes, 'community docs listing')) {
      List<TeacherDocumentModel> resDocs = apiCallRes.$1?.listData ?? [];
      docsList = isLoadMore ? [...docsList, ...resDocs] : resDocs;
      nextPageUrl = apiCallRes.$1?.next;
      return docsList;
    }

    return [];
  }

  onViewMoreDocs() async {
    if (nextPageUrl != null) {
      isLoadMore = true;
      await initialise();
      isLoadMore = false;
    }
  }

  List<TeacherDocumentModel> get userDocs {
    if (userId == null) return [];

    return docsList.where((e) => e.uploaded_by == userId).toList();
  }

  List<TeacherDocumentModel> get communityDocs {
    if (userId == null) return [];

    return docsList.where((e) => e.uploaded_by != userId).toList();
  }

  // ===== FILTERS

  onChangeOwner(String owner) async {
    if (owner == "All") {
      selectedOwner = null;
    } else {
      selectedOwner = owner;
    }

    await initialise();
  }

  onChangeApproveStatus(String status) async {
    if (status == "All") {
      selectedStatus = null;
    } else {
      selectedStatus = status;
    }

    await initialise();
  }

  // ===== ACTIONS

  onUploadDocument() async {
    var dialogRes = await _dialogService.showCustomDialog(
      variant: DialogType.uploadTrDoc,
    );

    bool? isSuccess = dialogRes?.data;
    if (isSuccess == true) {
      await initialise();
    }
  }

  onDeleteDocument(TeacherDocumentModel doc) async {
    if (doc.uploaded_by != userId) return;

    var dialogRes = await _dialogService.showCustomDialog(
      variant: DialogType.appAction,
      title: "Remove Contribution",
      description: "Are you sure you want to delete ${doc.title}?",
      barrierDismissible: true,
    );

    bool? isConfirmed = dialogRes?.confirmed;
    if (isConfirmed == true) {
      var apiCallRes = await onApiPostCall(
        postEndpoint: endPointGetDeletedDoc,
        queryParams: {"doc_id": doc.id},
      );

      if (apiCallChecks(apiCallRes, "delete contribution result",
              showSuccessMessage: true) ==
          true) {
        await initialise();
      }
    }
  }
}

const String appAllKw = "All";
const String approvedKw = "Approved";
const List<String> appDocOwners = [appAllKw, "Mine"];
const List<String> appDocApproveStates = [appAllKw, approvedKw, "Unapproved"];
