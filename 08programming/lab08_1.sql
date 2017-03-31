--Mark Davis
--lab 8, cs342
--March 31, 2017

create or replace trigger check230 before insert on Role for each row
declare
	counter230 integer;
	counter integer;
begin
	--check for more than 230 casting
	select count(*) into counter230 from Role
	where movieId=:new.movieId;
	
	if counter230 >= 230 then
		RAISE_APPLICATION_ERROR(-20001, 'full cast: ' ||:new.movieId);
	end if;
	
	--check for same actor in cast
	select count(*) into counter from Role
	where movieId=:new.movieId and
		actorId=:new.actorId;
		
	if counter >= 1 then
		RAISE_APPLICATION_ERROR(-20001, 'same actor found: ' ||:new.actorId);
	end if;		

end;
/	
	
create or replace procedure addActor
(actorIDIn in Role.actorId%type, movieIdin in Role.movieId%type, rolein in Role.role%type) as
	counter integer;
begin	
	insert into Role(actorId, movieId, role) values
		(actorIDIn, movieIdin, rolein);
	dbms_output.put_line('inserted student');
end;
/

--condition 1 from lab page
begin addActor (89558, 238072, 'Danny Ocean'); end;
/
--conndition 2 from lab page
begin addActor (89558, 238073, 'Danny Ocean'); end;
/
--condition 3 from lab page
begin addActor(89558, 167324, 'Danny Ocean'); end;
/