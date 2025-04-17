import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/ui/widgets/common/lesson_time.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String trClassesFetchKey = 'trClassesFetchKey';
const String trExamsFetchKey = 'trExamsFetchKey';

class TeacherClassesViewModel extends FutureViewModel<List<ClassroomModel>> {
  final _navigationService = locator<NavigationService>();

  @override
  Future<List<ClassroomModel>> futureToRun() async {
    var classroomListRes = await onApiGetCall<ClassroomModel>(
      getEndpoint: endPointGetTeacherClassrooms,
    );

    if (apiCallChecks(classroomListRes, 'classroom listing')) {
      return classroomListRes.$1?.listData ?? [];
    }
    return [];
  }

  List<ClassLessonTime> get getLessonTimes {
    return (data ?? [])
        .where((c) => c.lessons_today?.isNotEmpty ?? false)
        .expand((classroom) => classroom.lessons_today!.map(
              (lesson) => ClassLessonTime(
                className: classroom.name ?? "--",
                lessonTime: lesson,
              ),
            ))
        .toList()
      ..sort((a, b) => a.lessonTime.compareTo(b.lessonTime));
  }

  List<String> get classNames {
    return (data ?? []).map((e) => e.name ?? "--").toList();
  }

  List<double> get classTermScores {
    return (data ?? []).map((e) => e.avg_term_score ?? 0.0).toList();
  }

  List<double> get classMtihaniScores {
    return (data ?? []).map((e) => e.avg_mtihani_score ?? 0.0).toList();
  }

  onAddClass() {
    final trOnboardService = locator<TeacherOnboardingService>();
    trOnboardService.onSetIsFromOnboarding(false);
    _navigationService.navigateToClassFormView();
  }

  onViewClass(ClassroomModel classroom) {
    _navigationService.navigateToSingleClassView(classroom: classroom);
  }
}
