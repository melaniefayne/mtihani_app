import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/widgets/common/exam_list_secton/exam_list_section.dart';
import 'package:stacked/stacked.dart';

class ExamPerformanceWidgetModel extends BaseViewModel {
  //
  final ExamModel? examItem;
  bool isExamView = false;
  bool showWaitingWidget = false;
  List<ExamStatus> allowedStatus = [ExamStatus.complete];
  ExamStatus examStatus = getExamEnumStatus("");
  //
  final ClassModel? classItem;
  bool isClassView = false;

  ExamPerformanceWidgetModel(this.examItem, this.classItem);

  onExamPerformanceWidgetReady() {
    if (examItem != null) {
      isExamView = true;
      isClassView = false;
      examStatus = getExamEnumStatus(examItem!.status);
      showWaitingWidget = allowedStatus.contains(examStatus);
      return;
    }

    if (classItem != null) {
      isClassView = true;
      isExamView = false;
      return;
    }
  }
}
