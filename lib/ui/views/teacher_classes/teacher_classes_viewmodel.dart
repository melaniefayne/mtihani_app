import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/ui/widgets/common/classroom_widgets.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TeacherClassesViewModel extends FutureViewModel<List<ClassroomModel>> {
  final trOnboardService = locator<TeacherOnboardingService>();
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

  List<ClassLessonTime> get classLessonTimes {
    return (data ?? [])
        .expand((classroom) => (classroom.lessons_times ?? []).map(
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
    trOnboardService.onSetIsFromOnboarding(false);
    _navigationService.navigateToClassFormView();
  }

  onViewClass(ClassroomModel classroom) {
    _navigationService.navigateToSingleTrClassView(classroom: classroom);
  }
}
