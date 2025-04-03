-- This view joins Course and Instructor tables to show course details with instructor information
CREATE VIEW course_details AS
SELECT 
    c.Course_id,
    c.Course_name,
    c.Description,
    i.Department AS Instructor_Department,
    i.Contact_no AS Instructor_Contact
FROM Course c
JOIN Instructor i ON c.Emp_id = i.id;

-- Shows total number of students in each course
CREATE VIEW course_statistics AS
SELECT 
    c.Course_name,
    COUNT(e.Uid) AS Total_Students
FROM Course c
LEFT JOIN Enrollment e ON c.Course_id = e.Course_id
GROUP BY c.Course_name;


-- Query the course_details view
SELECT * FROM course_details;

-- Query the course_statistics view
SELECT * FROM course_statistics;

-- Drop views if needed
DROP VIEW IF EXISTS course_details;
