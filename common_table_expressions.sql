/*
Common Table Expressions
    - A temportary structure that contains separate data that the main query
      and is self-referencing
*/

-- Use a CTE to get an aggregate of an aggregate
-- Could be useful to show if stat was above average, average, or below average
WITH Sales_CTE(Yr, WeekNum, WeeklySales)
AS
(
    SELECT 
           YEAR(DueDate) AS Yr
         , DATEPART(wk, DueDate) AS WeekNum
         , Sum(UnitPrice * OrderQty) AS WeeklySales
    FROM Purchasing.PurchaseOrderDetail
    GROUP BY
          YEAR(DueDate)
        , DATEPART(wk, DueDate)
)
SELECT *
     , CASE WHEN WeeklySales > 200000 THEN 1 ELSE 0 END AS 'Profitable'
FROM Sales_CTE
ORDER BY 1,2
GO

-- Summarize by Year, Month, Week
WITH Sales_CTE (Yr, WeekNum, WeeklySales)
AS
(
    SELECT 
           YEAR(DueDate) AS Yr
         , DATEPART(wk, DueDate) AS WeekNum
         , Sum(UnitPrice * OrderQty) AS WeeklySales
    FROM Purchasing.PurchaseOrderDetail
    GROUP BY
          YEAR(DueDate)
        , DATEPART(wk, DueDate)
)
SELECT Yr
     , SUM(CASE WHEN WeeklySales > 200000 THEN 1 ELSE 0 END) AS 'Profitable'
FROM Sales_CTE
GROUP BY Yr
ORDER BY 1
