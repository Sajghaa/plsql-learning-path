BEGIN
    DBMS_OUTPUT.PUT_LINE('===================================');
    DBMS_OUTPUT.PUT_LINE('DAY 4: BRIDGE TABLE');
    DBMS_OUTPUT.PUT_LINE('===================================');
END;
/

-- Bridge table for many-to-many
CREATE TABLE employee_projects (
    emp_id NUMBER,
    project_id NUMBER,
    hours_worked NUMBER(5,2),
    
    PRIMARY KEY (emp_id, project_id),
    
    CONSTRAINT fk_emp FOREIGN KEY (emp_id)
        REFERENCES employees(emp_id),
        
    CONSTRAINT fk_proj FOREIGN KEY (project_id)
        REFERENCES projects(project_id)
);

-- Assign employees to projects
INSERT INTO employee_projects VALUES (101, 1, 40.5);
INSERT INTO employee_projects VALUES (101, 2, 15.0);
INSERT INTO employee_projects VALUES (102, 1, 35.0);
INSERT INTO employee_projects VALUES (103, 2, 25.5);
INSERT INTO employee_projects VALUES (104, 3, 50.0);

COMMIT;

-- Practice queries
BEGIN
    DBMS_OUTPUT.PUT_LINE(' MANY-TO-MANY QUERIES:');
END;
/

-- 1. Who works on which project?
SELECT e.first_name, e.last_name, p.project_name, ep.hours_worked
FROM employees e
JOIN employee_projects ep ON e.emp_id = ep.emp_id
JOIN projects p ON ep.project_id = p.project_id;

-- 2. Total hours per project
SELECT p.project_name, SUM(ep.hours_worked) as total_hours
FROM projects p
JOIN employee_projects ep ON p.project_id = ep.project_id
GROUP BY p.project_name;

-- 3. Employees working on multiple projects
SELECT e.first_name, e.last_name, COUNT(ep.project_id) as project_count
FROM employees e
JOIN employee_projects ep ON e.emp_id = ep.emp_id
GROUP BY e.emp_id, e.first_name, e.last_name
HAVING COUNT(ep.project_id) > 1;

BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE(' LEARNED: Many-to-many relationships');
END;
/