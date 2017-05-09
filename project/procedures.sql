--Mark Davis
--Project Application
--April 21, 2017

--this procedure adds a player to the Player table and assigns the player to a team as long as the team does
--not have more than 20 players.

create or replace procedure insertPlayer(playerIdIn IN integer, firstNameIn IN Player.firstName%type, lastNameIn IN Player.lastName%type, goalsIn IN integer, assistsIn IN integer, positionIn IN Player.position%type, teamIdIn IN integer) as 
	counter integer;
begin
	lock table Player
	in exclusive mode;
	select count(*) into counter from Player p, Team t
		where t.id=p.teamId;
	if counter > 20 then
		RAISE_APPLICATION_ERROR(-20001, 'Too many plaers are on the team ' || teamIdIn || ' will not fit on the team');
	end if;
	insert into Player(id, firstName, lastName, goals, assists, position, teamId) values
		(playerIdIn, firstNameIn, lastNameIn, goalsIn, assistsIn, positionIn, teamIdIn);
	commit;
	dbms_output.put_line('Player ' || playerIdIn || ' was succesfully added to the team: ' || teamIdIn);
end;