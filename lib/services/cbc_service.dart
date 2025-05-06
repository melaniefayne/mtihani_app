import 'package:mtihani_app/models/cbc.dart';
import 'package:mtihani_app/data/cbc_data.dart';

class CbcService {
  late final List<GradeModel> _grades;

  CbcService() {
    _grades = cbcDummyData
        .map((gradeJson) => GradeModel.fromJson(gradeJson))
        .toList();
  }

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

  GradeModel? getGrade(int grade) {
    return _grades.firstWhere(
      (g) => g.grade == grade,
      orElse: () => GradeModel(grade: grade, strands: []),
    );
  }

  List<StrandModel> getAllStrandsForGrade(int? grade) {
    if (grade == null) return getAllStrands();

    final gradeModel = getGrade(grade);
    return gradeModel?.strands ?? [];
  }

  List<StrandModel> getAllStrands() {
    return _grades.map((e) => e.strands ?? []).expand((s) => s).toList();
  }

  StrandModel? getStrand(int strandId) {
    for (final grade in _grades) {
      for (final strand in grade.strands ?? []) {
        if (strand.id == strandId) {
          return strand;
        }
      }
    }
    return null;
  }

  StrandModel? getStrandByName(String strandName) {
    for (final grade in _grades) {
      for (final strand in grade.strands ?? []) {
        if (strand.name == strandName) {
          return strand;
        }
      }
    }
    return null;
  }

  List<SubStrandModel> getAllSubStrandsForStrand(int? strandId) {
    if (strandId == null) return getAllSubStrands();

    final strand = getStrand(strandId);
    return strand?.sub_strands ?? [];
  }

  List<SubStrandModel> getAllSubStrands() {
    return _grades
        .map((g) => g.strands ?? [])
        .expand((s) => s)
        .map((s) => s.sub_strands ?? [])
        .expand((ss) => ss)
        .toList();
  }
}
