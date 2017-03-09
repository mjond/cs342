--Mark Davis
--CS342 Project Design
--March 9, 2017

--This database is intended to be used for fantasy hockey. See vision statement.
--------------------------------------------

CREATE TABLE Team (
	id integer PRIMARY KEY,
	name varchar(25),
	numberOfPlayers integer,
	type varchar(10) -- if the team is fantasy or real
);

CREATE TABLE UserAccount (
	id integer PRIMARY KEY,
	username varchar(15),
	password varchar(15),
	rank varchar(15), --beginner, expert, etc
	firstName varchar(15),
	lastName varchar(15),
	birthYear integer,
	CONSTRAINT chk_rank CHECK (rank IN ('beginner', 'medium', 'expert', 'legend'))
);

CREATE TABLE Player (
	id integer PRIMARY KEY,
	firstName varchar(15),
	lastName varchar(15),
	goals integer,
	assists integer,
	position varchar(15),
	teamId integer,
	FOREIGN KEY (teamId) REFERENCES Team(id) ON DELETE CASCADE,
	CHECK (goals >= 0),
	CHECK (assists >= 0),
	CONSTRAINT chk_position CHECK (position IN ('rover', 'forward', 'defense', 'center', 'left wing', 'right wing'))
);


CREATE TABLE Goalie (
	id integer PRIMARY KEY,
	firstName varchar(15),
	lastName varchar(15),
	savePercentage decimal,
	teamId integer,
	FOREIGN KEY (teamId) REFERENCES Team(Id) ON DELETE CASCADE
);

CREATE TABLE UserTeam (
	teamId integer,
	userId integer,
	FOREIGN KEY (teamId) REFERENCES Team(id) ON DELETE CASCADE,
	FOREIGN KEY (userId) REFERENCES UserAccount(id) ON DELETE CASCADE
);

CREATE TABLE Game (
	id integer PRIMARY KEY,
	teamOneId integer,
	teamTwoId integer,
	winner integer,
	teamOneScore integer,
	teamTwoScore integer,
	FOREIGN KEY (teamOneId) REFERENCES Team(id) ON DELETE CASCADE,
	FOREIGN KEY (teamTwoId) REFERENCES Team(id) ON DELETE CASCADE,
	FOREIGN KEY (winner) REFERENCES Team(id) ON DELETE CASCADE,
	CHECK (teamOneScore >= 0),
	CHECK (teamTwoScore >= 0)
);

CREATE TABLE GameComment (
	id integer PRIMARY KEY,
	userId integer,
	gameId integer,
	UserComment varchar(60),
	FOREIGN KEY (userId) REFERENCES UserAccount(id) ON DELETE CASCADE,
	FOREIGN KEY (gameId) REFERENCES Game(id) ON DELETE CASCADE
);