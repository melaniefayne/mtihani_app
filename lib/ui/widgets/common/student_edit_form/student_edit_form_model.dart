import 'package:flutter/material.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/ui/widgets/common/student_edit_form/student_edit_form.form.dart';
import 'package:stacked/stacked.dart';

class StudentEditFormModel extends BaseViewModel with FormStateHelper {
  final StudentModel student;
  List<TermScoreEditModel> editableTermScores = [];
  Function(Map<String, dynamic> updateBody) onApiUpdateStudent;

  StudentEditFormModel(this.student, this.onApiUpdateStudent);

  onStudentFormViewReady() {
    editableTermScores = buildEditableTermScores(student.term_scores ?? []);
    studentNameValue = student.name;
    rebuildUi();
  }

  List<TermScoreEditModel> buildEditableTermScores(
      List<TermScore> existingScores) {
    return List.generate(9, (index) {
      int grade = 7 + (index ~/ 3);
      int term = 1 + (index % 3);

      // Find matching TermScore
      TermScore? match = existingScores.firstWhere(
        (ts) => ts.grade == grade && ts.term == term,
        orElse: () => TermScore(grade: grade, term: term),
      );

      final model = TermScoreEditModel(termScore: match);
      if (match.score != null) {
        model.termScore = match;
        model.scoreTxtCtrl.text = match.score!.toString();
      }

      return model;
    });
  }

  onUpdateStudent() async {
    validateForm();
    if (!isFormValid) {
      rebuildUi();
      return;
    }

    final List<TermScore> validScores = editableTermScores
        .where((edit) => edit.scoreTxtCtrl.text.trim().isNotEmpty)
        .map((edit) {
          final score = double.tryParse(edit.scoreTxtCtrl.text.trim());
          if (score == null) return null;

          return TermScore(
            id: edit.termScore!.id,
            grade: edit.termScore!.grade!,
            term: edit.termScore!.term!,
            score: score,
          );
        })
        .whereType<TermScore>()
        .toList();

    Map<String, dynamic> studentBody = {
      "name": studentNameValue,
      "updated_term_scores": validScores.map((e) => e.toJson()).toList(),
    };
    onApiUpdateStudent(studentBody);
  }
}

class TermScoreEditModel {
  TermScore? termScore;
  TextEditingController scoreTxtCtrl;

  TermScoreEditModel({
    TermScore? termScore,
  }) : scoreTxtCtrl = TextEditingController() {
    this.termScore = termScore ?? this.termScore;
  }

  void dispose() {
    scoreTxtCtrl.dispose();
  }
}

List<TermScoreEditModel> allGradeTerms = [
  TermScoreEditModel(
    termScore: TermScore(grade: 7, term: 1),
  ),
  TermScoreEditModel(
    termScore: TermScore(grade: 7, term: 2),
  ),
  TermScoreEditModel(
    termScore: TermScore(grade: 7, term: 3),
  ),
  TermScoreEditModel(
    termScore: TermScore(grade: 8, term: 1),
  ),
  TermScoreEditModel(
    termScore: TermScore(grade: 8, term: 2),
  ),
  TermScoreEditModel(
    termScore: TermScore(grade: 8, term: 3),
  ),
  TermScoreEditModel(
    termScore: TermScore(grade: 9, term: 1),
  ),
  TermScoreEditModel(
    termScore: TermScore(grade: 9, term: 2),
  ),
  TermScoreEditModel(
    termScore: TermScore(grade: 9, term: 3),
  ),
];
