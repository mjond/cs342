--Mark Davis
--CS342 project queries
--March 31, 2017

Demonstrate your ability to use the following SQL features somewhere in your queries/view.
c	a join of at least four tables
	proper comparisons of NULL values
c	a self-join using tuple variables
	a combination of inner and outer joins
c	a nested select statement
c	aggregate statistics on grouped data

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
--this helpful to users looking to make a team
--this query returns all players who have at least 1 goal and at least 1 assist for drafting purposes
select p.firstName, p.lastName, p.position, p.goals, p.assists
from Player p 
where (select *
		from Player pe
		where pe.goals <> 0 or pe.goals is not null and
		pe.assists <> 0 or p.assists is not null);

--aggregate statistics on grouped data
--this is helpful for users to find out average goals per team
--this query returns the average number of goals for each team
select t.name, avg(p.goals) as avgGoals
from Team t, Player p
where p.teamId=t.id
group by t.name
order by avgGoals desc;

--left outer join
--
--