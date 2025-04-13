# API TODO

## UPDATE PROFILE
- String endPointEditProfile = '$baseURL/edit-profile';
- IsTokenBased - Teacher or Student
- Body:
```dart
dataMap: {
    "first_name": firstNameValue,
    "last_name": lastNameValue,
    "email": emailValue,
    "phone_no": phoneNoValue,
    },
```

## CHANGE PASSWORD
- String endPointChangePassword = '$baseURL/change-password';
- IsTokenBased - Teacher or Student
- Body:
```dart
dataMap: {
    "current_password": currentPasswordValue,
    "new_password": newPasswordValue,
    },
```


## GET CLASS CURRICULUM
- String endPointGetClassCurriculum = '$baseURL/class-curriculum';
- IsTokenBased - Teacher
- QueryParams: **class_id**
- Return: Full list of strands [GradeModel](../models/grade.dart) up to given class.grade level

## GET CLASS STRAND SCORES
- String endPointGetClassStrandScores = '$baseURL/class-strand-scores';
- IsTokenBased - Teacher
- QueryParams: **class_id**
- Return: List of strand scores if available [ClassStrandScore](../models/class_strand_score.dart)


## POST EXAM
- String endPointSetExam = '$baseURL/set-exam';
- IsTokenBased - Teacher
- Body:
```dart
Map<String, dynamic> examBody = {
    "class_id": currentClass.id,
    "selected_strand_ids": selectedStrandsIds,
    "selected_times": selectedTimes
        .map((e) => getFormattedDate(e, DateFormat('dd/MM/yyyy HH:mm')))
        .toList(),
};
if (selectedFiles.isNotEmpty) {
    examBody["selected_files"] = selectedFiles;
}
``` 

## GET USER EXAMS
- String endPointGetUserExams = '$baseURL/user-exams';
- IsTokenBased - Teacher or Student
- QueryParams: **start_date, end_date, class_id, exam_status**
- Return: Paginated user exam list of [ExamModel](../models/exam.dart)

## POST EDIT EXAM
- String endPointGetEditExam = '$baseURL/edit-exam';
- IsTokenBased - Teacher
- Body:
```dart
dataMap: {
    "selected_times": editedDateTimes
        .map((e) => getFormattedDate(e, apiDateTimeFormat))
        .toList(),
},
```
- Returns the updated [ExamModel](../models/exam.dart)