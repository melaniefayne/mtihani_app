import 'package:mtihani_app/models/classroom.dart';
import 'package:stacked/stacked.dart';

class ClassPerformanceTabModel extends FutureViewModel<ClassPerformanceModel> {
  final ClassroomModel classroom;

  ClassPerformanceTabModel(this.classroom);

  @override
  Future<ClassPerformanceModel> futureToRun() async {
    return ClassPerformanceModel();
  }

  List<double> get classTermScores {
    if (data == null) return [];
    return (data!.class_term_scores ?? []).map((e) => e.score ?? 0.0).toList();
  }

  List<String> get classTermNames {
    if (data == null) return [];
    return (data!.class_term_scores ?? [])
        .map((e) => "Grade ${e.grade ?? '--'} Term ${e.term ?? '--'}")
        .toList();
  }
}
