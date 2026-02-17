-- EDUCATION ANALYTICS SCHEMA - STUDENT PERFORMANCE TRACKING
-- Business Purpose: Track student progress and identify at-risk patterns
-- Author: Student Portfolio
-- Date: February 2026
-- Version: 2.0 (Refined from original assignment)



-- Clean up existing objects (for fresh )
DROP TABLE enrollments;
DROP TABLE courses;
DROP TABLE students;
DROP SEQUENCE student_seq;
DROP SEQUENCE course_seq;
DROP SEQUENCE enrollment_seq;

-- SEQUENCES: Professional systems use sequences, not hard-coded IDs

CREATE SEQUENCE student_seq START WITH 1000 INCREMENT BY 1;
CREATE SEQUENCE course_seq START WITH 5000 INCREMENT BY 1;
CREATE SEQUENCE enrollment_seq START WITH 1000 INCREMENT BY 1;