import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';

const String termScoresFetch = 'termScoresFetch';

class ClassPerformanceTabModel extends MultipleFutureViewModel {
  final ClassroomModel classroom;

  ClassPerformanceTabModel(this.classroom);

  List<TermScore> get classAvgTermScores => dataMap?[termScoresFetch] ?? [];

  bool get isFetchingTermScores => busy(termScoresFetch);

  @override
  Map<String, Future Function()> get futuresMap => {
        termScoresFetch: fetchClassTermScores,
      };

  Future<List<TermScore>> fetchClassTermScores() async {
    var classroomTermScoresRes = await onApiGetCall<TermScore>(
      getEndpoint: endPointGetClassroomTermScores,
      listDataFromJson: TermScore.fromJson,
      queryParams: {'classroom_id': classroom.id},
      dataField: "term_scores",
    );
    if (apiCallChecks(classroomTermScoresRes, 'classroom term scores')) {
      List<TermScore> classTermScores =
          classroomTermScoresRes.$1?.listData ?? [];
      return classTermScores;
    }
    return [];
  }

  List<double> get classTermScores {
    return (classAvgTermScores).map((e) => e.score ?? 0.0).toList();
  }

  List<String> get classTermNames {
    return (classAvgTermScores)
        .map((e) => "Grade ${e.grade ?? '--'} Term ${e.term ?? '--'}")
        .toList();
  }
}
