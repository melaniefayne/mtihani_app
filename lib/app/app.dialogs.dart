// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/app_action/app_action_dialog.dart';
import '../ui/dialogs/class_selector/class_selector_dialog.dart';
import '../ui/dialogs/edit_answer_score/edit_answer_score_dialog.dart';
import '../ui/dialogs/edit_exam_question/edit_exam_question_dialog.dart';
import '../ui/dialogs/edit_exam_time/edit_exam_time_dialog.dart';
import '../ui/dialogs/exam_question_perf/exam_question_perf_dialog.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/join_class/join_class_dialog.dart';
import '../ui/dialogs/role_signup/role_signup_dialog.dart';
import '../ui/dialogs/start_exam/start_exam_dialog.dart';
import '../ui/dialogs/upload_tr_doc/upload_tr_doc_dialog.dart';

enum DialogType {
  infoAlert,
  roleSignup,
  appAction,
  classSelector,
  joinClass,
  editExamTime,
  editExamQuestion,
  startExam,
  editAnswerScore,
  examQuestionPerf,
  uploadTrDoc,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.roleSignup: (context, request, completer) =>
        RoleSignupDialog(request: request, completer: completer),
    DialogType.appAction: (context, request, completer) =>
        AppActionDialog(request: request, completer: completer),
    DialogType.classSelector: (context, request, completer) =>
        ClassSelectorDialog(request: request, completer: completer),
    DialogType.joinClass: (context, request, completer) =>
        JoinClassDialog(request: request, completer: completer),
    DialogType.editExamTime: (context, request, completer) =>
        EditExamTimeDialog(request: request, completer: completer),
    DialogType.editExamQuestion: (context, request, completer) =>
        EditExamQuestionDialog(request: request, completer: completer),
    DialogType.startExam: (context, request, completer) =>
        StartExamDialog(request: request, completer: completer),
    DialogType.editAnswerScore: (context, request, completer) =>
        EditAnswerScoreDialog(request: request, completer: completer),
    DialogType.examQuestionPerf: (context, request, completer) =>
        ExamQuestionPerfDialog(request: request, completer: completer),
    DialogType.uploadTrDoc: (context, request, completer) =>
        UploadTrDocDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
