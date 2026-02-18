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

-- TABLE: students
-- Purpose: Core demographic and status tracking
-- Business Rule:
--               - Email must be unique(communication chanel)
--               - Status limited to defined values (data quality)
--               - Enrollment date cannot be future (business logic)


CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    enrollment_date DATE NOT NULL,
    major VARCHAR2(50),
    status VARCHAR(20) DEFAULT 'ACTIVE' NOT NULL,
    last_activity_date DATE,
    created_date DATE DEFAULT SYSDATE,
    modified_date DATE,

    -- Business rule constraints
    CONSTRAINT chk_student_status
           CHECK (status IN('ACTIVE', 'GRADUATED', 'DROPPED','SUSPENDED')),
    CONSTRAINT chk_enrollment_date
           CHECK (enrollment_date <= SYSDATE)
);

COMMENT ON TABLE students IS 'Main student demographic and status tracking';
COMMENT ON COLUMN students.student_id IS 'Surrogate key, generated from sequence';
COMMENT ON COLUMN students.email IS 'Primary communication channel, must be unique';
COMMENT ON COLUMN students.status IS 'Current academic standing';
COMMENT ON COLUMN students.last_activity_date IS 'Last login or interaction with system';