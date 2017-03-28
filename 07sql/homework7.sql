--Mark Davis
--march 31, 2017
--CS 342, homework 7


-- *** 1. Create a view of all employees and their department; include the employee ID, name, 
--        email, hire date and department name. Then write SQL commands to do the following:
create view employeeView as
	select e.employee_id, e.first_name, e.last_name, e.email, e.hire_date, d.department_name
	from EMPLOYEES e, DEPARTMENTS d
	where e.department_id=d.department_id;

-- a) Get the name and ID of the newest employee in the “Executive” department.
select first_name, last_name, employee_id, max(hire_date) as newest
from employeeView
group by employee_id;

-- b) Change the name of the “Administration” department to “Bean Counting”.
update employeeView set department_name='Bean counting'
where department_name='Administration';

-- c) Change the name of “Jose Manuel” to just “Manuel”
update employeeView set first_name=NULL
	where first_name='Jose' and last_name='Manuel';

-- d) Insert a new employee in the “Payroll” department (make up appropriate data for this record).
insert into employeeView (first_name, last_name, email, hire_date, department_name)
	values ('joe', 'johnson', 'jjj55@jmail.com', 01-01-1991, 'Payroll');

--If any of these view-based queries won’t work, show the query and explain why it 
--generates an error.


-- *** 2. Redo the previous exercise with a materialized view.

-- create view
create materialized view employeeView as
	select e.employee_id, e.first_name, e.last_name, e.email, e.hire_date, d.department_name
	from EMPLOYEES e, DEPARTMENTS d
	where e.department_id=d.department_id;

-- a) Get the name and ID of the newest employee in the “Executive” department.
select first_name, last_name, employee_id, max(hire_date) as newest
from employeeView
group by employee_id;

-- b) Change the name of the “Administration” department to “Bean Counting”.
update employeeView set department_name='Bean counting'
where department_name='Administration';

-- c) Change the name of “Jose Manuel” to just “Manuel”
update employeeView set first_name=NULL
	where first_name='Jose' and last_name='Manuel';

-- d) Insert a new employee in the “Payroll” department (make up appropriate data for this record).
insert into employeeView (first_name, last_name, email, hire_date, department_name)
	values ('joe', 'johnson', 'jjj55@jmail.com', 01-01-1991, 'Payroll');

--If any of these view-based queries won’t work, show the query and explain why it 
--generates an error.


-- *** 3. Write the following queries as specified:

-- a) The query on which your view from exercise 1 is based - Write this query using both 
--    the relational algebra and tuple relational calculus, with respect to the original 
--    HR relations.

--relational algebra
-- PI_firstName,lastName,employee_id,email,hire_date,department_name(THETA_E.department_id=d.department_id D)

--tuple relational calculus
-- {e.employee_id, e.first_name, e.last_name, e.email, e.hire_date, d.department_name |
--		Employee(e), Department(d) ^ e.department_id=d.department_id}

-- b) The query from exercise 1.a - Write this query using (only) the relational calculus, with respect to DeptView.

PI_firstName,lastName(SIGMA_gender=f(Student)) for the algebra
{s1 | Student(s) ^ s.gender='female'} for the calculus.