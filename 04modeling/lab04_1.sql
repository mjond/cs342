-- This command file loads an experimental person relation.
-- The data conforms to the following assumptions:
--     * Person IDs and team names are unique for people and teams respectively.
--     * People can have at most one mentor.
--     * People can be on many teams, but only have one role per team.
--     * Teams meet at only one time.
--
-- CS 342
-- Spring, 2017
-- kvlinden

--Exercise 4.1
--a)
--First, there is no primary key in this table so there is nothing unique about it.
--Second, this table also violates the four informal guidelines from the textbook.
--This table's semantics of the attributes is not clear.
--This table allows redundant information to be stored
--It looks like someone took a NULL machine gun to the INSERTS - as said in class.
--This table allows spurious tables becuase there is no primary key so the wrong information could be queried.

-- functional dependencies are:
-- personId -> name, status
-- mentorId -> mentorName, mentorStatus
-- teamName -> teamRole, teamTime 

-- super key is:
-- personId, teamName is the superkey because those combined is what makes each record unique.
-- This is not BCNF form because for any non-trivial functional dependency, X -> A,
-- X is not a super key.


--b)
--Person(personId <<primary key>>, name, status, mentorId)
--Team(teamId <<primary key>>, teamName, teamRole, teamTime)
--PersonTeam(personId <<foreign key>>, teamId <<foreign key>>, role)

--this is a better schema because it is in BCNF, 
-- it reduces NULL values,
-- the table's semantics of attributes are clear,
-- reduces redundant information,
-- does not allow spurious tables.

drop table AltPerson;

CREATE TABLE AltPerson (
	personId integer,
	name varchar(10),
	status char(1),
	mentorId integer,
	mentorName varchar(10),
	mentorStatus char(1),
    teamName varchar(10),
    teamRole varchar(10),
    teamTime varchar(10)
	);

INSERT INTO AltPerson VALUES (0, 'Ramez', 'v', 1, 'Shamkant', 'm', 'elders', 'trainee', 'Monday');
INSERT INTO AltPerson VALUES (1, 'Shamkant', 'm', NULL, NULL, NULL, 'elders', 'chair', 'Monday');
INSERT INTO AltPerson VALUES (1, 'Shamkant', 'm', NULL, NULL, NULL, 'executive', 'protem', 'Wednesday');
INSERT INTO AltPerson VALUES (2, 'Jennifer', 'v', 3, 'Jeff', 'm', 'deacons', 'treasurer', 'Tuesday');
INSERT INTO AltPerson VALUES (3, 'Jeff', 'm', NULL, NULL, NULL, 'deacons', 'chair', 'Tuesday');
