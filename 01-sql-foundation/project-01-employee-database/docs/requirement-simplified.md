# 📋 Business Requirements - UPDATED

## Company Profile
**XYZ Corporation** is a mid-sized company with 500+ employees across 
multiple departments and locations. Currently operating in 3 countries
with plans for international expansion.


### 1. DEPARTMENTS
- Department ID (unique)
- Department name
- Manager (employee reference)
- Location information
- Budget
- Parent department (for hierarchy)

### 2. EMPLOYEES
- Employee ID (unique)
- Full name (first, middle, last)
- Contact info (email, phone)
- Date of birth
- Hire date
- Job title
- Salary
- Department (foreign key to departments)
- Manager (foreign key to employees)

### 3. PROJECTS
- Project ID
- Project name and code
- Start and end dates
- Budget
- Status
- Department

### 4. LOCATIONS
- Location ID
- Address details
- Contact information
- Department assignment

## Relationships:
1. Department → Location (one-to-one)
2. Department → Employees (one-to-many)
3. Employee → Projects (many-to-many)
4. Employee → Manager (self-referencing)
5. Department → Sub-departments (self-referencing)

## NO COUNTRIES TABLE (for now)
We'll embed country/city in locations if needed.