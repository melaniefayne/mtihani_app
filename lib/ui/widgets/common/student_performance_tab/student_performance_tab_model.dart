import 'package:mtihani_app/models/classroom.dart';
import 'package:stacked/stacked.dart';

class StudentPerformanceTabModel extends BaseViewModel {
  final ClassroomStudentModel student;

  StudentPerformanceTabModel(this.student);

  List<double> get termScores {
    return (student.term_scores ?? []).map((e) => e.score ?? 0.0).toList();
  }

  List<String> get termNames {
    return (student.term_scores ?? [])
        .map((e) => "G${e.grade ?? '--'} T${e.term ?? '--'}")
        .toList();
  }
}
