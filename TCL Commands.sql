-- START TRANSACTION with COMMIT
START TRANSACTION;
INSERT INTO Course (Course_name, Description, Emp_id) 
VALUES ('Blockchain Technology', 'Introduction to cryptocurrency and blockchain', 1);
COMMIT;

-- ROLLBACK Example
START TRANSACTION;
-- Update a student's grade
UPDATE Assignment_submission SET Grade = 'B+' WHERE Assignment_id = 5;

-- Check if we want to keep this change
-- If we don't like the change, we can rollback
ROLLBACK;

-- SAVEPOINT Example
START TRANSACTION;
INSERT INTO Student (Uid, First_name, Last_name, Contact_no, Graduation_year)
VALUES ('23BCA10313', 'Rohan', 'Mehta', '9898989813', 2026);
SAVEPOINT after_student_insert;
INSERT INTO Enrollment (Course_id, Uid) VALUES (1, '23BCA10313'), (2, '23BCA10313');
SAVEPOINT after_enrollment;
INSERT INTO Forum_post (Post_content, Uid, Course_id)
VALUES ('Hello everyone! New to the course.', '23BCA10313', 1);
ROLLBACK TO after_student_insert;
COMMIT;
