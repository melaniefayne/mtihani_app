import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String cbcFetchKey = 'cbcFetchKey';
const String classStrandScoresFetchKey = 'classStrandScoresFetchKey';

class SingleClassViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final ClassModel classItem;

  SingleClassViewModel(this.classItem);

  onViewExam(ExamModel exam) async {
    await _navigationService.navigateToSingleExamView(examItem: exam);
  }

  onEditClass() {}
}
