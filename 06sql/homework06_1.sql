--Mark Davis mjd85
--homework 6, cs342
--March 17, 2017
-------------------

--Exercise 1 

--a)
--The IDs and full names of managers and the number of employees each of them manages. Order 
--the results by decreasing number of employees and return only the top ten results.
select m.employee_id, m.first_name, m.last_name, COUNT(e.employee_id)
from EMPLOYEES m, EMPLOYEES e
where e.manager_id=m.employee_id and rownum < 10;
group by m.employee_id, m.first_name, m.last_name
order by COUNT(e.employee_id) desc;

--b)
--The name, number of employees and total salary for each department outside of the US with less than 100 
--employees. The total salary is the sum of the salaries of each of the department's employees.
select d.department_name, COUNT(e.employee_id), SUM(e.salary)
from DEPARTMENTS d, EMPLOYEES e, LOCATIONS l, COUNTRIES c
where d.location_id = l.location_id and 
l.country_id = c.country_id and
c.country_name <> 'United States of America'
group by d.department_name
having COUNT(e.employee_id) < 100;

--c)
--The department name, department manager name and manager job title for all departments. If 
--the department has no manager, include it in the output with NULL values for the manager and title.
select d.department_name, e.first_name, e.last_name, j.title
from DEPARTMENTS e left outer join EMPLOYEES e, JOBS j
on e.employee_id=d.manager_id and
e.job_id=j.job_i;

--d)
--The name of each department along with the average salary of the employees of that department. If a department 
--has no employees, include it in the list with no salary value. Order your results by decreasing salary. 
--You may order the NULL-valued salaries however you’d like.
select d.department_name, avg(e.salary) as average
from DEPARTMENTS d left outer join EMPLOYEES e
on e.department_id=d.department_id
group by d.department_name
order by avg(e.salary) desc;