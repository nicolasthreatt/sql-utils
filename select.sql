-- Select Specific Columns
--     SELECT Column1, Column2, Column3
--     From Schema.Table
SELECT Name, GroupName
FROM HumanResources.Department;


-- Select All Columns
--     SELECT *
--     From Schema.Table
SELECT *
FROM HumanResources.Department;


-- Rename Columns with AS clause
SELECT Name AS 'Department Name', GroupName AS 'Management Group'
FROM HumanResources.Department;


-- Create Values with Constants
SELECT Name,
       ProductNumber,
       'AdventureWorks' AS 'Manufacturer',
       ListPrice * 0.85 AS SalePrice
FROM Production.Product;


-- Remove Duplicates
SELECT DISTINCT CITY, StateProvinceID
FROM Person.Address
ORDER BY City;


-- Check for NULL data
SELECT WorkOrderID, ScrappedQty, ISNULL(ScrapReasonID, 99) AS ScrapReason
FROM Production.WorkOrder;
