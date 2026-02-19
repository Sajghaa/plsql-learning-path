-- CLEAN SLATE UTILITY - Oracle 21c

-- Run this before rebuilding schema to ensure fresh start
-- No more "table doesn't exist" errors


SET SERVEROUTPUT ON SIZE UNLIMITED
SET FEEDBACK OFF

DECLARE
   v_count NUMBER;
BEGIN
   DBMS_OUTPUT.PUT_LINE(' Starting clean slate operation...');
   
   -- Drop tables in correct order (respect foreign keys)
   FOR t IN (SELECT table_name FROM user_tables 
             WHERE table_name IN ('ENROLLMENTS_AUDIT', 'ENROLLMENTS', 'COURSES', 'STUDENTS')
             ORDER BY 
                CASE table_name
                   WHEN 'ENROLLMENTS_AUDIT' THEN 1
                   WHEN 'ENROLLMENTS' THEN 2
                   WHEN 'COURSES' THEN 3
                   WHEN 'STUDENTS' THEN 4
                END DESC)
   LOOP
      EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS PURGE';
      DBMS_OUTPUT.PUT_LINE('    Dropped: ' || t.table_name);
   END LOOP;
   
   -- Drop sequences
   FOR s IN (SELECT sequence_name FROM user_sequences 
             WHERE sequence_name IN ('STUDENT_SEQ', 'COURSE_SEQ', 'ENROLLMENT_SEQ'))
   LOOP
      EXECUTE IMMEDIATE 'DROP SEQUENCE ' || s.sequence_name;
      DBMS_OUTPUT.PUT_LINE('    Dropped sequence: ' || s.sequence_name);
   END LOOP;
   
   -- Check if anything was dropped
   SELECT COUNT(*) INTO v_count FROM user_tables 
   WHERE table_name IN ('ENROLLMENTS_AUDIT', 'ENROLLMENTS', 'COURSES', 'STUDENTS');
   
   IF v_count = 0 THEN
      DBMS_OUTPUT.PUT_LINE(' Clean slate ready - no existing objects found');
   ELSE
      DBMS_OUTPUT.PUT_LINE('  Some objects may remain - check manually');
   END IF;
   
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(' Error: ' || SQLERRM);
      DBMS_OUTPUT.PUT_LINE('Continuing with remaining operations...');
END;
/

SET FEEDBACK ON