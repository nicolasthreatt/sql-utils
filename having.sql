/* 
HAVING Clause
    - Used to filter out entire groups
*/

SELECT Color
     , COUNT(*) AS NumberOfProducts
FROM Production.Product
WHERE COLOR IS NOT NULL
GROUP BY Color
HAVING COUNT(*) > 25;