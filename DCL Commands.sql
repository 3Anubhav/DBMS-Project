-- Create users
CREATE USER 'professor'@'localhost' IDENTIFIED BY 'prof123';
CREATE USER 'student'@'localhost' IDENTIFIED BY 'stud123';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123';

-- Grant privileges to admin (full access)
GRANT ALL PRIVILEGES ON olms.* TO 'admin'@'localhost';

-- Grant privileges to professor
GRANT SELECT, INSERT, UPDATE, DELETE 
ON olms.Course TO 'professor'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON olms.Assignment TO 'professor'@'localhost';
GRANT SELECT, INSERT, UPDATE 
ON olms.Assignment_submission TO 'professor'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON olms.Course_exam TO 'professor'@'localhost';
GRANT SELECT, INSERT, UPDATE 
ON olms.Exam_result TO 'professor'@'localhost';
GRANT SELECT ON olms.Student TO 'professor'@'localhost';
GRANT SELECT ON olms.Enrollment TO 'professor'@'localhost';

-- Grant privileges to student
GRANT SELECT ON olms.Course TO 'student'@'localhost';
GRANT SELECT ON olms.Assignment TO 'student'@'localhost';
GRANT SELECT, INSERT ON olms.Assignment_submission TO 'student'@'localhost';
GRANT SELECT ON olms.Course_exam TO 'student'@'localhost';
GRANT SELECT ON olms.Exam_result TO 'student'@'localhost';
GRANT SELECT, INSERT ON olms.Forum_post TO 'student'@'localhost';

-- Flush privileges to apply changes
FLUSH PRIVILEGES;

-- Show granted privileges
SHOW GRANTS FOR 'professor'@'localhost';
SHOW GRANTS FOR 'student'@'localhost';
SHOW GRANTS FOR 'admin'@'localhost';

-- Login as professor
mysql -u professor -p

-- Test professor privileges
SELECT * FROM olms.Course;  -- Should work
DELETE FROM olms.Student;   -- Should fail
UPDATE olms.Assignment_submission SET Grade = 'A';  -- Should work

-- Login as student
mysql -u student -p
-- Test student privileges
SELECT * FROM olms.Course;  -- Should work

INSERT INTO olms.Course VALUES
(21,'OOPs','Object Oriented Programming',2);  -- Should fail

SELECT * FROM olms.Assignment;  -- Should work

-- Revoke specific privileges
REVOKE DELETE ON olms.Assignment_submission FROM 'professor'@'localhost';
REVOKE INSERT ON olms.Forum_post FROM 'student'@'localhost';

-- Revoke all privileges
REVOKE ALL PRIVILEGES ON olms.* FROM 'student'@'localhost';

-- Drop users if needed
DROP USER 'student'@'localhost';