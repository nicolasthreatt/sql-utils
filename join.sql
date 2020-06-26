/*
Why Join Tables?
    - Combine related data
    - Perform comparisons
    - Lookups

Four JOIN Types in SQL Server
    - INNER JOIN
        + Discards unmatched rows
    - LEFT OUTER JOIN
        + Discard rows from the right table
    - RIGHT OUTER JOIN
        + Discard rows from the left table
    - FULL OUTER 
        + Returns every row, regardless of matches
*/

-- Join With Column Alias
SELECT A.BusinessEntityID
     , A.FirstName
     , A.LastName
     , B.PhoneNumber
FROM Person.Person AS A JOIN Person.PersonPhone AS B
    ON A.BusinessEntityID = B.BusinessEntityID;


-- Inner Join
SELECT Person.BusinessEntityID
     , Person.FirstName
     , Person.LastName
     , PersonPhone.PhoneNumber
FROM Person.Person INNER JOIN Person.PersonPhone
    ON Person.BusinessEntityID = PersonPhone.BusinessEntityID;


-- Left Outer Join
SELECT Person.BusinessEntityID
     , Person.FirstName
     , Person.LastName
     , Employee.JobTitle
FROM Person.Person LEFT OUTER JOIN HumanResources.Employee
    ON Person.BusinessEntityID = Employee.BusinessEntityID;


-- Right Outer Join
SELECT Person.BusinessEntityID
     , Person.FirstName
     , Person.LastName
     , Employee.JobTitle
FROM Person.Person RIGHT OUTER JOIN HumanResources.Employee
    ON Person.BusinessEntityID = Employee.BusinessEntityID;


-- Full Outer Join
SELECT Person.BusinessEntityID
     , Person.FirstName
     , Person.LastName
     , Employee.JobTitle
FROM Person.Person FULL OUTER JOIN HumanResources.Employee
    ON Person.BusinessEntityID = Employee.BusinessEntityID;


-- Cross Join
SELECT Department.Name AS DepartmentName
     , AddressType.Name AS AddressName
FROM HumanResources.Department CROSS JOIN Person.AddressType;

-- Cross Join to compare every person against everyone but themselves
SELECT A.Name, B.Name
FROM HumanResources.Department AS A CROSS JOIN HumanResources.Department AS B
WHERE A.Name <> B.Name;