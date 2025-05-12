import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/models/cbc.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/services/cbc_service.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';

class StExamAnswersListModel extends BaseViewModel {
  List<StudentAnswerModel> answersList = [];
  final _cbcService = locator<CbcService>();
  TextEditingController searchTxtCtrl = TextEditingController();
  bool isSearchActive = false;
  String? searchTerm;
  int? selectedGrade;
  String? selectedBloomSkill;
  StrandModel? selectedStrand;
  SubStrandModel? selectedSubStrand;

  List<StudentAnswerModel> answers;
  StExamAnswersListModel(this.answers) {
    answersList = [...answers];
  }

  onLocalFilter() {
    answersList = answers.where((a) {
      final matchesGrade = selectedGrade == null || a.grade == selectedGrade;

      final matchesStrand = selectedStrand?.name == null ||
          a.strand?.toLowerCase() == selectedStrand?.name?.toLowerCase();

      final matchesSubStrand = selectedSubStrand?.name == null ||
          a.question?.sub_strand?.toLowerCase() ==
              selectedSubStrand?.name?.toLowerCase();

      final matchesBloomSkill = selectedBloomSkill == null ||
          a.question?.bloom_skill?.toLowerCase() ==
              selectedBloomSkill?.toLowerCase();

      final matchesDescription = searchTerm == null ||
          (a.question?.description
                  ?.toLowerCase()
                  .contains(searchTerm!.toLowerCase()) ??
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
}
