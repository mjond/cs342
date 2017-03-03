--Mark Davis
--CS342 lab5
------------

--Exercise  5.1

--a)
--128 rows are selected because it selects all records from Household and Person.
SELECT *
FROM Household, Person;

--b)
SELECT firstName, lastName, birthdate
FROM Person
WHERE birthdate IS NOT NULL
ORDER BY TO_CHAR(birthdate, 'DDD') ASC;