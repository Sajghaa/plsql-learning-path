BEGIN
    DBMS_OUTPUT.PUT_LINE('===================================');
    DBMS_OUTPUT.PUT_LINE('DAY 6: TEST OUR DATABASE');
    DBMS_OUTPUT.PUT_LINE('===================================');
END;
/

-- Show all tables
SELECT table_name 
FROM user_tables 
ORDER BY table_name;

-- Test 1: Count records in each table
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE(' RECORD COUNTS:');
END;
/

SELECT 'departments' as table_name, COUNT(*) as record_count FROM departments
UNION ALL
SELECT 'employees', COUNT(*) FROM employees
UNION ALL
SELECT 'projects', COUNT(*) FROM projects
UNION ALL
SELECT 'employee_projects', COUNT(*) FROM employee_projects;

-- Test 2: Complex query - Company overview
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE(' COMPANY OVERVIEW:');
END;
/

SELECT 
    d.dept_name,
    COUNT(e.emp_id) as employee_count,
    AVG(e.salary) as avg_salary,
    COUNT(p.project_id) as project_count,
    SUM(p.budget) as total_budget
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
LEFT JOIN projects p ON d.dept_id = p.dept_id
GROUP BY d.dept_id, d.dept_name
ORDER BY d.dept_name;

-- Test 3: Employee project assignments
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE(' EMPLOYEE PROJECT ASSIGNMENTS:');
END;
/

SELECT 
    e.first_name || ' ' || e.last_name as employee_name,
    d.dept_name,
    LISTAGG(p.project_name, ', ') WITHIN GROUP (ORDER BY p.project_name) as projects
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
LEFT JOIN employee_projects ep ON e.emp_id = ep.emp_id
LEFT JOIN projects p ON ep.project_id = p.project_id
GROUP BY e.emp_id, e.first_name, e.last_name, d.dept_name
ORDER BY employee_name;

BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE(' DATABASE TEST COMPLETE!');
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE(' CONGRATULATIONS!');
    DBMS_OUTPUT.PUT_LINE('You built a complete employee database!');
END;
/