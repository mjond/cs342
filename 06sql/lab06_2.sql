--lab 6 CS342
--Mark Davis
------------

--Exercise 6.2
--a)

Select AVG(TRUNC(MONTHS_BETWEEN(SYSDATE, p.birthdate)/12))
FROM Person p;

--b)
Select h.ID, COUNT(p.id)
FROM Household h, Person p
WHERE p.householdID = h.ID AND h.city='Grand Rapids'
GROUP BY h.ID 
HAVING COUNT(p.id) >= 2
ORDER BY count(p.id) desc;

--c)
Select h.ID, h.phoneNumber, COUNT(p.id)
FROM Household h, Person p
WHERE p.householdID = h.ID AND h.city='Grand Rapids'
GROUP BY h.ID, h.phoneNumber 
HAVING COUNT(p.id) >= 2
ORDER BY count(p.id) desc;