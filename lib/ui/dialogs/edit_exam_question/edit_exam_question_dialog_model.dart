import 'package:mtihani_app/models/exam.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditExamQuestionDialogModel extends BaseViewModel {
  String? selectedQuestion;

  onOptionChanged(String? val) {
    if (val == null) return;
    selectedQuestion = val;
    rebuildUi();
  }

  onOptionSelection(Function(DialogResponse<dynamic>)? completer,
      ExamQuestionModel examQuestion) {
    Map<String, dynamic>? updateRes;
    if (selectedQuestion != null &&
        selectedQuestion != examQuestion.description) {
      int selectedIdx =
          examQuestion.question_options!.indexOf(selectedQuestion!);
      updateRes = {
        "id": examQuestion.id,
        "bloom_skill": examQuestion.bloom_skill_options![selectedIdx],
        "description": examQuestion.question_options![selectedIdx],
        "expected_answer": examQuestion.answer_options![selectedIdx],
      };
    }

    if (completer != null) {
      completer(DialogResponse(data: updateRes));
    }
  }
}
