import 'dart:async';

import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/models/performance.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/ui/dialogs/exam_question_perf/exam_question_perf_dialog.form.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ExamQuestionPerfDialogModel
    extends FutureViewModel<ExamQuestionPerformanceModel?>
    with FormStateHelper {
  ExamQuestionModel? examQuestion;
  final Completer<void> _questionLoaded = Completer<void>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _sharedPrefsService = locator<SharedPrefsService>();
  ScoreModel? selectedExpectationLevel;
  bool isLoadingAnswers = false;
  List<ExamModel> questionAnswers = [];

  ExamQuestionPerfDialogModel();

  onExamQuePerfViewReady() async {
    examQuestion = await _sharedPrefsService.getSingleExamQuestionNavArg();

    if (examQuestion?.id == null) {
      _navigationService.back();
      return;
    }

    _questionLoaded.complete();
  }

  @override
  Future<ExamQuestionPerformanceModel?> futureToRun() async {
    await _questionLoaded.future; // wait until question is loaded

    var examQuePerfRes = await onApiGetCall<ExamQuestionPerformanceModel>(
      getEndpoint: endPointGetExamQuestionPerformance,
      queryParams: {'question_id': examQuestion!.id!},
      dataFromJson: ExamQuestionPerformanceModel.fromJson,
    );

    if (apiCallChecks(examQuePerfRes, 'exam question performance')) {
      ExamQuestionPerformanceModel? quePerf = examQuePerfRes.$1?.data;
      selectedExpectationLevel = (quePerf?.answers_by_level ?? []).isNotEmpty
          ? quePerf!.answers_by_level!.first
          : null;
      await fetchStudentAnswers();
      return quePerf;
    }

    return null;
  }

  List<double> get scoreDistCounts {
    return data?.score_distribution
            ?.map((e) => e.count?.toDouble() ?? 0.0)
            .toList() ??
        [];
  }

  List<String> get scoreDistNames {
    return data?.score_distribution
            ?.map((e) => e.name?.toString() ?? '--')
            .toList() ??
        [];
  }

  fetchStudentAnswers() async {
    if (selectedExpectationLevel != null) {
      isLoadingAnswers = true;
      rebuildUi();

      Map<String, dynamic> queryParams = {
        'answer_ids': selectedExpectationLevel!.ids ?? []
      };
      if (!isStringEmptyOrNull(studentSearchValue)) {
        queryParams['student_name'] = studentSearchValue;
        queryParams['expectation_level'] = selectedExpectationLevel!.name;
      }

      var examQueAnswersRes = await onApiGetCall<ExamModel>(
        getEndpoint: endPointGetStudentExamAnswers,
        queryParams: queryParams,
        listDataFromJson: ExamModel.fromJson,
      );

      if (apiCallChecks(examQueAnswersRes, 'question answers')) {
        questionAnswers = examQueAnswersRes.$1?.listData ?? [];
      }

      isLoadingAnswers = false;
      rebuildUi();
    }
  }

  onChangeExpectationLevel(ScoreModel expectScore) async {
    selectedExpectationLevel = expectScore;
    await fetchStudentAnswers();
  }

  Timer? searchDebounce;
  onStudentSearchNameChanged(String? val) async {
    if (searchDebounce?.isActive ?? false) searchDebounce!.cancel();
    searchDebounce = Timer(const Duration(seconds: 1), () async {
      await fetchStudentAnswers();
    });
  }

  onViewStudentExamSession(ExamModel studentExam) async {
    bool canNavigate =
        await _sharedPrefsService.setSingleStExamNavArg(studentExam);
    if (canNavigate) {
      _dialogService.completeDialog(DialogResponse(confirmed: true));
      await Future.delayed(const Duration(milliseconds: 100));
      _navigationService.navigateToSingleStExamView();
    }
  }

  onDispose() async {
    await _sharedPrefsService.clearSingleExamQuestionNavArg();
  }
}
