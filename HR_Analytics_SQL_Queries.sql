
------------------------------------------------------------
-- Create Database
------------------------------------------------------------
CREATE DATABASE HR_Analytics;
GO

USE HR_Analytics;
GO

------------------------------------------------------------
-- Import Dataset
------------------------------------------------------------
/*
Import the HR-Analytics-dataset.csv into SQL Server using:

Right Click Database
→ Tasks
→ Import Flat File
→ Select HR-Analytics-dataset.csv
→ Finish
*/

------------------------------------------------------------
-- View Dataset
------------------------------------------------------------
SELECT *
FROM HR_Analytics;

------------------------------------------------------------
-- Total Employees
------------------------------------------------------------
SELECT COUNT(*) AS TotalEmployees
FROM HR_Analytics;

------------------------------------------------------------
-- Active Employees
------------------------------------------------------------
SELECT COUNT(*) AS ActiveEmployees
FROM HR_Analytics
WHERE Attrition = 0;

------------------------------------------------------------
-- Attrition Count
------------------------------------------------------------
SELECT COUNT(*) AS AttritionCount
FROM HR_Analytics
WHERE Attrition = 1;

------------------------------------------------------------
-- Attrition Rate
------------------------------------------------------------
SELECT
ROUND(
COUNT(CASE WHEN Attrition = 1 THEN 1 END) * 100.0 /
COUNT(*),2
) AS AttritionRate
FROM HR_Analytics;

------------------------------------------------------------
-- Average Age
------------------------------------------------------------
SELECT ROUND(AVG(Age),2) AS AverageAge
FROM HR_Analytics;

------------------------------------------------------------
-- Average Monthly Income
------------------------------------------------------------
SELECT ROUND(AVG(MonthlyIncome),2) AS AverageSalary
FROM HR_Analytics;

------------------------------------------------------------
-- Employee Count by Department
------------------------------------------------------------
SELECT
Department,
COUNT(*) AS EmployeeCount
FROM HR_Analytics
GROUP BY Department
ORDER BY EmployeeCount DESC;

------------------------------------------------------------
-- Employee Count by Job Role
------------------------------------------------------------
SELECT
JobRole,
COUNT(*) AS EmployeeCount
FROM HR_Analytics
GROUP BY JobRole
ORDER BY EmployeeCount DESC;

------------------------------------------------------------
-- Attrition by Department
------------------------------------------------------------
SELECT
Department,
COUNT(*) AS AttritionCount
FROM HR_Analytics
WHERE Attrition = 1
GROUP BY Department
ORDER BY AttritionCount DESC;

------------------------------------------------------------
-- Attrition by Gender
------------------------------------------------------------
SELECT
Gender,
COUNT(*) AS AttritionCount
FROM HR_Analytics
WHERE Attrition = 1
GROUP BY Gender;

------------------------------------------------------------
-- Attrition by Marital Status
------------------------------------------------------------
SELECT
MaritalStatus,
COUNT(*) AS AttritionCount
FROM HR_Analytics
WHERE Attrition = 1
GROUP BY MaritalStatus;

------------------------------------------------------------
-- Attrition by OverTime
------------------------------------------------------------
SELECT
OverTime,
COUNT(*) AS AttritionCount
FROM HR_Analytics
WHERE Attrition = 1
GROUP BY OverTime;

------------------------------------------------------------
-- Average Salary by Department
------------------------------------------------------------
SELECT
Department,
ROUND(AVG(MonthlyIncome),2) AS AvgSalary
FROM HR_Analytics
GROUP BY Department;

------------------------------------------------------------
-- Top 5 Job Roles with Highest Attrition
------------------------------------------------------------
SELECT TOP 5
JobRole,
COUNT(*) AS AttritionCount
FROM HR_Analytics
WHERE Attrition = 1
GROUP BY JobRole
ORDER BY AttritionCount DESC;

------------------------------------------------------------
-- Average Years at Company
------------------------------------------------------------
SELECT ROUND(AVG(YearsAtCompany),2) AS AvgYearsAtCompany
FROM HR_Analytics;

------------------------------------------------------------
-- Work-Life Balance Distribution
------------------------------------------------------------
SELECT
WorkLifeBalance,
COUNT(*) AS EmployeeCount
FROM HR_Analytics
GROUP BY WorkLifeBalance;

------------------------------------------------------------
-- Environment Satisfaction Distribution
------------------------------------------------------------
SELECT
EnvironmentSatisfaction,
COUNT(*) AS EmployeeCount
FROM HR_Analytics
GROUP BY EnvironmentSatisfaction;

------------------------------------------------------------
-- Department-wise Employee Ranking
------------------------------------------------------------
SELECT
Department,
COUNT(*) AS Employees,
RANK() OVER(ORDER BY COUNT(*) DESC) AS DepartmentRank
FROM HR_Analytics
GROUP BY Department;

------------------------------------------------------------
-- Department Summary View
------------------------------------------------------------
CREATE VIEW vw_DepartmentSummary AS
SELECT
Department,
COUNT(*) AS Employees,
AVG(MonthlyIncome) AS AvgSalary
FROM HR_Analytics
GROUP BY Department;

SELECT *
FROM vw_DepartmentSummary;
