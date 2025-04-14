import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/ui/widgets/model_widgets/lesson_time.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String trClassesFetchKey = 'trClassesFetchKey';
const String trExamsFetchKey = 'trExamsFetchKey';

class TeacherHomeViewModel extends MultipleFutureViewModel {
  final _navigationService = locator<NavigationService>();
  List<ClassModel> get fetchedTrClasses => dataMap?[trClassesFetchKey] ?? [];
  List<ExamModel> get fetchedTrExams => dataMap?[trExamsFetchKey] ?? [];
  bool get isFetchingTrClasses => busy(trClassesFetchKey);
  bool get isFetchingTrExams => busy(trExamsFetchKey);

  @override
  Map<String, Future Function()> get futuresMap => {
        trClassesFetchKey: fetchTrClasses,
        trExamsFetchKey: fetchTrExams,
      };

  Future<List<ClassModel>> fetchTrClasses() async {
    var classApiRes = await onApiGetCall<ClassModel>(
      getEndpoint: endPointGetUseClasses,
    );
    if (apiCallChecks(classApiRes, 'class listing',
        showSuccessMessage: false)) {
      return classApiRes.$1?.listData ?? [];
    }

    return [dummyClass, dummyClassTwo];
  }

  Future<List<ExamModel>> fetchTrExams() async {
    var examApiRes = await onApiGetCall<ExamModel>(
      getEndpoint: endPointGetUserExams,
      queryParams: {"page_size": 3},
    );
    if (apiCallChecks(examApiRes, 'exam listing', showSuccessMessage: false)) {
      return examApiRes.$1?.listData ?? [];
    }

    return [dummyExam];
  }

  List<ClassLessonTime> get getLessonTimes {
    return fetchedTrClasses
        .where((c) => c.lessons_today?.isNotEmpty ?? false)
        .expand((classItem) => classItem.lessons_today!.map(
              (lesson) => ClassLessonTime(
                className: classItem.name ?? "--",
                lessonTime: lesson,
              ),
            ))
        .toList()
      ..sort((a, b) => a.lessonTime.compareTo(b.lessonTime));
  }

  onAddClass() {
    final trOnboardService = locator<TeacherOnboardingService>();
    trOnboardService.onSetIsFromOnboarding(false);
    _navigationService.navigateToClassFormView();
  }

  onViewClass(ClassModel classItem) {
    _navigationService.navigateToSingleClassView(classItem: classItem);
  }

  onViewExam(ExamModel examItem) async {
    await _navigationService.navigateToSingleExamView(examItem: examItem);
    initialise();
  }
}
