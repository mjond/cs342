--Mark Davis
--Lab 7, CS342
--March 17, 2017
----------------

--Exercise 7.1

create view birthdayCzar as
select firstName, lastName, birthdate, trunc(months_between(sysdate, birthdate)/12) as age
from Person;


--a)
select firstName, lastName, trunc(months_between(sysdate, birthdate)/12) as age
from birthdayCzar
where birthdate between '01-JAN-1961' and '31-DEC-1975';
--3 results

--b)
update birthdayCzar set birthdate='21-FEB-1965'
where birthdate is null;
--9 rows selected after running first query

--c)
--insert into birthdayCzar (firstName, lastName, birthdate)
--values ('joe', 'johnson', '01-FEB-1985');
--INserting into this view is not possible becuase age is computed in creating the
--view. So in order to insert a age, it has to be computed in the INSERT command

--d)
drop view birthdayCzar;
--dropping the view does not affect the base table
