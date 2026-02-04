BEGIN
    DBMS_OUTPUT.PUT_LINE('===================================');
    DBMS_OUTPUT.PUT_LINE('DAY 5: LOCATIONS TABLE');
    DBMS_OUTPUT.PUT_LINE('===================================');
END;
/

-- Add location to departments
ALTER TABLE departments
ADD location VARCHAR2(100);

-- Update departments with locations
UPDATE departments SET location = 'Building A, Floor 3' WHERE dept_id = 1;
UPDATE departments SET location = 'Building B, Floor 1' WHERE dept_id = 2;
UPDATE departments SET location = 'Building A, Floor 2' WHERE dept_id = 3;

COMMIT;

-- Practice queries
BEGIN
    DBMS_OUTPUT.PUT_LINE(' LOCATION QUERIES:');
END;
/

-- 1. Departments with locations
SELECT dept_name, location, budget
FROM departments
ORDER BY dept_name;

-- 2. Complete employee info with department location
SELECT e.first_name, e.last_name, e.salary, d.dept_name, d.location
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE(' LEARNED: ALTER TABLE and UPDATE');
END;
/