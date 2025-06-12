import 'package:flutter/services.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/models/performance.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ClassExamClustersTabModel
    extends FutureViewModel<List<ClassExamPerfClusterModel>> {
  final ExamModel exam;
  bool isLoadingQuiz = false;
  ClassExamPerfClusterModel? selectedCluster;
  ScoreModel? selectedStrand;
  final _navigationService = locator<NavigationService>();
  final _sharedPrefsService = locator<SharedPrefsService>();

  ClassExamClustersTabModel(this.exam);

  @override
  Future<List<ClassExamPerfClusterModel>> futureToRun() async {
    var clustersApiRes = await onApiGetCall<ClassExamPerfClusterModel>(
      getEndpoint: endPointGetClassExamClusters,
      queryParams: {"exam_id": exam.id},
      listDataFromJson: ClassExamPerfClusterModel.fromJson,
    );

    if (apiCallChecks(clustersApiRes, 'performance clusters listing')) {
      List<ClassExamPerfClusterModel> clusters =
          (clustersApiRes.$1?.listData ?? []);
      clusters
          .sort((a, b) => (b.cluster_size ?? 0).compareTo(a.cluster_size ?? 0));
      if (clusters.isNotEmpty) {
        selectedCluster = clusters.first;
        selectedStrand = selectedCluster?.strand_scores?.firstOrNull;
      }
      return clusters;
    }

    return [];
  }

  onChangeSelectedCluster(ClassExamPerfClusterModel cluster) {
    selectedCluster = cluster;
    rebuildUi();
  }

  onStrandTap(String strandName) {
    selectedStrand = (selectedCluster?.strand_scores ?? [])
        .firstWhere((e) => e.name == strandName);
    rebuildUi();
  }

  onClusterViewExamSession(Map<String, String> item) async {
    ExamModel studentExam = (selectedCluster?.student_sessions ?? [])
        .firstWhere((e) => e.student_name == item['name']);
    studentExam = studentExam.copyWith(
      id: studentExam.exam_id,
      status: ExamStatus.complete,
    );

    bool canNavigate =
        await _sharedPrefsService.setSingleStExamNavArg(studentExam);
    if (canNavigate) {
      _navigationService.navigateToSingleStExamView();
    }
  }

  onDownloadClusterQuiz() async {
    var clusterPdfApiRes = await onApiGetDocCall(
      docFetchEndpoint: endPointDownloadClusterPdf,
      queryParams: {
        "cluster_id": selectedCluster!.id,
      },
    );
    Uint8List? file = clusterPdfApiRes.$1?.data;
    String fileName =
        "CLUSTER_${selectedCluster!.cluster_label}_FOLLOW_UP_QUIZ";
    if (file != null) {
      downloadBytesAsFile(file, fileName);
    }
  }
}
