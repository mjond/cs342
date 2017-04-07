--Mark Davis
--cs342, homework 8
--April 6, 2017

--Exercise 2

create table baconTable (
	actor varchar(25),
	baconNumber integer
);

create or replace procedure bacon (actorId in integer) as

	