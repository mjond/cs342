--Mark Davis
--homework 5, CS342
-------------------

--Exercise 1
--a)

SELECT e.first_name, e.last_name
FROM JOB_HISTORY jh, EMPLOYEES e
WHERE e.employee_id=jh.employee_id AND jh.end_date IS NOT NULL;

--b)

SELECT e.first_name, e.last_name, m.first_name, m.last_name
FROM EMPLOYEES e, EMPLOYEES m, JOB_HISTORY jh
WHERE e.manager_id = m.employee_id AND
	e.employee_id = jh.employee_id AND
	e.hire_date < m.hire_date AND
	jh.department_id = m.department_id;

--c)

The countries in which at least one department is located. Try to write this as 
both a join and a nested query. If you can, explain which is better. If you can’t, 
explain which is not possible and why.

--join query
SELECT c.country_id, d.department_name
FROM COUNTRIES c, LOCATIONS l, DEPARTMENTS d
WHERE d.location_id = l.location_id AND
	l.country_id = c.country_id;

--sub-query
--This sub query is not possible for me.
--If it is possible, then it must be messier.
--The join is simple so this is the preferred query.