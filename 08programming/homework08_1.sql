--Mark Davis
--cs342 homework 8
--April 5, 2017

--Exercise 1

drop table shadowLog;

create table shadowLog (
	userId integer,
	changeDate date,
	originalValue integer,
	newValue integer,
	PRIMARY KEY (userId, originalValue, newValue)
);

--trigger to get original value before the update
create or replace trigger shadowLogger
	before update on Movie
	for each row
begin
	insert into shadowLog (userId, changeDate, originalValue)
		values (Current_user, sysDate, Movie.rank);
end;

--trigger to get the new value after the update
create or replace trigger shadowLogger
	after update on Movie
	for each row
begin
	insert into shadowLog (newValue)
		values (Movie.rank);
end;