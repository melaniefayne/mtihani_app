import 'package:mtihani_app/app/app.dialogs.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/services/auth_service.dart';
import 'package:mtihani_app/ui/widgets/common/classroom_widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StudentClassesViewModel extends FutureViewModel<List<ClassroomModel>> {
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  @override
  Future<List<ClassroomModel>> futureToRun() async {
    return _authService.loggedInUserClassrooms;
  }

  List<ClassLessonTime> get classLessonTimes {
    return (data ?? [])
        .where((c) => c.lessons_times?.isNotEmpty ?? false)
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

  onJoinClass() async {
    var dialogRes = await _dialogService.showCustomDialog(
      variant: DialogType.joinClass,
    );
    bool? isSuccessfulJoin = dialogRes?.data;
    if (isSuccessfulJoin == true) {
      initialise();
    }
  }

  onViewClass(ClassroomModel classroom) {
    _navigationService.navigateToSingleStClassView(classroom: classroom);
  }
}
