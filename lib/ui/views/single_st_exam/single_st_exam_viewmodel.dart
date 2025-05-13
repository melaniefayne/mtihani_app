import 'dart:async';

import 'package:mtihani_app/app/app.dialogs.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/services/auth_service.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String sessionFetch = 'sessionFetch';

class SingleStExamViewModel extends MultipleFutureViewModel {
  final _navigationService = locator<NavigationService>();
  final _sharedPrefsService = locator<SharedPrefsService>();
  final _dialogService = locator<DialogService>();
  final _authService = locator<AuthService>();
  bool isStudent = false;
  bool isTeacher = false;
  ExamModel? exam;
  bool isLoading = false;

  final Completer<void> _examLoaded = Completer<void>();

  StudentExamSessionDataModel? get examSession => dataMap?[sessionFetch];
  bool get isFetchingExamSession => busy(sessionFetch);

  @override
  Map<String, Future Function()> get futuresMap => {
        sessionFetch: fetchExamSession,
      };

  onSingleStExamViewReady() async {
    exam = await _sharedPrefsService.getSingleStExamNavArg();
    if (exam?.id == null) {
      _navigationService.back();
      return;
    }
    _examLoaded.complete();
    isStudent = await _authService.isLoggedInStudent;
    isTeacher = await _authService.isLoggedInTeacher;
    rebuildUi();
  }

  Future<StudentExamSessionDataModel?> fetchExamSession() async {
    await _examLoaded.future; // wait until exam is loaded

    var stExamSessionRes = await onApiGetCall<StudentExamSessionDataModel>(
      getEndpoint: endPointGetExamSession,
      queryParams: {
        "exam_id": exam!.id,
        "student_id": exam!.student_id,
        "is_detailed": true,
      },
      dataFromJson: StudentExamSessionDataModel.fromJson,
    );

    if (apiCallChecks(stExamSessionRes, 'student exam session')) {
      return stExamSessionRes.$1?.data;
    }
    return null;
  }

  List<StudentAnswerModel> get sessionQAList {
    return (examSession?.answers ?? [])
        .map((e) => e.copyWith(
                question: ExamQuestionModel(
              id: e.question_id,
              number: e.question_number,
              description: e.question_description,
              expected_answer: e.expected_answer,
              grade: e.grade,
              strand: e.strand,
              sub_strand: e.sub_strand,
              bloom_skill: e.bloom_skill,
            )))
        .toList();
  }

  onEditStudentScore(StudentAnswerModel studentAnswer) async {
    var dialogRes = await _dialogService.showCustomDialog(
      variant: DialogType.editAnswerScore,
      data: {'studentAnswer': studentAnswer},
    );
    double? trScore = dialogRes?.data;

    if (trScore != null) {
      isLoading = true;
      rebuildUi();
      var examApiRes = await onApiPostCall(
        queryParams: {"answer_id": studentAnswer.id},
        postEndpoint: endPointUpdateExamScore,
        dataMap: {"tr_score": trScore},
      );
      isLoading = false;
      rebuildUi();

      if (apiCallChecks(examApiRes, "exam answer update result",
              showSuccessMessage: true) ==
          true) {
        await initialise();
      }
    }
  }

  onDispose() async {
    await _sharedPrefsService.clearSingleStExamNavArg();
  }
}
