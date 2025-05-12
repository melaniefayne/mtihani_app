import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mtihani_app/app/app.dialogs.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/models/cbc.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/services/cbc_service.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ExamQuestionListModel extends FutureViewModel<List<ExamQuestionModel>> {
  ExamModel exam;
  ExamQuestionListModel(this.exam);

  final _cbcService = locator<CbcService>();
  final _dialogService = locator<DialogService>();
  final _sharedPrefsService = locator<SharedPrefsService>();
  List<ExamQuestionModel> questionsOgList = [];
  List<ExamQuestionModel> questionsList = [];
  String? nextPageUrl;
  bool isLoadMore = false;
  TextEditingController searchTxtCtrl = TextEditingController();
  bool isSearchActive = false;
  String? searchTerm;
  int? selectedGrade;
  String? selectedBloomSkill;
  StrandModel? selectedStrand;
  SubStrandModel? selectedSubStrand;
  bool isLoading = false;

  @override
  Future<List<ExamQuestionModel>> futureToRun() async {
    Map<String, dynamic> queryParams = {"exam_id": exam.id};

    // if (!isStringEmptyOrNull(searchTerm)) {
    //   queryParams["search"] = searchTerm;
    // }

    // if (selectedGrade != null) {
    //   queryParams["grade"] = selectedGrade;
    // }

    // if (selectedBloomSkill != null) {
    //   queryParams["bloom_skill"] = selectedBloomSkill;
    // }

    // if (selectedStrand != null) {
    //   queryParams["strand"] = selectedStrand!.name;
    // }

    // if (selectedSubStrand != null) {
    //   queryParams["sub_strand"] = selectedSubStrand!.name;
    // }

    var examQuestionsApiRes = await onApiGetCall<ExamQuestionModel>(
      getEndpoint: isLoadMore
          ? nextPageUrl ?? endPointGetExamQuestions
          : endPointGetExamQuestions,
      queryParams: queryParams,
      listDataFromJson: ExamQuestionModel.fromJson,
    );

    if (apiCallChecks(examQuestionsApiRes, 'exam questions listing')) {
      List<ExamQuestionModel> resQuestions =
          examQuestionsApiRes.$1?.listData ?? [];
      questionsList =
          isLoadMore ? [...questionsList, ...resQuestions] : resQuestions;
      nextPageUrl = examQuestionsApiRes.$1?.next;
      questionsOgList = [...questionsList];
      // List<Map<String, dynamic>> res = questionsOgList
      //     .map((e) => {
      //           "id": e.id,
      //           "question": e.description,
      //           "expected_answer": e.expected_answer
      //         })
      //     .toList();
      // log(jsonEncode(res));
      return questionsList;
    }
    return [];
  }

  onViewMoreQuestions() async {
    if (nextPageUrl != null) {
      isLoadMore = true;
      await initialise();
      isLoadMore = false;
    }
  }

  onLocalFilter() {
    questionsList = questionsOgList.where((q) {
      final matchesGrade = selectedGrade == null || q.grade == selectedGrade;

      final matchesStrand = selectedStrand?.name == null ||
          q.strand?.toLowerCase() == selectedStrand?.name?.toLowerCase();

      final matchesSubStrand = selectedSubStrand?.name == null ||
          q.sub_strand?.toLowerCase() == selectedSubStrand?.name?.toLowerCase();

      final matchesBloomSkill = selectedBloomSkill == null ||
          q.bloom_skill?.toLowerCase() == selectedBloomSkill?.toLowerCase();

      final matchesDescription = searchTerm == null ||
          (q.description?.toLowerCase().contains(searchTerm!.toLowerCase()) ??
              false);

      return matchesGrade &&
          matchesStrand &&
          matchesSubStrand &&
          matchesBloomSkill &&
          matchesDescription;
    }).toList();

    rebuildUi();
  }

  Timer? _searchDebounce;
  onSearchTermChanged(String? val) async {
    if (_searchDebounce?.isActive ?? false) _searchDebounce!.cancel();
    _searchDebounce = Timer(const Duration(seconds: 1), () async {
      searchTerm = val;

      if (isStringEmptyOrNull(val)) {
        await onSearchCanceled();
        return;
      }

      isSearchActive = true;
      await onLocalFilter();
    });
  }

  onSearchCanceled() async {
    isSearchActive = false;
    searchTerm = null;
    searchTxtCtrl.clear();
    await onLocalFilter();
  }

  onChangeSelectedGrade(String grade) {
    if (grade == "All") {
      selectedGrade = null;
    } else {
      selectedGrade = int.parse(grade);
    }
    onLocalFilter();
  }

  onChangeSelectedBloomSkill(String bloomSkill) {
    if (bloomSkill == "All") {
      selectedBloomSkill = null;
    } else {
      selectedBloomSkill = bloomSkill;
    }
    onLocalFilter();
  }

  List<StrandModel> get allStrands =>
      _cbcService.getAllStrandsForGrade(selectedGrade);
  onChangeSelectedStrand(StrandModel strand) {
    if (strand.name == "All") {
      selectedStrand = null;
    } else {
      selectedStrand = strand;
    }
    onLocalFilter();
  }

  List<SubStrandModel> get allSubStrands =>
      _cbcService.getAllSubStrandsForStrand(selectedStrand?.id);
  onChangeSelectedSubStrand(SubStrandModel subStrand) {
    if (subStrand.name == "All") {
      selectedSubStrand = null;
    } else {
      selectedSubStrand = subStrand;
    }
    onLocalFilter();
  }

  onEditQuestion(ExamQuestionModel examQuestion) async {
    var dialogRes = await _dialogService.showCustomDialog(
      variant: DialogType.editExamQuestion,
      data: {'examQuestion': examQuestion},
    );
    Map<String, dynamic>? updateBody = dialogRes?.data;

    if (updateBody != null) {
      isLoading = true;
      rebuildUi();
      var examApiRes = await onApiPostCall<ExamModel>(
        postEndpoint: endPointEditExamQuestions,
        dataMap: {
          "questions": [updateBody],
        },
        dataFromJson: ExamModel.fromJson,
        dataField: "new_exam",
      );
      isLoading = false;
      rebuildUi();

      if (apiCallChecks(examApiRes, "exam question update result",
              showSuccessMessage: true) ==
          true) {
        ExamModel? resExam = examApiRes.$1?.data;
        if (resExam != null) {
          exam = resExam;
          await _sharedPrefsService.setSingleTrExamNavArg(resExam);
          await initialise();
        }
      }
    }
  }
}
