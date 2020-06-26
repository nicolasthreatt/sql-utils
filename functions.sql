/*
Function Categories
    - Aggregate function to summarize data in groups
    - String functions for working with text
    - Mathematical functions for working with numerical data
    - Data and time functions for calculating time intervals
    - Logical functions evaluate conditions and return values

FUNCTION(argument1, argument2)
*/

-- String Functions
SELECT FirstName
     , LastName
     , UPPER(FirstName) AS UpperCase
     , LOWER(LastName) AS LowerCase
     , LEN(FirstName) AS LengthOfFirstName
     , LEFT(LastName, 3) AS FirstThreeLetter
     , RIGHT(LastName, 3) AS LastThreeLetter
     , TRIM(LastName) AS TrimmedName
FROM Person.Person;


-- Text Concatenation
SELECT FirstName
     , LastName
     , CONCAT(FirstName, ' ', MiddleName, ' ', LastName) AS FullName
     , CONCAT_WS(' ', FirstName, MiddleName, LastName) AS WithSeperators
FROM Person.Person;


-- Mathematical Functions
SELECT BusinessEntityID
     , SalesYTD
     , ROUND(SalesYTD, 2) AS Round2
     , ROUND(SalesYTD, -2) AS RoundHundreds
     , CEILING(SalesYTD) AS RoundCeiling
     , FLOOR(SalesYTD) AS RoundFloor
FROM Sales.SalesPerson;


-- Date Functions
SELECT BusinessEntityID
     , HireDate
     , YEAR(HireDate) AS HireYear
     , MONTH(HireDate) AS HireMonth
     , DAY(HireDate) AS HireDay
FROM HumanResources.Employee;

SELECT YEAR(HireDate) AS HireYear, COUNT(*) AS NewHires
FROM HumanResources.Employee
GROUP BY YEAR(HireDate);

SELECT GETDATE()
SELECT GETUTCDATE()

SELECT MAX(HireDate) AS MaxDate
FROM HumanResources.Employee;

SELECT BusinessEntityID
     , HireDate
     , DATEDIFF(day, HireDate, GETDATE()) AS DaysSinceHire
     , DATEDIFF(year, HireDate, GETDATE()) AS YearsSinceHire
     , DATEADD(year, 10, HireDate) AS AnniversityDate
FROM HumanResources.Employee;

SELECT BusinessEntityID
     , HireDate
     , FORMAT(HireDate, 'dddd, MMMM dd, yyyy') AS FormattedDate
FROM HumanResources.Employee

-- Get Total Stats for each month
SELECT EOMONTH(DueDate)          AS Month
     , Sum(UnitPrice * OrderQty) AS Sales
FROM Purchasing.PurchaseOrderDetail
GROUP BY
    EOMONTH(DueDate)
ORDER BY 1

-- Calculcate a monthly average of stats tenture (Could be useful to graph)
SELECT
       EOMONTH(DueDate) AS Month
     , COUNT(1) AS 'StatCount'
FROM Purchasing.PurchaseOrderDetail
GROUP BY
    EOMONTH(DueDate)
ORDER BY 2 DESC

-- Return random records with NEWID
SELECT TOP(10) WorkOrderID
    , NEWID() AS NewID
FROM Production.WorkOrder
ORDER BY NewID;

-- IIF logical function
SELECT IIF(SalesYTD > 2000000, 'Met sales goal', 'Has not met goal') AS Status
      , COUNT(*)
FROM Sales.SalesPerson
GROUP BY IIF(SalesYTD > 2000000, 'Met sales goal', 'Has not met goal');

SELECT *
FROM Purchasing.PurchaseOrderDetail;