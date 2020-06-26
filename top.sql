-- Limit number of Queries with TOP clause -- 

-- Select top 3 Queries
SELECT TOP(3) TaxRate, Name
From Sales.SalesTaxRate;

Select TOP(3) TaxRate, Name
From Sales.SalesTaxRate
ORDER BY TaxRate DESC;

-- Select top 3 Quereis with Ties
SELECT TOP 3 WITH TIES TaxRate, Name
From Sales.SalesTaxRate
ORDER BY TaxRate;

-- Select half of the number of queries
Select TOP 50 PERCENT TaxRate, Name
FROM Sales.SalesTaxRate;
