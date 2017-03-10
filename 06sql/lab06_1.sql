--lab 6 CS342
--Mark Davis
------------

--Exercise 6.1
--a)

SELECT t.name, t.mandate, pt.personID
FROM Team t LEFT OUTER JOIN PersonTeam pt
ON pt.role='chair' AND t.name = pt.teamName;