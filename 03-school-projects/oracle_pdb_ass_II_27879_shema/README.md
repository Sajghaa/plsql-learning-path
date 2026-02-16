# Oracle Pluggable Database Management Assignment II

## 📋 Student Information
| Field | Value |
|-------|-------|
| **Name** | Shema |
| **Student ID** | 27879 |
| **Course** | Database Development with PL/SQL (INSY 8311) |
| **Instructor** | Eric Maniraguha |
| **Assignment Date** | February 9, 2026 |
| **Submission Date** | February 16, 2026 |

## 🔧 Oracle Environment
| Component | Details |
|-----------|---------|
| **Oracle Version** | 21c Express Edition (XE) |
| **Operating System** | Windows 64-bit |
| **CDB Name** | XE |
| **Tools Used** | SQL*Plus, Oracle Enterprise Manager (OEM), PL/SQL Developer |
| **Connection Method** | Easy Connect: `localhost:1521/sh_pdb_27879` |

---

# 📌 TASK 1: Create Main Pluggable Database

## 📊 PDB Configuration
| Attribute | Value |
|-----------|-------|
| **PDB Name** | `sh_pdb_27879` |
| **Admin User** | `admin_pdb` |
| **Application User** | `shema_plsqlacua_27879` |
| **Password** | `Oracle123` |

## 💻 SQL*Plus Commands Executed

### Step 1: Set File Destination Parameter
```sql
ALTER SYSTEM SET DB_CREATE_FILE_DEST = 'C:\APP\SERGE\PRODUCT\21C\ORADATA\XE' SCOPE = BOTH;
```

### Step2: Create Pluggable Database
```sql
CREATE PLUGGABLE DATABASE sh_pdb_27879
ADMIN USER admin_pdb IDENTIFIED BY password;
```