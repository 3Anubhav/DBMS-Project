-- COUNT: Count the total number of students enrolled in each course
SELECT c.Course_name, COUNT(e.Uid) as Total_Students
FROM Course c
LEFT JOIN Enrollment e ON c.Course_id = e.Course_id
GROUP BY c.Course_name;

-- SUM: Calculate total marks obtained by each student across all exams
SELECT s.First_name, s.Last_name, SUM(er.Marks_obtained) as Total_Marks
FROM Student s
JOIN Exam_result er ON s.Uid = er.Uid
GROUP BY s.Uid, s.First_name, s.Last_name;

-- AVG: Calculate average marks for each course
SELECT c.Course_name, AVG(er.Marks_obtained) as Average_Marks
FROM Course c
JOIN Exam_result er ON c.Course_id = er.Course_id
GROUP BY c.Course_name;

-- MAX: Find the highest marks obtained in each course
SELECT c.Course_name, MAX(er.Marks_obtained) as Highest_Marks
FROM Course c
JOIN Exam_result er ON c.Course_id = er.Course_id
GROUP BY c.Course_name;

-- MIN: Find the lowest marks obtained in each course
SELECT c.Course_name, MIN(er.Marks_obtained) as Lowest_Marks
FROM Course c
JOIN Exam_result er ON c.Course_id = er.Course_id
GROUP BY c.Course_name;

-- GROUP_CONCAT: List all students enrolled in each course
SELECT c.Course_name, 
GROUP_CONCAT(CONCAT(s.First_name, ' ', s.Last_name) SEPARATOR ', ') as Enrolled_Students
FROM Course c
JOIN Enrollment e ON c.Course_id = e.Course_id
JOIN Student s ON e.Uid = s.Uid
GROUP BY c.Course_name;
