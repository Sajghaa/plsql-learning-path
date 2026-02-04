BEGIN
    DBMS_OUTPUT.PUT_LINE('===================================');
    DBMS_OUTPUT.PUT_LINE('DAY 7: CLEANUP AND REVIEW');
    DBMS_OUTPUT.PUT_LINE('===================================');
END;
/

-- Drop tables in reverse order (due to foreign keys)
DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('Dropping tables...');
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE employee_projects';
        DBMS_OUTPUT.PUT_LINE('  employee_projects dropped');
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE projects';
        DBMS_OUTPUT.PUT_LINE('  projects dropped');
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE employees';
        DBMS_OUTPUT.PUT_LINE('  employees dropped');
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE departments';
        DBMS_OUTPUT.PUT_LINE('  departments dropped');
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('   All tables removed.');
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('   WHAT YOU LEARNED IN 7 DAYS:');
    DBMS_OUTPUT.PUT_LINE('1. CREATE TABLE with constraints');
    DBMS_OUTPUT.PUT_LINE('2. PRIMARY KEY and FOREIGN KEY');
    DBMS_OUTPUT.PUT_LINE('3. INSERT, UPDATE, DELETE data');
    DBMS_OUTPUT.PUT_LINE('4. SELECT queries with JOINs');
    DBMS_OUTPUT.PUT_LINE('5. GROUP BY and aggregation');
    DBMS_OUTPUT.PUT_LINE('6. Many-to-many relationships');
    DBMS_OUTPUT.PUT_LINE('7. ALTER TABLE operations');
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE(' Ready for the next project!');
END;
/