-- Insert data into Instructor table
INSERT INTO Instructor (Emp_id, Department, Contact_no) VALUES
(3782, 'Computer Science', '9876543210'),
(3783, 'Computer Applications', '9876543211'),
(3784, 'Information Technology', '9876543212'),
(3785, 'Data Science', '9876543213'),
(3786, 'Artificial Intelligence', '9876543214'),
(3787, 'Software Engineering', '9876543215'),
(3788, 'Cyber Security', '9876543216'),
(3789, 'Cloud Computing', '9876543217'),
(3790, 'Machine Learning', '9876543218'),
(3791, 'Mobile Development', '9876543219');

-- Insert data into Course table
INSERT INTO Course (Course_name, Description, Emp_id) VALUES
('Python Programming', 'Introduction to Python programming language', 1),
('Database Management', 'Fundamentals of DBMS and SQL', 2),
('Web Development', 'HTML, CSS, and JavaScript basics', 3),
('Data Structures', 'Advanced data structures and algorithms', 4),
('Artificial Intelligence', 'Basics of AI and Machine Learning', 5),
('Java Programming', 'Core Java and OOP concepts', 6),
('Network Security', 'Fundamentals of cybersecurity', 7),
('Cloud Architecture', 'AWS and Azure fundamentals', 8),
('Mobile App Development', 'Android and iOS development', 9),
('Operating Systems', 'OS concepts and administration', 10);

-- Insert data into Student table
INSERT INTO Student (Uid, First_name, Last_name, Contact_no, Graduation_year) VALUES
('23BCA10301', 'Aarav', 'Sharma', '9898989801', 2026),
('23BCA10302', 'Diya', 'Patel', '9898989802', 2026),
('23MCA10303', 'Arjun', 'Kumar', '9898989803', 2025),
('23MCA10304', 'Ananya', 'Singh', '9898989804', 2025),
('23BIT10305', 'Advait', 'Verma', '9898989805', 2026),
('23BCA10306', 'Ishaan', 'Malhotra', '9898989806', 2026),
('23MCA10307', 'Zara', 'Kapoor', '9898989807', 2025),
('23BIT10308', 'Vihaan', 'Reddy', '9898989808', 2026),
('23BCA10309', 'Riya', 'Gupta', '9898989809', 2026),
('23MCA10310', 'Kabir', 'Mehra', '9898989810', 2025),
('23BIT10311', 'Aisha', 'Joshi', '9898989811', 2026),
('23BCA10312', 'Vivaan', 'Choudhury', '9898989812', 2026);

-- Insert data into Assignment table
INSERT INTO Assignment (Title, Description, Due_date, Course_id) VALUES
('Python Basics', 'Create a simple calculator program', '2024-03-30', 1),
('SQL Queries', 'Write complex SQL queries', '2024-04-15', 2),
('HTML Portfolio', 'Create a personal portfolio website', '2024-04-20', 3),
('DSA Project', 'Implement a balanced BST', '2024-04-25', 4),
('AI Model', 'Build a simple classification model', '2024-05-01', 5),
('Java Classes', 'Create a library management system', '2024-05-05', 6),
('Security Audit', 'Perform security assessment', '2024-05-10', 7),
('Cloud Deploy', 'Deploy application on AWS', '2024-05-15', 8),
('Android App', 'Create a todo list app', '2024-05-20', 9),
('Shell Script', 'Write backup automation script', '2024-05-25', 10);

-- Insert data into Enrollment table
INSERT INTO Enrollment (Course_id, Uid) VALUES
(1, '23BCA10301'), (2, '23BCA10301'), (3, '23BCA10301'),
(1, '23BCA10302'), (4, '23BCA10302'),
(2, '23MCA10303'), (5, '23MCA10303'), (6, '23MCA10303'),
(3, '23MCA10304'), (7, '23MCA10304'),
(4, '23BIT10305'), (8, '23BIT10305'),
(5, '23BCA10306'), (9, '23BCA10306'),
(6, '23MCA10307'), (10, '23MCA10307'),
(7, '23BIT10308'), (1, '23BIT10308'),
(8, '23BCA10309'), (2, '23BCA10309'),
(9, '23MCA10310'), (3, '23MCA10310');

-- Insert data into Assignment_submission
INSERT INTO Assignment_submission (Submission_date, Grade, Assignment_id, Uid) VALUES
('2024-03-25', 'A', 1, '23BCA10301'),
('2024-03-26', 'B+', 1, '23BCA10302'),
('2024-04-10', 'A-', 2, '23MCA10303'),
('2024-04-12', 'A+', 3, '23MCA10304'),
('2024-04-15', 'B', 4, '23BIT10305'),
('2024-04-18', 'A', 5, '23BCA10306'),
('2024-04-20', 'B+', 6, '23MCA10307'),
('2024-04-22', 'A-', 7, '23BIT10308'),
('2024-04-25', 'B-', 8, '23BCA10309'),
('2024-04-28', 'A', 9, '23MCA10310'),
('2024-05-01', 'A+', 10, '23MCA10307'),
('2024-05-03', 'B+', 1, '23BIT10308');

-- Insert data into Course_exam
INSERT INTO Course_exam (Exam_date, Duration, Course_id) VALUES
('2024-05-15', 180, 1),
('2024-05-16', 180, 2),
('2024-05-17', 180, 3),
('2024-05-18', 180, 4),
('2024-05-19', 180, 5),
('2024-05-20', 180, 6),
('2024-05-21', 180, 7),
('2024-05-22', 180, 8),
('2024-05-23', 180, 9),
('2024-05-24', 180, 10);

-- Insert data into Exam_result
INSERT INTO Exam_result (Marks_obtained, Total_marks, Uid, Course_id) VALUES
(85.5, 100.0, '23BCA10301', 1),
(92.0, 100.0, '23BCA10302', 1),
(88.5, 100.0, '23MCA10303', 2),
(95.0, 100.0, '23MCA10304', 3),
(87.5, 100.0, '23BIT10305', 4),
(91.0, 100.0, '23BCA10306', 5),
(89.5, 100.0, '23MCA10307', 6),
(93.5, 100.0, '23BIT10308', 7),
(86.0, 100.0, '23BCA10309', 8),
(90.5, 100.0, '23MCA10310', 9),
(88.0, 100.0, '23BIT10311', 10),
('94.5', 100.0, '23BCA10312', 1);

-- Insert data into Forum_post
INSERT INTO Forum_post (Post_content, Uid, Course_id) VALUES
('Need help with Python loops concept', '23BCA10301', 1),
('Sharing my SQL assignment approach', '23BCA10302', 2),
('HTML vs CSS discussion', '23MCA10303', 3),
('Binary Tree implementation doubt', '23MCA10304', 4),
('AI project group formation', '23BIT10305', 5),
('Java inheritance example needed', '23BCA10306', 6),
('Cybersecurity best practices', '23MCA10307', 7),
('AWS deployment issues', '23BIT10308', 8),
('Android Studio setup problem', '23BCA10309', 9),
('Linux commands cheat sheet', '23MCA10310', 10),
('Database normalization doubt', '23BIT10311', 2),
('Web hosting recommendations?', '23BCA10312', 3);

-- Select all records from Instructor table
SELECT * FROM Instructor;

--Select all records from Course table
SELECT * FROM Course;

--Select all records from Student table
SELECT * FROM Student;

--Select all records from Assignment table
SELECT * FROM Assignment;

--Select all records from Enrollment table
SELECT * FROM Enrollment;

--Select all records from Assignment_submission table
SELECT * FROM Assignment_submission;

--Select all records from Course_exam table
SELECT * FROM Course_exam;

--Select all records from Exam_result table
SELECT * FROM Exam_result;

--Select all records from Forum_post table
SELECT * FROM Forum_post;

-- Alternative simple selects with specific columns
-- Select specific columns from Instructor
SELECT Emp_id, Department, Contact_no FROM Instructor;

-- Select specific columns from Course
SELECT Course_id, Course_name, Description FROM Course;

-- Select specific columns from Student
SELECT Uid, First_name, Last_name, Graduation_year FROM Student;

-- Select specific columns from Assignment
SELECT Assignment_id, Title, Due_date FROM Assignment;

-- Select specific columns from Assignment_submission
SELECT Assignment_id, Submission_date, Grade FROM Assignment_submission;

-- Select specific columns from Course_exam
SELECT Exam_id, Exam_date, Duration FROM Course_exam;

-- Update Assignment submission grade
UPDATE Assignment_submission SET Grade = 'A+' 
WHERE Assignment_id = 1 AND Uid = '23BCA10301';

-- Delete a forum post
DELETE FROM Forum_post WHERE Post_id = 1;

