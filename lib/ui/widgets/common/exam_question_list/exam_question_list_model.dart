import 'package:mtihani_app/models/exam.dart';
import 'package:stacked/stacked.dart';

class ExamQuestionListModel
    extends FutureViewModel<List<ExamQuestionListModel>> {
  ExamModel exam;
  ExamQuestionListModel(this.exam);
  @override
  Future<List<ExamQuestionListModel>> futureToRun() async {
    return [];
  }
}
