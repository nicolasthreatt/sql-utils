/*
Ranking
    - A value for each row in partition indicating its position in the result set

Ranking Functions
    - RANK()
        + Skips if there is a tie (1 1, 3, 3, 3, 6, 7, 8)
    - DENSE_RANK()
        + Does not skip if there is a tie (1 2, 3, 4, 5, 6, 7, 8)
    - ROW_NUMBER()
        + Returns index position of the row based on specified order
    - PERCENT_RANK()
        + Calculate relative rank of a row within a group of rows
        + Could be useful to find relative rank for stats across conferences or clusters of teams
*/

-- ROW_NUMBER() method
SELECT 
       ROW_NUMBER() OVER (ORDER BY SUM(UnitPrice * OrderQty) DESC) AS 'Rank'
     , COUNT(ProductID) AS ProductID
     , SUM(UnitPrice * OrderQty) AS Sales
FROM Purchasing.PurchaseOrderDetail
GROUP BY ProductID      -- Must use group by in order for aggregation to work properly
ORDER BY 3 DESC;


-- RANK() method
SELECT 
       ROW_NUMBER() OVER (ORDER BY SUM(UnitPrice * OrderQty) DESC) AS 'Row Number'
     , COUNT(ProductID) AS ProductID
     , RANK() OVER (ORDER BY SUM(UnitPrice * OrderQty) DESC) AS 'Rank'
     , SUM(UnitPrice * OrderQty) AS Sales
FROM Purchasing.PurchaseOrderDetail
GROUP BY ProductID      -- Must use group by in order for aggregation to work properly
ORDER BY 4 DESC;


-- Show top rank product sub categories for each year
SELECT 
       ROW_NUMBER() OVER (ORDER BY SUM(UnitPrice * OrderQty) DESC) AS 'Row Number'
    --  , COUNT(ProductID) AS ProductID
     , OrderQty
     , RANK() OVER (PARTITION BY YEAR(DueDate) ORDER BY SUM(UnitPrice * OrderQty) DESC) AS 'Rank'
     , SUM(UnitPrice * OrderQty) AS Sales
     , YEAR(DueDate) 'Year'
FROM Purchasing.PurchaseOrderDetail
GROUP BY
         OrderQty      -- Must use group by in order for aggregation to work properly
       , YEAR(DueDate)
ORDER BY
         YEAR(DueDate)
       , SUM(UnitPrice * OrderQty)  
