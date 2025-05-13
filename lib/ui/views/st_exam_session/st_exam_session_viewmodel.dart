import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:mtihani_app/app/app.dialogs.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StExamSessionViewModel
    extends FutureViewModel<StudentExamSessionDataModel?> {
  final _snackbarService = locator<SnackbarService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _sharedPrefsService = locator<SharedPrefsService>();
  ExamModel? exam;
  final Completer<void> _examLoaded = Completer<void>();
  int currentIndex = 0;
  Timer? countdownTimer;
  Duration timeRemaining = const Duration();
  Color timerColor = appGreen;
  String warningMessage = '';
  late PageController pageController;
  final List<StudentAnswerEditModel> editableAnswers = [];

  StExamSessionViewModel() {
    pageController = PageController();
  }

  onSingleStExamSessionViewReady() async {
    exam = await _sharedPrefsService.getSingleStExamNavArg();
    if (exam?.id == null) {
      _navigationService.back();
      return;
    }
    startTimer();
    _examLoaded.complete();
    rebuildUi();
  }

  @override
  Future<StudentExamSessionDataModel?> futureToRun() async {
    await _examLoaded.future; // wait until exam is loaded

    StudentExamSessionDataModel? stExamSession =
        await fetchStudentExamSession();
    if (stExamSession != null) {
      if (stExamSession.session?.status == "Upcoming") {
        stExamSession = await startStudentExamSession();
      }
      _populateEditableAnswers(stExamSession?.answers ?? []);
      return stExamSession;
    }
    return null;
  }

  _populateEditableAnswers(List<StudentAnswerModel> answers) {
    editableAnswers.clear();
    for (final ans in answers) {
      editableAnswers.add(StudentAnswerEditModel(
        answer: ans,
      )..descTxtCtrl.text = ans.description ?? '');
    }
  }

  Future<StudentExamSessionDataModel?> fetchStudentExamSession() async {
    var stExamSessionRes = await onApiGetCall<StudentExamSessionDataModel>(
      getEndpoint: endPointGetExamSession,
      queryParams: queryParams,
      dataFromJson: StudentExamSessionDataModel.fromJson,
    );

    if (apiCallChecks(stExamSessionRes, 'student exam session')) {
      return stExamSessionRes.$1?.data;
    }

    return null;
  }

  Future<StudentExamSessionDataModel?> startStudentExamSession() async {
    var stExamSessionRes = await onApiPostCall<StudentExamSessionDataModel>(
      postEndpoint: endPointStartExamSession,
      queryParams: queryParams,
      dataFromJson: StudentExamSessionDataModel.fromJson,
    );
    if (apiCallChecks(stExamSessionRes, 'start student exam session')) {
      return stExamSessionRes.$1?.data;
    }
    return null;
  }

  updateQuestionAnswer(int? answerId, TextEditingController txtCtrl) async {
    if (isStringEmptyOrNull(txtCtrl.text)) {
      _snackbarService.showSnackbar(
        title: "No answer",
        message: "Fill in an answer to confirm",
        duration: const Duration(seconds: appSnackbarDuration),
      );
      return;
    }

    var updateAnswerRes = await onApiPostCall(
      postEndpoint: endPointUpdateExamAnswer,
      queryParams: {"answer_id": answerId},
      dataMap: {"description": txtCtrl.text.trim()},
    );
    if (apiCallChecks(updateAnswerRes, 'update answer result')) {
      await initialise();
    }
  }

  endExamSession() async {
    var dialogRes = await _dialogService.showCustomDialog(
      variant: DialogType.startExam,
      data: {"currentExam": exam, "isStartExamDialog": false},
    );
    bool? isConfirmed = dialogRes?.data;
    if (isConfirmed == true) {
      var stExamSessionRes = await onApiPostCall(
        postEndpoint: endPointEndExamSession,
        queryParams: queryParams,
      );
      if (apiCallChecks(stExamSessionRes, 'start student exam session',
          showSuccessMessage: true)) {
        _navigationService.clearStackAndShow(Routes.dashboardView);
      }
    }
  }

  startTimer() {
    final now = DateTime.now();
    final end = exam!.end_date_time ?? now;
    timeRemaining = end.difference(now);

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final newRemaining = end.difference(DateTime.now());

      if (newRemaining <= Duration.zero) {
        timeRemaining = Duration.zero;
        timerColor = appRed;
        warningMessage = "⏰ Time is up!";
        rebuildUi();
        timer.cancel();
        endExamSession();
        return;
      }

      timeRemaining = newRemaining;
      if (timeRemaining.inMinutes <= 10) {
        timerColor = appPeach;
        warningMessage = "⚠️ Less than 10 minutes remaining";
      }
      rebuildUi();
    });
  }

  next() {
    if (currentIndex < editableAnswers.length - 1) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  prev() {
    if (currentIndex > 0) {
      pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  onPageChanged(int idx) {
    currentIndex = idx;
    rebuildUi();
  }

  bool isQuestionAnswered(int questionIdx) {
    return !isStringEmptyOrNull(
        editableAnswers[questionIdx].answer?.description);
  }

  Map<String, dynamic> get queryParams {
    return {"exam_id": exam!.id, "student_id": exam!.student_id};
  }

  onDispose() async {
    countdownTimer?.cancel();
    pageController.dispose();
    await _sharedPrefsService.clearSingleStExamNavArg();
    for (final e in editableAnswers) {
      e.dispose();
    }
  }

  bool get examIsActive => data?.session?.status == "Ongoing";
}

class StudentAnswerEditModel {
  StudentAnswerModel? answer;
  TextEditingController descTxtCtrl;

  StudentAnswerEditModel({
    StudentAnswerModel? answer,
  }) : descTxtCtrl = TextEditingController() {
    this.answer = answer ?? this.answer;
  }

  void dispose() {
    descTxtCtrl.dispose();
  }
}
