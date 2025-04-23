import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/models/cbc.dart';
import 'package:mtihani_app/services/cbc_service.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';

class CbcViewModel extends BaseViewModel {
  final _cbcService = locator<CbcService>();
  List<StrandModel> gradeStrandsList = [];
  int selectedGrade = allGradesList.first;

  filterCurriculum() {
    gradeStrandsList = _cbcService.getAllStrandsForGrade(selectedGrade);
    rebuildUi();
  }

  // ===== FILTERS
  onChangeGrade(int grade) {
    selectedGrade = grade;
    filterCurriculum();
  }
}
