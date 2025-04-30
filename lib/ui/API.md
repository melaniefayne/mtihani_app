# API TODO

## 1. LOGIN
- String endPointLoginUser = '$baseURL/login';
- Body:
```dart
{ "email": emailValue, "password": passwordValue}
```
- Returns a mapData of the loggedInUser:
```json
{
    "user": "[UserModel](../models/user.dart)",
    "token": "tokenStr"
}
```
[UserModel](../models/user.dart)


## 2. SIGN UP STUDENT
- String endPointRegisterUser = '$baseURL/student-register';
- Body:
```dart
Map<String, dynamic> studentBody = {
    "first_name": firstNameValue,
    "last_name": lastNameValue,
    "email": studentEmailValue,
    "student_code": studentCodeValue,
    "password": studentPasswordValue,
    "role": appStudentRoleKw,
};
```
- Returns a mapData of the registeredUSer:
```json
{
    "user": "[UserModel](../models/user.dart)",
    "token": "tokenStr"
}
```
[UserModel](../models/user.dart)


## 3. SIGN UP TEACHER
- String endPointRegisterUser = '$baseURL/teacher-register';
- Body:
```dart
Map<String, dynamic> teacherBody = {
    "first_name": firstNameValue,
    "last_name": lastNameValue,
    "email": teacherEmailValue,
    "phone_no": phoneNoValue,
    "password": teacherPasswordValue,
    "role": appTeacherRoleKw,
};
```
- Returns a mapData of the registeredUSer:
```json
{
    "user": "[UserModel](../models/user.dart)",
    "token": "tokenStr"
}
```
[UserModel](../models/user.dart)


## 4. UPDATE PROFILE
- String endPointUpdateUser = '$baseURL/edit-profile';
- IsTokenBased: Teacher, Student
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
[UserModel](../models/user.dart)


### 5. CHANGE PASSWORD
- String endPointChangePassword = '$baseURL/change-password';
- IsTokenBased: Teacher, Student
- Body:
```dart
dataMap: {
    "current_password": currentPasswordValue,
    "new_password": newPasswordValue,
    },
```


## 6. GET TEACHER CLASSROOMS
- String endPointGetTeacherClassrooms = '$baseURL/teacher-classrooms';
- IsTokenBased: Teacher
- Return: List of [ClassroomModel](../models/class.dart)


## 7. GET STUDENT CLASSROOMS
- String endPointGetStudentClassrooms = '$baseURL/student-classrooms';
- IsTokenBased: Student
- Return: List of [StudentClassModel](../models/user.dart)


## 8. GET USER EXAMS
- String endPointGetUserExams = '$baseURL/user-exams';
- QueryParams:
```dart
{   
  "page_size": int, 
  "classroom_id": int,
  "student_id": int,
  "grade": int, 
  "status" String, 
  "from": DateTime, 
  "to": DateTime,
}
```
- IsTokenBased: Teacher, Student
- Return: Paginated List of [ExamModel](../models/exam.dart)


## 9. POST CLASSROOM
- String endPointCreateClassroom = '$baseURL/create-classroom';
- IsTokenBased: Teacher
- Body:
```dart
    Map<String, dynamic> classroomBody = {
      "name": classNameValue,
      "school_name": schoolNameValue,
      "school_address": schoolAddressValue,
      "grade": selectedGrade,
      "lesson_times": getApiLessonTimes(selectedLessonTimes),
      "students": uploadedStudents.map((e) => e.toJson()).toList(),
    };
```
- Returns the created [ClassroomModel](../models/class.dart)


## 10. UPDATE CLASSROOM
- String endPointEditClassroom = '$baseURL/edit-classroom';
- QueryParams: 
```dart
{ "classroom_id": classroom_id }
```
- IsTokenBased: Teacher
- Body:
```dart
    Map<String, dynamic> classroomBody = {
      "name": classNameValue,
      "school_name": schoolNameValue,
      "school_address": schoolAddressValue,
      "grade": selectedGrade,
      "lesson_times": getApiLessonTimes(selectedLessonTimes),
    };
    
    if (uploadedStudents.isNotEmpty) {
      classroomBody["students"] = uploadedStudents.map((e) => e.toJson()).toList();
    }
```
- Returns the updated [ClassroomModel](../models/class.dart)


## 11. GET CLASS CURRICULUM
- String endPointGetClassCurriculum = '$baseURL/class-curriculum';
- IsTokenBased - Teacher
- QueryParams:
```dart
{ "classroom_id": classroom_id }
```
- Returns List [GradeModel](../models/cbc.dart)


## 12. POST EXAM
- String endPointCreateExam = '$baseURL/create-exam';
- IsTokenBased: Teacher
- Body:
```dart
Map<String, dynamic> examBody = {
    "classroom_id": currentClassroom.id,
    "selected_strand_ids": selectedStrandsIds,
    "selected_times": selectedTimes
        .map((e) => getFormattedDate(e, DateFormat('dd/MM/yyyy HH:mm')))
        .toList(),
};
if (selectedFiles.isNotEmpty) {
    examBody["selected_files"] = selectedFiles;
}
```


## 13. UPDATE EXAM
- String endPointGetEditExam = '$baseURL/edit-exam';
- IsTokenBased: Teacher
- Body:
```dart
{
    "is_published": true,
    "selected_times": editedDateTimes
        .map((e) => getFormattedDate(e, apiDateTimeFormat))
        .toList(),
}
```
- Returns the updated [ExamModel](../models/exam.dart)


## 14. GET CLASS_PERFORMANCE
- String endPointGetClassroomPerformance = '$baseURL/classroom-performance';
- QueryParams:
```dart
{ "classroom_id": classroom_id }
```
- IsTokenBased: Teacher
- Return: [ClassExamPerformanceModel](../models/performance.dart)
  - An average of ClassExamPerformanceModel for this classroom, exam field is NULL


## 15. GET CLASSROOM STUDENTS
- String endPointGetClassroomStudents = '$baseURL/classroom-students';
- QueryParams:
```dart
{ "classroom_id": classroom_id }
```
- IsTokenBased: Teacher
- Return: Paginated List of [StudentClassModel](../models/user.dart)


## 16. GET CLASS_EXAM_PERFORMANCE
- String endPointGetClassExamPerformanceModel = '$baseURL/class-exam-performance';
- QueryParams:
```dart
{ "exam_id": exam_id }
```
- IsTokenBased: Teacher
- Return: 
  - [ClassExamPerformanceModel](../models/performance.dart)
  - Highest [StudentExamSession](StudentExamSessionModel) and Lowest [StudentExamSession](StudentExamSessionModel)


## 17. GET STUDENT_EXAM_SESSIONS
- String endPointGetClassExamStudentSessions = '$baseURL/student-exam-sessions';
- QueryParams:
```dart
{ "exam_id": exam_id, "expectation_level": expectation_level }
```
- Return: Paginated List of [StudentExamSession](StudentExamSessionModel)


## 18. GET STUDENT_EXAM_SESSION_PERFORMANCE
- String endPointGetStudentExamPerformance = '$baseURL/student-exam-performance';
- QueryParams:
```dart
{ "session_id": session_id }
```
- IsTokenBased: Teacher
- Return:  [StudentExamSessionPerformanceModel](../models/performance.dart)


## 19. UPDATE STUDENT ANSWER SCORE
- String endPointUpdateStudentAnswerScore = '$baseURL/update-student-score';
- QueryParams:
```dart
{ "answer_id": answer_id }
```
- Body:
```dart
{ "tr_score": tr_score } ... updates all performance tables
```
- IsTokenBased: Teacher


## 20. POST STUDENT SESSION
- String endPointCreateStudentAnswer = '$baseURL/student-answer';
- Body:
```dart
{ "exam_id": exam_id } ... check for duplicates
```
- IsTokenBased: Student
- Return StudentExamSession


## 21. POST QUESTION ANSWER
- String endPointCreateQuestionAnswer = '$baseURL/question-answer';
- QueryParams:
```dart
{ "session_id": session_id, "question_id": question_id}
```
- Body:
```dart
{ "answer": answer } ... updates all performance tables
```
- IsTokenBased: Student


## 22. UPDATE EXAM QUESTION
- String endPointUpdateExamQuestion = '$baseURL/exam-question';
- QueryParams:
```dart
{ "question_id": question_id }
```
- Body:
```dart
{ "tr_description": tr_description, "tr_answer": tr_answer } ... updates question analysis table
```
- IsTokenBased: Teacher


# NOTE
- Endpoints are auth-role protected
- Everything ordered by most recently updated