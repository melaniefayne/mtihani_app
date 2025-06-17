import 'dart:typed_data';

import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/models/performance.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';
import 'package:stacked/stacked.dart';

class SingleClusterTabModel
    extends FutureViewModel<ClassExamPerfClusterModel?> {
  final StudentExamSessionModel examSession;
  bool isLoadingQuiz = false;
  SingleClusterTabModel(this.examSession);

  @override
  Future<ClassExamPerfClusterModel?> futureToRun() async {
    var clusterApiRes = await onApiGetCall<ClassExamPerfClusterModel>(
      getEndpoint: endPointGetStudentExamCluster,
      queryParams: {"student_session_id": examSession.id},
      dataFromJson: ClassExamPerfClusterModel.fromJson,
    );

    if (apiCallChecks(clusterApiRes, 'performance clusters listing')) {
      return clusterApiRes.$1?.data;
    }

    return null;
  }

  onDownloadClusterQuiz() async {
    if (data != null) {
      isLoadingQuiz = true;
      rebuildUi();

      var clusterPdfApiRes = await onApiGetDocCall(
        docFetchEndpoint: endPointDownloadClusterPdf,
        queryParams: {"cluster_id": data!.id},
      );
      if (apiCallChecks(clusterPdfApiRes, 'cluster follow up quiz')) {
        Uint8List? followUpQuizFile = clusterPdfApiRes.$1?.data;
        if (followUpQuizFile != null) {
          String fileName = "CLUSTER_${data!.cluster_label}_FOLLOW_UP_QUIZ";

          downloadBytesAsFile(followUpQuizFile, fileName);
        }
      }
    }
  }
}
