BEGIN
    DBMS_OUTPUT.PUT_LINE('==============================');
    DBMS_OUTPUT.PUT_LINE('DAY 2: EMPLOYEES TABLE');
    DBMS_OUTPUT.PUT_LINE('==============================');
END;
/

--Step 1: Drop if exists
DECLARE
    total_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO table_count
    FROM user_tables
    WHERE table_name = 'EMPLOYEES';

    IF table_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE employees';
        DBMS_OUTPUT.PUT_LINE('Old employees table dropped');
    END IF;
END;
/

-- Step 2: Create table with FOREIGN KEY
CREATE TABLE employees(
    emp_id NUMBER PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary NUMBER(10, 2),
    hire_date DATE,
    dept_id NUMBER,

    -- FOREIGN KEY to departments
    CONSTRAINT fk_dept FOREIGN KEY (dept_id)
         REFERENCES departments(dept_id)
);

-- Step 3: Add comments
COMMENT ON TABLE employees IS 'Stores employee information';
COMMENT ON COLUMN employees.emp_id IS 'Unique employee ID';
COMMENT ON COLUMN employees.dept_id IS 'Department they work in (FK)';

BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE(' EMPLOYEES TABLE CREATED!');
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('New concept: FOREIGN KEY');
    DBMS_OUTPUT.PUT_LINE('connects employees to departments');
END;
/

-- Step 4: Insert sample data
INSERT INTO employees VALUES (101, 'Alice', 'Williams', 'alice@company.com', 60000, DATE '2023-01-15', 1);
INSERT INTO employees VALUES (102, 'Bob', 'Miller', 'bob@company.com', 55000, DATE '2023-03-20', 1);
INSERT INTO employees VALUES (103, 'Charlie', 'Davis', 'charlie@company.com', 48000, DATE '2022-11-01', 2);
INSERT INTO employees VALUES (104, 'Diana', 'Wilson', 'diana@company.com', 52000, DATE '2024-02-10', 3);
COMMIT;

-- Step 5: Practice queries
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE(' PRACTICE QUERIES:');
END;
/

-- Query 1: All employees
SELECT * FROM employees;

-- Query2: JOIN with departments
SELECT e.first_name, e.last_name, e.salary, d.dept_name
FROM employees e 
JOIN departments d ON e.dept_id = d.dept_id;

-- Query3: Employee hired in 2023
SELECT first_name, last_name, hire_date
FROM employee 
WHERE EXTRACT(YEAR FROM hire_date) = 2023;

-- Query4: Average salary by department
SELECT d.dept_name, AVG(e.salary) as avg_salary
FROM employee e 
JOIN departments d ON e.dept_id = d.dept_id
GROUP by d.dept_name;

-- Step6: Today's learning
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('   TODAY''S LEARNING');
    DBMS_OUTPUT.PUT_LINE('1. FOREIGN KEY concept');
    DBMS_OUTPUT.PUT_LINE('2. JOIN operations');
    DBMS_OUTPUT.PUT_LINE('3. DATE data type');
    DBMS_OUTPUT.PUT_LINE('4. GROUP BY for aggregation');
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('   Tomorrow: PROJECTS table');
END;
/