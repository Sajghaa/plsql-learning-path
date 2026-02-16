# Oracle Pluggable Database Management Assignment II

## Student Information
| Field | Value |
|-------|-------|
| **Name** | Shema Serge |
| **Student ID** | 27879 |
| **Course** | Database Development with PL/SQL (INSY 8311) |
| **Instructor** | Eric Maniraguha |
| **Assignment Date** | February 9, 2026 |
| **Submission Date** | February 16, 2026 |

## Oracle Environment
| Component | Details |
|-----------|---------|
| **Oracle Version** | 21c Express Edition (XE) |
| **Operating System** | Windows 64-bit |
| **CDB Name** | XE |
| **Tools Used** | SQL*Plus, Oracle Enterprise Manager (OEM), PL/SQL Developer |
| **Connection Method** | Easy Connect: `localhost:1521/sh_pdb_27879` |

---

# TASK 1: Create Main Pluggable Database

##  PDB Configuration
| Attribute | Value |
|-----------|-------|
| **PDB Name** | `sh_pdb_27879` |
| **Admin User** | `admin_pdb` |
| **Application User** | `shema_plsqlauca_27879` |
| **Password** | `Oracle123` |

##  SQL*Plus Commands Executed

### Step 1: Set File Destination Parameter
```sql
ALTER SYSTEM SET DB_CREATE_FILE_DEST = 'C:\APP\SERGE\PRODUCT\21C\ORADATA\XE' SCOPE = BOTH;
```

### Step2: Create Pluggable Database
```sql
CREATE PLUGGABLE DATABASE sh_pdb_27879
ADMIN USER admin_pdb IDENTIFIED BY password;
```
### Step3: Open and Save PDB State
```sql
ALTER PLUGGABLE DATABASE sh_pdb_27879 OPEN;
ALTER PLUGGABLE DATABASE sh_pdb_27879 SAVE STATE;
```

### Step4: Verify PDB is Open
```sql
SELECT name, open_mode FROM v$pdbs WHERE name = 'SH_PDB_27879';
```

### Step5: Switch to PDB Container
```sql
ALTER SESSION SET CONTAINER = sh_pdb_27879;
```

### Step6: Create Application User
```sql
CREATE USER shema_plsqlauca_27879 IDENTIFIED BY Oracle123;
```

### Step7: Grant Required Privileges
```sql
GRANT CREATE SESSION, CREATE TABLE, CREATE PROCEDURE TO shema_plsqlauca_27879;
GRANT UNLIMITED TABLESPACE TO shema_plsqlauca_27879;
```

### Step8: Verify User Creation
```sql
SELECT username, created, account_status 
FROM dba_users 
WHERE username = 'SHEMA_PLSQLAUCA_27879';
```

## Task 1 Screenshots

| Step | Description | Screenshot |
|-----------|-------|-------|
| **1** | **PDB Creation Successful** |`screenshots/task1/01_pdb_creations.png`|
| **2** | **PDB Open State Verification** |`screenshots/task1/02_pdb_open.png`|
| **3** | **User Creation Inside PDB** |`screenshots/task1/05_create_user.png`|
| **4** | **User Verification** |`screenshots/task1/07_verification_of_user_creation.png`|

# TASK 2: Create and Delete Temporary PDB

##  Temporary PDB Configuration
| Attribute | Value |
|-----------|-------|
| **PDB Name** | `sh_to_delete_pdb_27879` |
| **Admin User** | `temp_admin` |
| **Password** | `temp123` |
| **Status** | Successfully created and completely deleted |

##  SQL*Plus Commands Executed

### Create Temporary PDB
```sql
ALTER SYSTEM SET DB_CREATE_FILE_DEST = 'C:\APP\SERGE\PRODUCT\21C\ORADATA\XE' SCOPE = BOTH;

CREATE PLUGGABLE DATABASE sh_to_delete_pdb_27879
ADMIN USER temp_admin IDENTIFIED BY temp123;

ALTER SYSTEM SET DB_CREATE_FILE_DEST = '' SCOPE = BOTH;
```

### Step2: Open Temporary PDB
```sql
ALTER PLUGGABLE DATABASE sh_to_delete_pdb_27879 OPEN;
```

### Step3: Verify Temporary PDB Exists
```sql
SELECT name, open_mode FROM v$pdbs WHERE name LIKE '%TO_DELETE%';
```

### Step4: Close Temporary PDB
```sql
ALTER PLUGGABLE DATABASE sh_to_delete_pdb_27879 CLOSE IMMEDIATE;
```

### Step5: Delete Temporary PDB Completely
```sql
DROP PLUGGABLE DATABASE sh_to_delete_pdb_27879 INCLUDING DATAFILES;
```

### Step6: Verify Deletion
```sql
SELECT name FROM v$pdbs WHERE name LIKE '%TO_DELETE%';
-- Expected: "no rows selected"
```


## Task 2 Screenshots

| Step | Description | Screenshot |
|-----------|-------|-------|
| **1** | **Temporary PDB Creation** |`screenshots/task2/02_create_temporary_pdb.png`|
| **2** | **Verification PDB Exists** |`screenshots/task2/05_verify_if_it_exists.png`|
| **3** | **PDB Deletion Command** |`screenshots/task2/07_delete_it_completly.png`|
| **4** | **Verification PDB Deleted** |`screenshots/task2/08_verify_deletion`|


# Task3: Oracle Enterprise Manager(OEM)
##  OEM Configuration
| Attribute | Value |
|-----------|-------|
| **OEM URL** | `https://localhost:5500/em` |
| **Username** | `sys`(SYSDBA) |
| **Password** | `Oracle123` |
| **Port** | 5500 |
| **Connection Type** | HTTPS with self-signed certificate |
| **Status** | Successfully configured and accessible |

# OEM Dashboard Overview
The Oracle Enterprise Manager dashboard provides comprehensive monitoring and management of the oracle environment.

### Database Instance Information
- **Database Name**: XE
- **Type**: Single Instance(Express Edition)
- **Version**: 21.3.0.0.0
- **Platform**: Microsoft Windows x86 64-bit
- **Uptime**: 5+ hours (Operational since last restart)
- **CDB Status**: Container Database with 2 Pluggable Databases

## Pluggable Database
The CDB contains the following PDBs:
1. **PDB$SEED** - Default seed template
2. **SH_PDB_** - User-created PDB for this assignment

## Performance Metrics
The OEM dashboard displays:
- System activity and services
- Resource utilization
- SQL monitoring
- Incidents  and alerts(none reported)

## OEM Access Process
### Step1: Verify OEM is Running
```bash
lsnrctl status
```
Output confirms port 5500 is active for HTTPs connections. 
### Step2: Access OEM via Browser
```text
https://localhost:5500/em
```
### Step3: Login Credentials
- Username: **sys**
- Password: **Oracle123**
- Connect AS: **SYSDBA**
- Container Name: (leave blank)

### Step4: Navigate Dashboard
- Home page shows database summary
- CDB status with PDB count visible 
- Performance charts and alerts

## Task3 Screenshot

| Step | Description | Screenshot |
|-----------|-------|-------|
| **1** | **OEM Dashboard Overview** |`screenshots/task2/02_create_temporary_pdb.png`|
 
# CHALLENGES FACED AD SOLUTIONS
## Challenge 1: File Path Errors(ORA-65005)
**Issue**: Initial PDB creation failed with error:
```text
ORA-65005: missing or invalid file name pattern for file - 
C:\APP\SERGE\PRODUCT\21C\ORADATA\XE\PDBSEED\SYSTEM01.DBF
```

### Screenshot Validation
The OEM dashboard screenshot confirms:
✅ OEM Accessibility: Successfully accessed via HTTPS on port 5500
✅ Database Environment: XE CDB running on Windows
✅ PDB Count: "CDB (2 PDB(s))" visible in status section
✅ My PDB: sh_pdb_27879 is one of the two PDBs
✅ User Session: "sys" username visible in top-right corner
✅ System Status: Database up for 5+ hours with no incidents