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
where ROWNUM=1
group by first_name, last_name, employee_id;

-- b) Change the name of the “Administration” department to “Bean Counting”.
update employeeView set department_name='Bean counting'
where department_name='Administration';
--this update does not work. The base table is not stored so the update operation cannot
--go back to the original table and the primary key to change the name

-- c) Change the name of “Jose Manuel” to just “Manuel”
update employeeView set first_name=NULL
	where first_name='Jose' and last_name='Manuel';
--this operation works but 0 rows were selected.

-- d) Insert a new employee in the “Payroll” department (make up appropriate data for this record).
insert into employeeView (first_name, last_name, email, hire_date, department_name)
	values ('joe', 'johnson', 'jjj55@jmail.com', '01-JUN-1990', 'Payroll');
	--this insert does not work becuase it 'cannot modify more than one base tbale through a join view'



-- *** 2. Redo the previous exercise with a materialized view.

-- create view
create materialized view employeeView as
	select e.employee_id, e.first_name, e.last_name, e.email, e.hire_date, d.department_name
	from EMPLOYEES e, DEPARTMENTS d
	where e.department_id=d.department_id;

-- a) Get the name and ID of the newest employee in the “Executive” department.
select first_name, last_name, employee_id, max(hire_date) as newest
from employeeView
where ROWNUM=1
group by first_name, last_name, employee_id;
--this query is successful

-- b) Change the name of the “Administration” department to “Bean Counting”.
update employeeView set department_name='Bean counting'
where department_name='Administration';
--query is unsuccesful becuase 'data manipulation operation not legal in this view'

-- c) Change the name of “Jose Manuel” to just “Manuel”
update employeeView set first_name=NULL
	where first_name='Jose' and last_name='Manuel';
--query is unsuccesful becuase 'data manipulation operation not legal in this view'

-- d) Insert a new employee in the “Payroll” department (make up appropriate data for this record).
insert into employeeView (first_name, last_name, email, hire_date, department_name)
	values ('joe', 'johnson', 'jjj55@jmail.com', '01-SEP-1990', 'Payroll');
--query is unsuccesful becuase 'data manipulation operation not legal in this view'



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

-- {first_name, last_name, employee_id, max(hire_date) | employeeView ^ rownum=1 ^ group by first_name, last_name, employee_id }