--homework 5 CS 342
--Mark Davis
---------------------

--Exercise 5.3
--a)

SELECT p.lastName || ', ' || p.firstName || ' and ' || pp.firstName || ' - ' || h.phoneNumber || ' - ' || h.street
FROM Person P, Person pp, Household h
WHERE p.householdID = h.ID AND pp.householdID = h.ID
	AND p.householdRole = 'husband' AND pp.householdRole = 'wife'
	AND p.lastName = pp.lastName;

--b)

SELECT p.lastName || ', ' || p.firstName || ' and ' || pp.firstName || ' ' || pp.lastName || ' - ' || h.phoneNumber || ' - ' || h.street
FROM Person P, Person pp, Household h
WHERE p.householdID = h.ID AND pp.householdID = h.ID
	AND p.householdRole = 'husband' AND pp.householdRole = 'wife';

--c)
SELECT p.lastName || ', ' || p.firstName || ' and ' || pp.firstName || ' ' || pp.lastName || ' - ' || h.phoneNumber || ' - ' || h.street
FROM Person P, Person pp, Household h
WHERE p.householdID = h.ID AND pp.householdID = h.ID
	AND p.householdRole = 'husband' AND pp.householdRole = 'wife'
UNION
SELECT p.lastName || ', ' || p.firstName || ' - ' || h.phoneNumber || ' - ' || h.street
FROM Person P, Household h
WHERE p.householdID = h.ID AND 
	p.householdRole = 'single';