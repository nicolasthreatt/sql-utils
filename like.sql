/*
LIKE Wildcard Characters
        %     - Any string of zero or more characters
        _     - Any single character
    [ABCDEF]  - Any single character in set
    [^ABCDEF] - Any single character not in set
      [A-F]   - Any single character in range
*/

-- Match text with LIKE and wildcards
SELECT FirstName
From Person.Person
WHERE FirstName LIKE 'A%'     -- First Name that Starts with letter 'A'

SELECT FirstName
From Person.Person
WHERE FirstName LIKE '%A'     -- First Name that Ends with letter 'A'

SELECT FirstName
From Person.Person
WHERE FirstName LIKE 'A___'   -- First Name that Starts with letter 'A' and has 3 additional letters