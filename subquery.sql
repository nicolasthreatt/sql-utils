-- SQL Subqueries

SELECT BusinessEntityID
    , SalesYTD
    , (SELECT MAX(SalesYTD)
       FROM Sales.SalesPerson) - SalesYTD AS SalesGap
FROM Sales.SalesPerson
ORDER BY SalesYTD DESC;


SELECT SalesOrderID, SUM(LineTotal) AS OrderTotal
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(LineTotal) >
    (SELECT AVG(ResultTable.MyValues) AS AverageValue
    FROM (SELECT SUM(LineTotal) AS MyValues
        FROM Sales.SalesOrderDetail
        GROUP BY SalesOrderID) AS ResultTable
    )
;


-- Convert Rows to Columns
SELECT 'Average List Price' AS 'Product Line'
      , M, R, S, T
FROM (SELECT ProductLine, ListPrice
      FROM Production.Product) AS SourceData
PIVOT(AVG(ListPrice) FOR ProductLine IN(M, R, S, T)) AS PivotTable;