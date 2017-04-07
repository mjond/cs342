--Mark Davis
--lab 9, cs342
--April 7, 2017

--Exercise 9.1

SET AUTOTRACE ON; 
SET SERVEROUTPUT ON;
SET TIMING ON;
/*
--a)
declare
	counter integer;
begin
	for i in 1..100 loop
		select count(*) into counter
		from Director;
	end loop;
end;
/

declare
	counter integer;
begin
	for i in 1..100 loop
		select count(1) into counter
		from Director;
	end loop;
end;
/

declare
	counter integer;
begin
	for i in 1..100 loop
		select sum(1) into counter
		from Director;
	end loop;
end;
/
*/
--count(*) time is 00:00:00:12
--count(1) time is 00:00:00:12
--sum(1) time is 00:00:00:27
--there is a benefit to use either count(1) or count(*) since they are less than half the time
-- to run rather than sum(1)

/*
--b)
declare
	dir integer;
begin
	for i in 1..100 loop
		select count(*) into dir
		from Director d DirectorGenre dg
		where dg.directorId = d.id;
	end loop;
end;
/

declare
	dir integer;
begin
	for i in 1..100 loop
		select count(*) into dir
		from DirectorGenre dg, Director d
		where dg.directorId = d.id;
	end loop;
end;
/
*/
--there is no difference in changing the FROM order


--c)
/*
declare
	dir integer;
begin
	for i in 1..10 loop
		select count(*) into dir
		from Role r, Actor a
		where r.actorId+0=a.id+0;
	end loop;
end;
/

--elapsed time: 00:00:05:84

declare
	dir integer;
begin
	for i in 1..10 loop
		select count(*) into dir
		from Role r, Actor a
		where r.actorId=a.id;
	end loop;
end;
/
*/
--elapsed time: 00:00:00:54
--arithmetic expressions in join conditions affect a query's efficiency, it's much slower with arithmetic


--d)
/*
declare
	dir integer;
begin
	for i in 1..10 loop
		select count(*) into dir
		from Role r, Actor a
		where r.actorId=a.id;
	end loop;
end;
/
*/
--first run: 00:00:00:53
--second run: 00:00:00:53
--third run: 00:00:00:54

--running the same query more than once does not affect its performance.


--e)
--no index 
select count(*)
from Role r1 join Role r2
on r1.actorId=r2.movieID;
--elapsed time: 00:00:01:48

--with index
create index newIndex on Role(movieID, actorID);

select count(*) 
from Role r1 join Role r2
on r1.actorId=r2.movieId;

--does not run, runs out of temp segment in tablespace
