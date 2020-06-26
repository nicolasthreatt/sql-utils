-- ORDER BY sorts data

-- Ascending Order is default
SELECT *
FROM HumanResources.Department
ORDER BY GroupName;

-- Descending order must be specified
SELECT *
FROM HumanResources.Department
ORDER BY GroupName DESC;


-- Sort by Multiple Columns
SELECT *
FROM HumanResources.Department
ORDER BY GroupName DESC, DepartmentID;

-- ORDER BY should be placed after WHERE
SELECT *
FROM HumanResources.Department
WHERE GroupName IN('Research and Development', 'Quality Assurance')  -- Multiple values from a column
ORDER BY GroupName, DepartmentID;
