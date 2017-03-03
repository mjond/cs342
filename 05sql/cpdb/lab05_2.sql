--Mark Davis
--CS342 lab 5
-------------

--Exercise 5.2

--a)
--This is correlated
SELECT firstName, lastName, birthdate
FROM Person
WHERE birthdate = (select max(birthdate) from Person);

--This is not correlated
SELECT *
FROM (select * from Person WHERE birthdate IS NOT NULL ORDER BY birthdate desc)
WHERE rownum = 1;


--b)
--This is correlated
SELECT ID, firstName, lastName
FROM Person
WHERE firstName in (select firstName from Person		
					group by firstName having count(firstName) > 1);
					
--c)
--This is correlated
--sub set query
SELECT p.firstName, p.lastName
FROM Person p, PersonTeam pt
WHERE p.ID = pt.personID AND pt.teamName = 'Music' AND NOT EXISTS (select * FROM Homegroup h 
			WHERE p.homeGroupID = h.ID AND h.name = 'Byl');
			
--set operations
--THis is not correlated
SELECT p.firstName, p.lastName
FROM Person p, PersonTeam pt
WHERE p.ID = pt.personID AND pt.teamName = 'Music'
MINUS
(select p.firstName, p.lastName 
FROM Homegroup h, Person p 
WHERE p.homeGroupID = h.ID AND h.name = 'Byl');

