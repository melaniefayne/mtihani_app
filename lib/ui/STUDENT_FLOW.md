# STUDENT FLOW

## A. DashboardPage
- ClassListing with avg term and avg mtihani score comparisons
  - Can click and go to that  [SingleStudentView](TEACHER_FLOW.md/#singlestudentview)

- ExamListing (page_size = 5)
  - Can view more and got to full [ExamListingPage](#examlistingpage)
  - Can click and go to that [SingleStudentExamView](TEACHER_FLOW.md/#singlestudentexamview)


### SingleStudentClassView
<hr>

- OverallPerformance
    - Term & Mtihani Scores (line charts & avg score cards)
    - Strand Analysis: For each strand:
      - Average score
      - Bloom Skill Scores
      - SubStrand Scores

- StudentExamListing (API paginated)
  - Can filter by grade, status, date_range
  - Can view more
  - Can click and go to that [SingleStudentExamView](TEACHER_FLOW.md/#singlestudentexamview)


### StudentExamTestView
<hr>

- Show start exam dialog
- Test setup with timer and submit answer functionalities
- Should work for both exams and follow up quizzes

## B. ExamListingPage

- Can filter by class_id, grade, status, date_range
- Can view more
- Can click and go to that [SingleStudentExamView](TEACHER_FLOW.md/#singlestudentexamview)


## C. NotificationsPage

- Exam published
- Completed exam grading
- Follow up quiz published
- Completed Follow up quiz grading
- Upcoming lesson (1 hr before)
- Upcoming exam (1 hr before)