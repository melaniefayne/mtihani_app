import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/models/performance.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';

class StudentExamPerfTabModel
    extends FutureViewModel<StudentExamSessionPerformanceModel?> {
  final StudentExamSessionModel examSession;
  StudentExamPerfTabModel(this.examSession);

  @override
  Future<StudentExamSessionPerformanceModel?> futureToRun() async {
    var studentPerfApiRes =
        await onApiGetCall<StudentExamSessionPerformanceModel>(
      getEndpoint: endPointGetStudentExamPerformance,
      queryParams: {"student_session_id": examSession.id},
      dataFromJson: StudentExamSessionPerformanceModel.fromJson,
    );

    if (apiCallChecks(studentPerfApiRes, 'student performance')) {
      return studentPerfApiRes.$1?.data;
    }

    return null;
  }
}
