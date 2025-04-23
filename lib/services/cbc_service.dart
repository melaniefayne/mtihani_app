import 'package:mtihani_app/models/cbc.dart';
import 'package:mtihani_app/data/cbc_data.dart';

class CbcService {
  late final List<GradeModel> _grades;

  CbcService() {
    _grades = cbcDummyData
        .map((gradeJson) => GradeModel.fromJson(gradeJson))
        .toList();
  }

  /// Get GradeModels for the given grade and all grades before it
  List<GradeModel> getGradesUpTo(int grade) {
    return _grades
        .where((g) => g.grade != null)
        .where((g) => g.grade! <= grade)
        .toList()
      ..sort((a, b) => a.grade!.compareTo(b.grade!));
  }

  List<GradeModel> getSingleGrade(int grade) {
    return _grades
        .where((g) => g.grade != null)
        .where((g) => g.grade! == grade)
        .toList();
  }

  /// Get GradeModel by grade string (e.g. "7")
  GradeModel? getGrade(int grade) {
    return _grades.firstWhere(
      (g) => g.grade == grade,
      orElse: () => GradeModel(grade: grade, strands: []),
    );
  }

  /// Returns all strands for a given grade
  List<StrandModel> getAllStrandsForGrade(int grade) {
    final gradeModel = getGrade(grade);
    return gradeModel?.strands ?? [];
  }
}
