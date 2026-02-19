-- EDUCATION ANALYTICS SCHEMA - STUDENT PERFORMANCE TRACKING

-- Business Purpose: Track student progress and identify at-risk patterns
-- Author: Student Portfolio
-- Date: February 2026
-- Version: 2.0 (Refined from original assignment)






-- TABLE: students
-- Purpose: Core demographic and status tracking
-- Business Rules:
--   - Email must be unique (communication channel)
--   - Status limited to defined values (data quality)
--   - Enrollment date cannot be future (business logic)

CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    enrollment_date DATE NOT NULL,
    major VARCHAR2(50),
    status VARCHAR2(20) DEFAULT 'ACTIVE' NOT NULL,
    last_activity_date DATE,
    created_date DATE DEFAULT SYSDATE,
    modified_date DATE,
    
    -- Business rule constraints
    CONSTRAINT chk_student_status 
        CHECK (status IN ('ACTIVE', 'GRADUATED', 'DROPPED', 'SUSPENDED')),
    CONSTRAINT chk_enrollment_date 
        CHECK (enrollment_date <= SYSDATE)
);

-- Comments (self-documenting database)
COMMENT ON TABLE students IS 'Main student demographic and status tracking';
COMMENT ON COLUMN students.student_id IS 'Surrogate key, generated from sequence';
COMMENT ON COLUMN students.email IS 'Primary communication channel, must be unique';
COMMENT ON COLUMN students.status IS 'Current academic standing';
COMMENT ON COLUMN students.last_activity_date IS 'Last login or interaction with system';

-- TABLE: courses
-- Purpose: Course catalog with department classification
-- Business Rules:
--   - Credits between 1-5 (academic policy)
--   - Course code format: 2-4 letters + numbers (e.g., CS101)
--   - Department must be valid list

CREATE TABLE courses (
    course_id NUMBER PRIMARY KEY,
    course_code VARCHAR2(10) UNIQUE NOT NULL,
    course_name VARCHAR2(100) NOT NULL,
    credits NUMBER(1) NOT NULL,
    department VARCHAR2(50) NOT NULL,
    is_active CHAR(1) DEFAULT 'Y' NOT NULL,
    created_date DATE DEFAULT SYSDATE,
    
    CONSTRAINT chk_credits 
        CHECK (credits BETWEEN 1 AND 5),
    CONSTRAINT chk_department 
        CHECK (department IN ('CS', 'Data Science', 'Business', 'Engineering', 'Mathematics')),
    CONSTRAINT chk_is_active 
        CHECK (is_active IN ('Y', 'N'))
);

COMMENT ON TABLE courses IS 'Course catalog with department classification';
COMMENT ON COLUMN courses.course_code IS 'Business identifier, e.g., CS101';
COMMENT ON COLUMN courses.is_active IS 'Y = currently offered, N = discontinued';

-- TABLE: enrollments
-- Purpose: Fact table linking students to courses
-- Business Rules:
--   - Grade NULL means in progress (business meaning)
--   - Status tracks enrollment lifecycle
--   - Cannot enroll in same course twice in same semester

CREATE TABLE enrollments (
    enrollment_id NUMBER PRIMARY KEY,
    student_id NUMBER NOT NULL,
    course_id NUMBER NOT NULL,
    semester VARCHAR2(10) NOT NULL,
    enrollment_date DATE NOT NULL,
    grade NUMBER(3,1) NULL,
    status VARCHAR2(20) DEFAULT 'ENROLLED' NOT NULL,
    drop_date DATE NULL,
    created_date DATE DEFAULT SYSDATE,
    
    CONSTRAINT fk_enrollments_student 
        FOREIGN KEY (student_id) REFERENCES students(student_id),
    CONSTRAINT fk_enrollments_course 
        FOREIGN KEY (course_id) REFERENCES courses(course_id),
    CONSTRAINT chk_enrollment_status 
        CHECK (status IN ('ENROLLED', 'DROPPED', 'COMPLETED', 'WITHDRAWN')),
    CONSTRAINT chk_grade_range 
        CHECK (grade BETWEEN 0 AND 100),
    -- Business rule: No duplicate enrollments
    CONSTRAINT uniq_student_course_semester 
        UNIQUE (student_id, course_id, semester)
);

COMMENT ON TABLE enrollments IS 'Transactional record of student course activity';
COMMENT ON COLUMN enrollments.grade IS 'NULL = in progress, 0-100 = final grade';
COMMENT ON COLUMN enrollments.drop_date IS 'Populated only if status = DROPPED';
COMMENT ON COLUMN enrollments.semester IS 'Format: FALL2025, SPRING2026, SUMMER2026';

-- Create indexes for performance (pros think about this)
CREATE INDEX idx_enrollments_student ON enrollments(student_id);
CREATE INDEX idx_enrollments_course ON enrollments(course_id);
CREATE INDEX idx_enrollments_semester ON enrollments(semester);
CREATE INDEX idx_enrollments_status ON enrollments(status);

-- AUDIT TRAIL: Professional systems track changes

CREATE TABLE enrollments_audit (
    audit_id NUMBER PRIMARY KEY,
    enrollment_id NUMBER,
    old_grade NUMBER(3,1),
    new_grade NUMBER(3,1),
    changed_by VARCHAR2(50),
    change_date DATE DEFAULT SYSDATE
);

COMMENT ON TABLE enrollments_audit IS 'Track grade changes for compliance';
