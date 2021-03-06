--Mark Davis
--CS342 project queries
--March 31, 2017

--four inner joins using tuple variables
--this is helpful to administrators to monitor comments on games
--this query returns all user comments on games including the teams that played in the game and the score
select ua.username, t.name, g.teamOneScore, t2.name, g.teamTwoScore, gc.UserComment
from UserAccount ua, Team t, Team t2, Game g, GameComment gc
where ua.id=gc.userId and
	gc.gameId=g.id and
	g.teamOneId=t.id and
	g.teamTwoId=t2.id;

--nested select statment
--this helpful to users looking for players on real teams only
--this query returns all players who are on real teams, not fantasy teams
select p.firstName, p.lastName, p.position, p.goals, p.assists
from Player p 
where not exists (select *
		from Player pe, Team t
		where pe.teamId=t.id and
		t.type = 'fantasy');

--aggregate statistics on grouped data
--this is helpful for users to find out average goals per team
--this query returns the average number of goals for each team
select t.name, avg(p.goals) as avgGoals
from Team t, Player p
where p.teamId=t.id
group by t.name
order by avgGoals desc;

--left outer join
--this is helpful for users to see all players who are and are not on a team
--this query returns all players, even if they do not belong to a team (have to team id)
select t.name, p.firstName, p.lastName
from Player p left outer join Team t
on t.id = p.teamId;

--NULL query
--this is helpful to find players who are not on a team so they can be assigned to a team
--this query returns all players whose teamId is NULL
select id, firstName, lastName
from Player
where teamId is null;

--self-join
--this is helpful to get players not on the same team 
--this query returns players first names and last names
select p1.firstName, p1.lastName, p2.firstName, p2.lastName
from Player p1, Player p2
where p1.teamId <> p2.teamId;

--outer inner combo
--this is helpful to retrieve all users with their teams and players - players are still returned even if they're not on a team 
--this query returns user names, team names, player names
select ua.username, t.name, p.firstName, p.lastName 
from Player p left outer join Team t on p.teamId = t.id
inner join ua UserAccount, ut UserTeam
	ua.id = ut.userId and
	t.id = ut.teamId;

--non-materialized view
--I chose materialized because the user's will get results faster when queried
--this is helpful to users to query to find out information of players and their teams
create materialized view playerTeam as
	select p.firstName, p.lastName, p.id, p.goals, p.assists, p.teamId, t.name, t.type
	from Player p, Team t
	where p.teamId=t.id;

drop materialized view playerTeam;