BEGIN
    DBMS_OUTPUT.PUT_LINE('Checking for existing departments table...');
END;
/

-- Step 2: Drop if the table exists (for practice)
DECLARE
    table_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO table_count
    FROM user_tables
    WHERE table_name = 'DEPARTMENTS';

    IF table_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE departments';
        DBMS_OUTPUT.PUT_LINE('Old table dropped');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('No table found. Creating new one');
    END IF;
END;
/

--Step 3: Create table (Simple Version)
CREATE TABLE DEPARTMENTS(
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    manager_name VARCHAR(100),
    budget NUMBER(10, 2)
);

-- Step4: Add some commments
COMMENT ON TABLE departments IS 'Stores department information';
COMMENT ON COLUMN departments.dept_id IS 'Unique department ID';
COMMENT ON COLUMN departments.dept_name IS 'Name of the department';

-- Step5: Show confirmation
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('DEPARTMENTS TABLE CREATED!');
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Columns');
    DBMS_OUTPUT.PUT_LINE('1. dept_id (PRIMARY KEY)');
    DBMS_OUTPUT.PUT_LINE('2. dept_name (NOT NULL)');
    DBMS_OUTPUT.PUT_LINE('3. manager_name');
    DBMS_OUTPUT.PUT_LINE('4. budget');
END;
/

-- Step 6: Insert sample data
INSERT INTO departments VALUES (1, 'IT', 'JOhn Smith', 50000);
INSERT INTO departments VALUES (2, 'HR', 'Sarah Johnson', 30000);
INSERT INTO departments VALUES (3, 'Sales', 'Mike Brown', 45000);
COMMIT;

-- Step 7: Practice queries
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('PRACTICE QUERIES:');
    DBMS_OUTPUT.PUT_LINE('');
END;
/
-- Query 1: Se all departments
SELECT * FROM departments;
-- Query 2: Count departments
SELECT COUNT(*) as total_departments FROM departments;
-- Query 3: Departments with budget > 35000
SELECT dept_name, budget
FROM departments
WHERE budget > 35000
ORDER BY budget DESC;

-- Step 8: What we learned today
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('   TODAY''S LEARNING');
    DBMS_OUTPUT.PUT_LINE('1. CREATE TABLE syntax');
    DBMS_OUTPUT.PUT_LINE('2. PRIMARY KEY constraint');
    DBMS_OUTPUT.PUT_LINE('3. NOT NULL constraints');
    DBMS_OUTPUT.PUT_LINE('4. INSERT data');
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('  Tomorrow: EMPLOYEES table');
END;
/