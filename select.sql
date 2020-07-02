# 1.Query the existence of 1 course
SELECT * FROM course WHERE id = 1;

# 2.Query the presence of both 1 and 2 courses
SELECT * FROM course WHERE id = 1 AND id = 2;

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
SELECT st.id, st.`name`, AVG(sc.score) FROM student st, student_course sc
WHERE st.id = sc.studentId
GROUP BY st.id, st.`name`
HAVING AVG(sc.score) >= 60;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
SELECT * FROM student st WHERE st.id NOT IN 
(SELECT DISTINCT sc.studentId FROM student_course sc);

# 5.Query all SQL with grades
SELECT DISTINCT st.* FROM student st, student_course sc WHERE st.id = sc.studentId;

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
SELECT st.* FROM student st,student_course sc 
WHERE st.id = sc.studentId AND sc.courseId = "1" AND st.id IN
(SELECT st1.id FROM student st1,student_course sc1 
WHERE st1.id = sc1.studentId AND sc1.courseId = "2");

# 7.Retrieve 1 student score with less than 60 scores in descending order
SELECT st.*,sc.courseId FROM student st,student_course sc 
WHERE st.id = sc.studentId AND sc.courseId = "1" AND sc.score < 60
ORDER BY sc.score desc;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT c.*, AVG(sc.score) FROM course c, student_course sc
WHERE c.id = sc.courseId
GROUP BY sc.courseId
ORDER BY AVG(sc.score) desc, c.id ASC;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
SELECT st.`name`, sc.score FROM student st, course c, student_course sc
WHERE st.id = sc.studentId AND c.id = sc.courseId AND c.`name` = "Math" AND sc.score < 60;