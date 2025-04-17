import 'package:mtihani_app/app/app.dialogs.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/ui/widgets/common/lesson_time.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StudentClassesViewModel extends FutureViewModel<List<StudentClassModel>> {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  @override
  Future<List<StudentClassModel>> futureToRun() async {
    var classroomListRes = await onApiGetCall<StudentClassModel>(
      getEndpoint: endPointGetStudentClassrooms,
    );

    if (apiCallChecks(classroomListRes, 'classroom listing')) {
      return classroomListRes.$1?.listData ?? [];
    }
    return [];
  }

  List<ClassLessonTime> get getLessonTimes {
    return ((data ?? [])
            .map((studentClassroom) => studentClassroom.classroom)
            .toList())
        .where((c) => c?.lessons_today?.isNotEmpty ?? false)
        .expand((classroom) => classroom!.lessons_today!.map(
              (lesson) => ClassLessonTime(
                className: classroom.name ?? "--",
                lessonTime: lesson,
              ),
            ))
        .toList()
      ..sort((a, b) => a.lessonTime.compareTo(b.lessonTime));
  }

  List<String> get classNames {
    return (data ?? []).map((e) => e.classroom?.name ?? "--").toList();
  }

  List<double> get classTermScores {
    return (data ?? []).map((e) => e.avg_term_score ?? 0.0).toList();
  }

  List<double> get classMtihaniScores {
    return (data ?? []).map((e) => e.avg_mtihani_score ?? 0.0).toList();
  }

  onJoinClass() async {
    var dialogRes = await _dialogService.showCustomDialog(
      variant: DialogType.joinClass,
    );
    bool? isSuccessfulJoin = dialogRes?.data;
    if (isSuccessfulJoin == true) {
      initialise();
    }
  }

  onViewClass(StudentClassModel studentClassroom) {
    _navigationService.navigateToSingleStClassView(
        studentClassroom: studentClassroom);
  }
}
