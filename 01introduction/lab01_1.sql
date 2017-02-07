--a
SELECT * FROM Departments;

--b
SELECT COUNT(employee_id) FROM EMPLOYEES;

--c i.
SELECT employee_id FROM EMPLOYEES
	WHERE salary>15000; 

--c ii.
SELECT employee_id FROM EMPLOYEES
	WHERE hire_date >= TO_DATE('20020101', 'YYYYMMDD') AND 
	hire_date <= TO_DATE('20041231', 'YYYYMMDD');
	
--c iii.
SELECT employee_id FROM EMPLOYEES
	WHERE phone_number NOT LIKE '515%';
	
--d
SELECT first_name || ' ' || last_name as fullname 
	FROM EMPLOYEES
	WHERE department_id=100
	ORDER BY first_name;
	
--e
SELECT city, state_province, country_name FROM locations, countries, regions
WHERE regions.region_name='Asia' AND countries.region_id = regions.region_id
AND locations.country_id = countries.country_id;

--f
SELECT location_id FROM LOCATIONS
WHERE state_province IS NULL;


	
