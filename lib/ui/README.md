# API TODO

## Auth

### UPDATE PROFILE
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
- Returns the updated [UserModel](../models/user.dart)

### CHANGE PASSWORD
- String endPointChangePassword = '$baseURL/change-password';
- IsTokenBased - Teacher or Student
- Body:
```dart
dataMap: {
    "current_password": currentPasswordValue,
    "new_password": newPasswordValue,
    },
```

## Teacher Onboarding

### POST CLASS
- String endPointCreateClass = '$baseURL/create-class';
- IsTokenBased - Teacher
- Body:
```dart
    Map<String, dynamic> classBody = {
      "name": classNameValue,
      "school_name": schoolNameValue,
      "school_address": schoolAddressValue,
      "grade": selectedGrade,
      "lesson_times": getApiLessonTimes(selectedLessonTimes),
      "students": uploadedStudents.map((e) => e.toJson()).toList(),
    };
```
- Returns the created [UserModel](../models/user.dart) with classes arranged from newest to oldest

### GET CLASS CURRICULUM
- String endPointGetClassCurriculum = '$baseURL/class-curriculum';
- IsTokenBased - Teacher
- QueryParams: **class_id**
- Return: Full list of strands [GradeModel](../models/grade.dart) up to given class.grade level

### GET CLASS STRAND SCORES
- String endPointGetClassStrandScores = '$baseURL/class-strand-scores';
- IsTokenBased - Teacher
- QueryParams: **class_id**
- Return: List of strand scores if available [ClassStrandScore](../models/class_strand_score.dart)


### POST EXAM
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

## Teacher Dashboard

### GET USER EXAMS
String endPointGetUseClasses = '$baseURL/user-classes';
- IsTokenBased - Teacher
- Return: Full list of [ClassModel](../models/class.dart)


### GET USER EXAMS
- String endPointGetUserExams = '$baseURL/user-exams';
- IsTokenBased - Teacher or Student
- QueryParams: **start_date, end_date, class_id, exam_status, page_size**
- Return: Paginated user exam list of [ExamModel](../models/exam.dart)

### UPDATE EXAM
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