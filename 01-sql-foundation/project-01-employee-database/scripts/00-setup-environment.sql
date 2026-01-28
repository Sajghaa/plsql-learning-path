/*
===========================================
EMPLOYEE DATABASE - ENVIRONMENT SETUP (VS Code)
===========================================
Purpose: Configure environment for VS Code
Note: Some SQL*Plus commands won't work in VS Code
===========================================
*/

-- These work in VS Code Oracle Extension
SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET FEEDBACK ON;

-- Display header in VS Code output
BEGIN
    DBMS_OUTPUT.PUT_LINE('╔══════════════════════════════════════════════════╗');
    DBMS_OUTPUT.PUT_LINE('║      EMPLOYEE DATABASE SYSTEM - SETUP           ║');
    DBMS_OUTPUT.PUT_LINE('╠══════════════════════════════════════════════════╣');
    DBMS_OUTPUT.PUT_LINE('║ Author: Sajghaa                                 ║');
    DBMS_OUTPUT.PUT_LINE('║ Date: ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI') || '                   ║');
    DBMS_OUTPUT.PUT_LINE('╚══════════════════════════════════════════════════╝');
    DBMS_OUTPUT.PUT_LINE('');
END;
/

-- Check database connection and privileges
DECLARE
    v_user VARCHAR2(30);
    v_has_priv NUMBER;
BEGIN
    -- Get current user
    SELECT USER INTO v_user FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('✅ CONNECTED AS: ' || v_user);
    DBMS_OUTPUT.PUT_LINE('✅ DATABASE TIME: ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS'));
    
    -- Check CREATE TABLE privilege
    SELECT COUNT(*) INTO v_has_priv
    FROM user_sys_privs 
    WHERE privilege = 'CREATE TABLE';
    
    IF v_has_priv > 0 THEN
        DBMS_OUTPUT.PUT_LINE('✅ PRIVILEGES: CREATE TABLE - GRANTED');
    ELSE
        DBMS_OUTPUT.PUT_LINE('❌ PRIVILEGES: CREATE TABLE - NOT GRANTED');
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient privileges. Contact your DBA.');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('✅ ENVIRONMENT READY FOR DATABASE CREATION');
    DBMS_OUTPUT.PUT_LINE('');
END;
/

-- Show available tablespaces (good to know for storage)
DECLARE
    CURSOR c_tablespaces IS
        SELECT tablespace_name, status, contents
        FROM user_tablespaces
        WHERE tablespace_name NOT LIKE 'TEMP%'
        ORDER BY tablespace_name;
BEGIN
    DBMS_OUTPUT.PUT_LINE('📊 AVAILABLE TABLESPACES:');
    DBMS_OUTPUT.PUT_LINE(RPAD('Name', 20) || RPAD('Status', 10) || 'Contents');
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 50, '-'));
    
    FOR ts IN c_tablespaces LOOP
        DBMS_OUTPUT.PUT_LINE(
            RPAD(ts.tablespace_name, 20) || 
            RPAD(ts.status, 10) || 
            ts.contents
        );
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('');
END;
/

-- Display next steps
BEGIN
    DBMS_OUTPUT.PUT_LINE('🚀 NEXT STEPS:');
    DBMS_OUTPUT.PUT_LINE('   1. Review requirements in docs/requirements.md');
    DBMS_OUTPUT.PUT_LINE('   2. Open scripts/01-create-countries.sql');
    DBMS_OUTPUT.PUT_LINE('   3. Execute the CREATE TABLE statement');
    DBMS_OUTPUT.PUT_LINE('   4. Verify table creation');
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('💡 TIP: Use "Execute Current Statement" for single commands');
    DBMS_OUTPUT.PUT_LINE('      Use "Execute Script" for multiple commands');
END;
/