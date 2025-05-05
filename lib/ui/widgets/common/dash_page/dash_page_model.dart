import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:stacked/stacked.dart';

abstract class DashPageModel<T> extends FutureViewModel<T> {
  List<ClassroomModel> userClassrooms;
  UserModel loggedInUser;

  DashPageModel(this.userClassrooms, this.loggedInUser);
}
