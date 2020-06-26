/*
Using Aggregate Functions
    - Added to the column list in a query's SELECT clause
    - FunctionName(TableColumn)
    - Add a descriptive alias with AS
    - Must include 'GROUP BY' when performing an aggregation
    - 'OVER' performs an aggregation across a range of rows

Aggregate Function
    - COUNT(*)
    - COUNT(DISTINCT Column)
    - COUNT_BIG(Column)
    - SUM(Column)
    - AVG(Column)
    - MIN(Column)
    - MAX(Column)
    - STDEV(Column)
    - VAR(Column)
    - VARP(Column)
    - APPROX_COUNT_DISTINCT
*/

SELECT SalesOrderID
     , SUM(LineTotal) AS OrderTotal
     , SUM(OrderQty) AS NumberOfItems
     , SUM(DISTINCT ProductID) AS UniqueItems
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY OrderTotal DESC;

SELECT SalesOrderDetail.ProductID
     , Product.Name
     , SUM(OrderQty) AS TotalQtySold
FROM Sales.SalesOrderDetail INNER JOIN Production.Product
    ON Sales.SalesOrderDetail.ProductID = Production.Product.ProductID
GROUP BY SalesOrderDetail.ProductID, Product.Name
ORDER BY TotalQtySold DESC;