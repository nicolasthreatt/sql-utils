/*
Comparison Operators
    = -  Equals
    < -  Less Than
    > -  Greater Than
    <= - Less than or equal to
    >= - Greater than or equal to
    <> - Not Equal to
*/

SELECT Name, TaxRate
FROM Sales.SalesTaxRate
WHERE TaxRate = 7.25;

SELECT Name, TaxRate
FROM Sales.SalesTaxRate
WHERE TaxRate >= 7.25;

-- Find Records in a Range
SELECT Name, TaxRate
FROM Sales.SalesTaxRate
WHERE (TaxRate >= 7) AND (TaxRate <= 10);