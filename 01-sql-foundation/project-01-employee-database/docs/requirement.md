# 📋 Business Requirements - UPDATED

## Company Profile
**XYZ Corporation** is a mid-sized company with 500+ employees across 
multiple departments and locations. Currently operating in 3 countries
with plans for international expansion.

## Updated Data Entities:

### 1. Countries (NEW - For Internationalization)
- Country codes (ISO standard for future-proofing)
- Country names for reporting
- Region grouping for analytics

### 2. Locations  
- Office addresses across different countries
- Cities and states/provinces
- Country reference (foreign key to countries)

### 3. Departments
- Department names and IDs
- Department hierarchy
- Physical location (city/country)
- Budget allocation

### 4. Jobs
- Job titles and IDs
- Salary ranges
- Position grades

### 5. Employees
- Personal details
- Employment information
- Salary and benefits
- Manager relationships

### 6. Projects
- Project details
- Timeline and budget
- Status tracking
- Location/country reference

## Why Countries Table Was Added:
- **Future Expansion**: Planning for international offices
- **Data Consistency**: Standard ISO codes prevent duplicates
- **Normalization**: One place to update country names
- **Reporting**: Country-wise analysis ready from day one