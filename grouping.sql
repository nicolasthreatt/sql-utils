/*
The GROUP BY Clause
    - Follows the FROM clause in a select statement
    - Lists the column tht hold the values to consolidate on
    - Groups records together into "buckets"
    - Uses aggregate function to perform calculations on a group, such as COUNT, SUM, MIN, MAX, AVG
*/

-- Get every column and order by city
SELECT *
FROM Person.Address
ORDER BY City;

-- Get each city and count number of addresses for each city
SELECT City
     , StateProvinceID
     , COUNT(*) AS CountOfAddresses
FROM Person.Address
GROUP BY City, StateProvinceID
ORDER BY CountOfAddresses DESC;
