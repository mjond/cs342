-- Starter code for lab 3.
--
-- CS 342, Spring, 2017
-- kvlinden

--Mark Davis mjd85
--lab03 CS342

drop table HouseHold;
drop table Person;
drop table PersonTeam;
drop table Request;
drop table Homegroup;
drop table Team;


create table HouseHold(
	ID integer PRIMARY KEY,
	street varchar(30),
	city varchar(30),
	state varchar(2),
	zipcode char(5),
	phoneNumber char(12)
	);

create table Homegroup (
	ID integer PRIMARY KEY NOT NULL,
	name varchar(15), --name of the group
	location varchar(25) --where the group meets
);

create table Team (
	ID integer PRIMARY KEY,
	name varchar(15), --name of the team
	role varchar(15) -- what the team's function is
);


create table Person (
	ID integer PRIMARY KEY,
	householdId integer, --what house a person belongs to
	role varchar(20), --what role a person has in a household
	title varchar(4),
	firstName varchar(15),
	lastName varchar(15),
	homegroupId integer,
	membershipStatus char(1) CHECK (membershipStatus IN ('m', 'a', 'c')),
	menteeId integer, --points to mentee
	--foreign key (menteeId) references Person(ID) ON DELETE SET NULL,
	foreign key (householdId) references HouseHold(ID) ON DELETE SET NULL,
	foreign key (homegroupId) references Homegroup(ID) ON DELETE SET NULL
	);
	
create table PersonTeam (
	personId integer,
	teamId integer,
	role varchar(15), --what the person's role is (deacon, elder)
	duration varchar (15), --amount of time a person is part of a team. I used varchar so it can be week, months, days, years - whichever time measurement
	foreign key (personId) references Person(ID) ON DELETE CASCADE,
	foreign key (teamId) references Team(ID) ON DELETE CASCADE
);

create table Request (
	submitDate date PRIMARY KEY,
	text varchar(100),
	accessKey varchar(5),
	responseAssignee integer,
	foreign key (responseAssignee) references Person(ID) ON DELETE CASCADE
);

INSERT INTO Homegroup VALUES (1, 'Bible Study', 'kvlinden house');

INSERT INTO Team VALUES (1, 'deacons', 'deacon');

INSERT INTO PersonTeam values (0, 1, 'deacon', '1 year');

INSERT INTO Household VALUES (0,'2347 Oxford Dr. SE','Grand Rapids','MI','49506','616-243-5680');

INSERT INTO Person VALUES (0, 0, 'ownder', 'mr.','Keith','VanderLinden', 1, 'm', 1);
INSERT INTO Person VALUES (1, 0, 'owner', 'ms.','Brenda','VanderLinden', 1, 'm', 1);
	
INSERT INTO Request Values (2017-02-02, "I need cookies", "abc", 0);

