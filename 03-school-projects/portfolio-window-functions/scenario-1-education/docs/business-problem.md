# Scenario 1: Education Analytics - Student Success Patterns

## Executive Summary
A mid-sized university struggles with student retention and wants to identify at-risk students before they drop out. They need a data-driven approach to understand performance patterns across courses, semesters, and student demographics.

## The Client
- **Name**: Kigali International University (fictional)
- **Size**: 5,000+ students, 200+ faculty
- **Problem**: 15% dropout rate between Year 1 and Year 2

## Business Questions
The Dean of Academics needs answers to:

### Operational Questions (JOINs focus)
1. Which students have never enrolled in any course? (LEFT JOIN)
2. What courses have no enrollments this semester? (RIGHT JOIN)
3. How do students compare to others in the same major? (SELF JOIN)
4. What's the complete picture of student-course relationships? (FULL JOIN)

### Analytical Questions (Window Functions focus)
1. Who are the top 10% performers in each department? (NTILE, RANK)
2. How does a student's performance trend across semesters? (LAG, LEAD)
3. What's the 3-semester moving average of grades per course? (AVG OVER)
4. Which courses have the highest grade variance? (Aggregate windows)

## Success Criteria
- Identify patterns that predict student dropout
- Create early warning system for academic advisors
- Optimize course scheduling based on performance trends
- Provide department chairs with actionable insights

## Data Strategy
We'll analyze 3 years of historical data across:
- Student demographics and enrollment status
- Course catalog with department and credit hours
- Semester-by-semester enrollment and grades

## Expected Deliverables
1. Clean relational schema with sample data
2. Business-meaningful JOIN queries with interpretations
3. Window function analysis revealing hidden patterns
4. Actionable recommendations for the university

## Stakeholders
- **Primary**: Dean of Academics (decision maker)
- **Secondary**: Department Chairs, Academic Advisors
- **Tertiary**: Students (indirect beneficiaries)

## Notes
This is a refined version of an academic assignment, transformed into a professional case study with realistic business context.