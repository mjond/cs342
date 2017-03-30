--Mark Davis
--March 30, 2017
--homework 7, CS342

--Exercise 7.2
--Repeat the previous exercise, but this time use a materialized view. 
--Pay particular attention to what changes in the view and in the table respectively.

--create view
create materialized view birthdayCzar as
select p.firstName, p.lastName, p.birthdate, trunc(months_between(sysdate, birthdate)/12) as age
from Person p;

--a)
select firstName, lastName, trunc(months_between(sysdate, birthdate)/12) as age
from birthdayCzar
where birthdate between '01-JAN-1961' and '31-DEC-1975';
--returns three people like in the lab with a non-materialized view

--b)
update birthdayCzar set birthdate='21-FEB-1965'
where birthdate is null;
--this update operation does not work because 'data manipulation operation not legal on this view'
--i tried to make the materialized view updatable but the error was:
-- "updatable materialized views must be simple enough to do fast refresh"

--updatable materialized view would be:
--create materialized view birthdayCzar for update as
--select p.firstName, p.lastName, p.birthdate, trunc(months_between(sysdate, birthdate)/12) as age
--from Person p;

--c)
insert into birthdayCzar (firstName, lastName, birthdate)
values ('joe', 'johnson', '01-FEB-1985');
--this update operation does not work because 'data manipulation operation not legal on this view'
--i tried to make the materialized view updatable but the error was:
-- "updatable materialized views must be simple enough to do fast refresh"

--updatable materialized view would be:
--create materialized view birthdayCzar for update as
--select p.firstName, p.lastName, p.birthdate, trunc(months_between(sysdate, birthdate)/12) as age
--from Person p;

--d)
drop materialized view birthdayCzar;
--dropping a materialized view is successful