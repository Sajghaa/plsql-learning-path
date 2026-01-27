# 🏢 Employee Database System

## 📋 Project Overview
A comprehensive employee management database system demonstrating SQL fundamentals including table creation, constraints, relationships, and CRUD operations.

## 🎯 Learning Objectives
- Design and implement a normalized database schema
- Apply various SQL constraints (PK, FK, CHECK, UNIQUE)
- Write complex queries with JOIN operations
- Understand data integrity and referential integrity
- Prepare for academic exams with practical scenarios

## 🏗️ Database Schema
The system manages:
- **Departments** with hierarchy
- **Employees** with personal details
- **Salaries** and job history
- **Projects** assignment
- **Locations** and offices

## 📊 Tables Overview
1. `departments` - Department information
2. `employees` - Employee master data
3. `salaries` - Salary history
4. `projects` - Company projects
5. `employee_projects` - Many-to-many relationship
6. `job_history` - Employee job changes
7. `locations` - Office locations
8. `countries` - Country reference

## 🚀 Getting Started

### Prerequisites
- Oracle Database 11g or higher
- SQL Developer or similar tool
- Basic SQL knowledge

### Installation
1. Clone the repository
2. Navigate to this project folder
3. Run scripts in order:
```bash
cd scripts/
@01-create-schema.sql
@02-insert-data.sql