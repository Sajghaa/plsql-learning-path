BEGIN
    DBMS_OUTPUT.PUT_LINE('===================================');
    DBMS_OUTPUT.PUT_LINE('DAY 3: PROJECTS TABLE');
    DBMS_OUTPUT.PUT_LINE('===================================');
END;
/

-- Create projects table
CREATE TABLE projects (
    project_id NUMBER PRIMARY KEY,
    project_name VARCHAR2(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    budget NUMBER(10,2),
    dept_id NUMBER,
    
    CONSTRAINT fk_project_dept FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);

-- Insert sample data
INSERT INTO projects VALUES (1, 'Website Redesign', DATE '2024-01-01', DATE '2024-06-30', 25000, 1);
INSERT INTO projects VALUES (2, 'Employee Training', DATE '2024-02-15', DATE '2024-05-15', 15000, 2);
INSERT INTO projects VALUES (3, 'Sales Campaign', DATE '2024-03-01', NULL, 20000, 3);

COMMIT;

-- Practice queries
BEGIN
    DBMS_OUTPUT.PUT_LINE(' PRACTICE QUERIES:');
END;
/

-- 1. All projects
SELECT * FROM projects;

-- 2. Projects with departments
SELECT p.project_name, d.dept_name, p.start_date, p.end_date
FROM projects p
JOIN departments d ON p.dept_id = d.dept_id;

-- 3. Projects currently active (no end date)
SELECT project_name, start_date
FROM projects
WHERE end_date IS NULL;

-- 4. Total budget by department
SELECT d.dept_name, SUM(p.budget) as total_budget
FROM projects p
JOIN departments d ON p.dept_id = d.dept_id
GROUP BY d.dept_name;

BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE(' LEARNED: Projects with dates and budgets');
END;
/