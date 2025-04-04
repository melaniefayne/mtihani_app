import 'package:intl/intl.dart';

const List<String> appSubjectList = ['Integrated Science'];
const List<int> appGradeLevels = [7, 8, 9];
const List<int> appAcademicTerms = [1, 2, 3];
DateFormat appClassDateFormat = DateFormat('EEEE hh:mm a');
const List<String> appClassDays = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
];

List<Map<String, String>> getApiLessonTimes(List<DateTime> classTimes) {
  return classTimes
      .map((e) => {
            "day": DateFormat('EEEE').format(e),
            "time": DateFormat('HH:mm').format(e),
          })
      .toList();
}

const classCsvHeaders = [
  'StudentName',
  'Grade7Term1Score',
  'Grade7Term2Score',
  'Grade7Term3Score',
  'Grade8Term1Score',
  'Grade8Term2Score',
  'Grade8Term3Score',
  'Grade9Term1Score',
  'Grade9Term2Score',
  'Grade9Term3Score',
];

class StudentScores {
  final String name;
  final List<TermScore> scores;

  StudentScores({
    required this.name,
    required this.scores,
  });
  Map<String, dynamic> toJson() => {
        'name': name,
        'scores': scores.map((s) => s.toJson()).toList(),
      };
}

class TermScore {
  final int grade;
  final int term;
  final double score;

  TermScore({
    required this.grade,
    required this.term,
    required this.score,
  });

  Map<String, dynamic> toJson() => {
        'grade': grade,
        'term': term,
        'score': score,
      };
}
