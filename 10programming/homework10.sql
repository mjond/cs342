--Mark Davis
--April 21, 2017
--Homework 10

--Exercise 1

--Write a PL/SQL procedure that receives two movie IDs and an integer amount and “transfers” a 
--given amount of rank value from a source movie to a destination movie. Note that this doesn’t 
--make much sense in the context of the movie database, but it’s similar to money transfers in a 
--banking database.

--Your procedure should be designed in such a way that it can be run simultaneously by the following 
--sample script to separate threads and still give a consistent result.

--Your procedure should check the values it receives, raising exceptions as appropriate.
--Don’t allow the rank value to drop below 0.
--To make your transaction logic explicit, please use declared exceptions as follows.

create or replace procedure transferRank(movieOneId as integer, movieTwoId as integer, transferAmount as integer)
	valueError exception;
begin
	--if the transfer amount is less than 0, raise an exception
	if transferAmount < 0 then
		raise valueError;
	end if;

	--take value from Movie 1
	update Movie m
		set rank=rank-transferAmount
		where m.id=movieOneId;

	--to add to Movie 2
	update Movie m
		set rank=rank+transferAmount
		where m.id=movieTwoId;

exception
	when valueError then
		raise_application_error(-20001, 'Cannot transfer rank value that is less than 0');

end;
