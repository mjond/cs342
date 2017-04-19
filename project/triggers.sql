--Mark Davis
--Project Application
--April 21, 2017

--this trigger ensures that no more than 20 players can be on a team at one time

create or replace trigger teamFull before insert on UserTeam for each row 
declare
	counter integer;
	tooManyTeams exception;
begin
	select count(*) into counter from UserTeam ut, UserAccount ua, Team t
	where ua.id=ut.userId and
		t.id=ut.teamId;
	if counter > 5 then
		raise tooManyteams;
	end if;

exception
	when tooManyTeams then
		RAISE_APPLICATION_ERROR(-20001, 'User has too many teams. The limit is five teams per user.')
end;
/