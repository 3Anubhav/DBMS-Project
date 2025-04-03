-- Create the database
CREATE DATABASE OLMS;
USE olms;

-- Create Instructor table
CREATE TABLE Instructor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    Emp_id INT NOT NULL UNIQUE,
    Department VARCHAR(100) NOT NULL,
    Contact_no VARCHAR(20) NOT NULL,
    CHECK (LENGTH(Contact_no) >= 10)
);

-- Create Course table
CREATE TABLE Course (
    Course_id INT PRIMARY KEY AUTO_INCREMENT,
    Course_name VARCHAR(100) NOT NULL UNIQUE,
    Description TEXT,
    Emp_id INT,
    FOREIGN KEY (Emp_id) REFERENCES Instructor(id),
    CHECK (LENGTH(Course_name) >= 3)
);

-- Create Student table
CREATE TABLE Student (
    Uid VARCHAR(20) PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    Contact_no VARCHAR(20) NOT NULL UNIQUE,
    CHECK (LENGTH(Contact_no) >= 10),
    CHECK (LENGTH(Uid) >= 5)
);

-- Create Assignment table
CREATE TABLE Assignment (
    Assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Description TEXT,
    Due_date DATE NOT NULL,
    Course_id INT NOT NULL,
    FOREIGN KEY (Course_id) REFERENCES Course(Course_id),
    CHECK (Due_date > '2023-01-01')
);

-- Create Enrollment table
CREATE TABLE Enrollment (
    Enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    Enrollment_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    Course_id INT NOT NULL,
    Uid VARCHAR(20) NOT NULL,
    FOREIGN KEY (Course_id) REFERENCES Course(Course_id),
    FOREIGN KEY (Uid) REFERENCES Student(Uid),
    UNIQUE (Course_id, Uid)
);

-- Create Submission table
CREATE TABLE Submission (
    Submission_id INT PRIMARY KEY AUTO_INCREMENT,
    Submission_date VARCHAR(50) NOT NULL,
    File_link VARCHAR(255) NOT NULL,
    Grade VARCHAR(10) DEFAULT 'Pending',
    Assignment_id INT NOT NULL,
    Uid VARCHAR(20) NOT NULL,
    FOREIGN KEY (Assignment_id) REFERENCES Assignment(Assignment_id),
    FOREIGN KEY (Uid) REFERENCES Student(Uid),
    UNIQUE (Assignment_id, Uid),
    CHECK (Grade IN ('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D', 'F', 'Pending'))
);

-- Create Exam table
CREATE TABLE Exam (
    Exam_id INT PRIMARY KEY AUTO_INCREMENT,
    Exam_date DATE NOT NULL,
    Duration INT NOT NULL DEFAULT 120,
    Course_id INT NOT NULL,
    FOREIGN KEY (Course_id) REFERENCES Course(Course_id),
    CHECK (Duration > 0 AND Duration <= 240),
    CHECK (Exam_date > '2023-01-01')
);

-- Create Exam_result table
CREATE TABLE Exam_result (
    Exam_result_id INT PRIMARY KEY AUTO_INCREMENT,
    Marks_obtained FLOAT NOT NULL,
    Total_marks FLOAT NOT NULL DEFAULT 100.0,
    Uid VARCHAR(20) NOT NULL,
    Course_id INT NOT NULL,
    FOREIGN KEY (Uid) REFERENCES Student(Uid),
    FOREIGN KEY (Course_id) REFERENCES Course(Course_id),
    UNIQUE (Uid, Course_id),
    CHECK (Marks_obtained >= 0 AND Marks_obtained <= Total_marks),
    CHECK (Total_marks > 0)
);

-- Create Discussion_post table
CREATE TABLE Discussion_post (
    Post_id INT PRIMARY KEY AUTO_INCREMENT,
    Post_content TEXT NOT NULL,
    Post_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Uid VARCHAR(20) NOT NULL,
    FOREIGN KEY (Uid) REFERENCES Student(Uid),
    CHECK (LENGTH(Post_content) > 0)
);

-- Alter table examples
-- Add a new column to the Student table
ALTER TABLE Student ADD COLUMN Graduation_year INT;

-- Modify a column in the Course table
ALTER TABLE Course MODIFY COLUMN Course_name VARCHAR(100) NOT NULL;

-- Add a constraint to the Assignment table
ALTER TABLE Assignment ADD CONSTRAINT check_deadline CHECK (Due_date > '2023-01-01');

-- Drop a column from the Submission table
ALTER TABLE Submission DROP COLUMN File_link;

-- Add a foreign key constraint
ALTER TABLE Discussion_post ADD COLUMN Course_id INT;
ALTER TABLE Discussion_post ADD CONSTRAINT fk_course_discussion FOREIGN KEY (Course_id) REFERENCES Course(Course_id);

-- Drop table examples
-- Drop a table if it exists
DROP TABLE IF EXISTS Temporary_records;

-- Drop multiple tables
DROP TABLE IF EXISTS Old_assignments, Archived_submissions;

-- Rename table examples
-- Rename a single table
RENAME TABLE Exam TO Course_exam;

-- Rename multiple tables
RENAME TABLE 
    Discussion_post TO Forum_post,
    Submission TO Assignment_submission;

-- Truncate table examples
-- Remove all data from a table but keep the structure
TRUNCATE TABLE Exam_result;

-- Truncate multiple tables
TRUNCATE TABLE Forum_post;
TRUNCATE TABLE Assignment_submission;