-- WHERE clause filters data in specific columns

SELECT *
FROM HumanResources.Department
WHERE GroupName = 'Research and Development';

SELECT *
FROM HumanResources.Department
WHERE GroupName <> 'Research and Development';   -- Not Equals Syntax

SELECT *
FROM HumanResources.Department
WHERE (GroupName <> 'Research and Development') AND (DepartmentID < 10);  -- Multiple Predicates

SELECT *
FROM HumanResources.Employee
WHERE HireDate BETWEEN '2013-01-01' AND '2013-12-31';                     -- Filter for a specific date range   

SELECT *
FROM HumanResources.Department
WHERE GroupName IN('Research and Development', 'Quality Assurance')  -- Multiple values from a column