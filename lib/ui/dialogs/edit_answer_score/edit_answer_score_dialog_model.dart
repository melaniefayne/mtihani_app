import 'package:mtihani_app/models/exam.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditAnswerScoreDialogModel extends BaseViewModel {
  double? score;
  double maxScore = 4;
  double minScore = 0;

  onAddScore() {
    if (score != maxScore) {
      score = (score ?? 0) + 1.0;
      rebuildUi();
    }
  }

  onReduceScore() {
    if (score != minScore) {
      score = (score ?? 1) - 1.0;
      rebuildUi();
    }
  }

  onUpdatedScore(Function(DialogResponse<dynamic>)? completer,
      StudentAnswerModel studentAnswer) {
    if (completer != null) {
      completer(DialogResponse(data: score));
    }
  }
}
