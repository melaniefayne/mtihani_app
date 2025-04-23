# TEACHER FLOW

## A. DashboardPage
- ClassListing with avg term and avg mtihani score comparisons
  - Can click and go to that  [SingleTrClassView](#singleclassview)

- ExamListing (page_size = 5)
  - Can view more and got to full [ExamListingPage](#examlistingpage)
  - Can click and go to that  [SingleClassExamView](#singleclassexamview)

- Add Class
- Generate Exam


### SingleTrClassView
<hr>

- OverallPerformance
    - Term & Mtihani Scores (line charts & avg score cards)
    - Strand Analysis: For each strand:
      - Average score
      - Bloom Skill Scores
      - SubStrand Scores
      - Top Percentile Students
      - Bottom Percentile Students

- ClassExamListing (API paginated)
  - Can filter by grade, status, date_range
  - Can view more
  - Can click and go to that [SingleClassExamView](#singleclassexamview)

- StudentListing
  - Can click and got to that [SingleStudentView](#singlestudentview)


### SingleClassExamView
<hr>

- ClassPerformance
  - Average score
  - Bloom Skill Scores
  - Insights & Recommendations
  - Strand Analysis: For each strand:
    - Average score
    - Bloom Skill Scores
    - SubStrand Scores
    - Top Percentile Students
    - Bottom Percentile Students
    
- StudentPerformances
  - Highest Student, Lowest Student
  - StudentExamPerformanceListing (API paginated)
    - Can filter by expectation level 
    - Can view more
    - Can view [SingleStudentExamView](#singlestudentexamview)
  - StudentClustersListing 
    - Can click global view more and go to that exam's [SingleExamClusterView](#singleexamclusterview)

- Details
  - Schedule details
    - Can edit if exam status is UPCOMING else, just view
    - Can publish exams
  - QuestionAnalysis
  - ExamQuestionListing
    - Can filter by grade, strand, sub_strand, **difficulty_level**


### SingleStudentExamView
<hr>

- **VIEW AS TEACHER OR STUDENT**
- If isStudent & Exam.status == ongoing: take to [StudentExamTestView](STUDENT_FLOW.md/#studentexamtestview)

- Performance:
  - Average score
  - Bloom Skill Scores
  - Insights & Recommendations
  - Strand Analysis: For each strand:
    - Average score
    - Bloom Skill Scores
    - SubStrand Scores

- Answers:
  - ExamQuestion & StudentAnswer
    - Can filter by grade, strand, sub_strand, **expectation_level**
    - Can edit scores - trigger performance updates

- Follow Up
  - Student Cluster
  - Follow up quiz with answers & grading ... ref [SingleQuizSubmissionView](#singlequizsubmissionview)


### SingleExamClusterView
<hr>

- Properties: cluster code, student list, follow up quiz, best skill, worst skill, avg score

- Sections:
  - Cluster Details
    - For each cluster:
      - See properties: cluster code, avg score, best skill, worst skill
      - Create mixed groups 
        - Toggle through different variations
        - Download groups sheet as csv
      - StudentExamPerformanceListing: - Can view [SingleStudentExamView](#singlestudentexamview)

  - Follow up Quiz
    - Filter by cluster
    - Quiz:
      - Can view and verify questions if not yet published
      - Can publish to the cluster student with deadlines
    - SingleQuizSubmissionListing (API paginated)
      - Can click and go to [SingleQuizSubmissionView](#singlequizsubmissionview)
      - Can view more


### SingleQuizSubmissionView
<hr>

- **VIEW AS TEACHER OR STUDENT**
- If isStudent & Quiz.status == ongoing: take to [StudentExamTestView](STUDENT_FLOW.md/#studentexamtestview)
- SingleStudentExamView card summary: can view this [SingleStudentExamView](#singlestudentexamview)
- Follow up quiz with answers & grading
  - Can edit scores


### SingleStudentView
<hr>

- **VIEW AS TEACHER OR STUDENT**
- MtihaniPerformance
  - Mtihani Scores (line chart & avg score card)
  - Strand Analysis: For each strand:
    - Average score
    - Bloom Skill Scores
    - SubStrand Scores

- StudentExamListing (API paginated)
  - Can filter by grade, status, date_range
  - Can view more
  - Can click and go to that [SingleStudentExamView](#singlestudentexamview)

- TermPerformance
  - Term scores (line chart & avg score card)
  - Edit term score dialog
  
- FollowUpSubmissionsListing (API Paginated)
  - Can click and go to [SingleQuizSubmissionView](#singlequizsubmissionview)
  - Can view more


## B. ExamListingPage

- Can filter by class_id, grade, status, date_range
- Can view more
- Can click and go to that [SingleClassExamView](#singleclassexamview)


## C. NotificationsPage

- Completed exam generation
- Student exam submission
- Completed exam grading
- Follow up quiz submission
- Completed Follow up quiz grading
- Upcoming lesson (1 hr before)
- Upcoming exam (1 hr before)