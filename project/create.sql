--Mark Davis
--CS342 Project Design
--March 3, 2017

--This database is intended to be used for fantasy hockey. See vision statement.
--------------------------------------------

--drop tables
DROP TABLE UserTeam;
DROP TABLE Goalie;
DROP TABLE Player;
DROP TABLE GameComment;
DROP TABLE Game;
DROP TABLE Team;
DROP TABLE UserAccount cascade constraints;


--create tables

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
	birthYear integer
);

CREATE TABLE Player (
	id integer PRIMARY KEY,
	firstName varchar(15),
	lastName varchar(15),
	goals integer,
	assists integer,
	position varchar(15),
	teamId integer,
	FOREIGN KEY (teamId) REFERENCES Team(id) ON DELETE CASCADE
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
	score varchar(5),
	FOREIGN KEY (teamOneId) REFERENCES Team(id) ON DELETE CASCADE,
	FOREIGN KEY (teamOneId) REFERENCES Team(id) ON DELETE CASCADE,
	FOREIGN KEY (winner) REFERENCES Team(id) ON DELETE CASCADE
);

CREATE TABLE GameComment (
	id integer PRIMARY KEY,
	userId integer,
	gameId integer,
	UserComment varchar(60),
	FOREIGN KEY (userId) REFERENCES UserAccount(id) ON DELETE CASCADE,
	FOREIGN KEY (gameId) REFERENCES Game(id) ON DELETE CASCADE
);


--Sample Records

INSERT INTO UserAccount VALUES (1, 'winner', 'password', 'expert', 'Chuck', 'Norris', 1965);
INSERT INTO UserAccount VALUES (2, 'hockeyFan', 'qwerty', 'mediocre', 'Bob', 'Vance', 1988);
INSERT INTO UserAccount VALUES (3, 'Crosby111', 'hockey', 'beginner', 'Bruce', 'Wayne', 1980);

INSERT INTO Team VALUES (1, 'Maple Leafs', 5, 'real');
INSERT INTO Team VALUES (2, 'Canadiens', 5, 'real');
INSERT INTO Team VALUES (3, 'Guardians of the Galaxy', 5, 'real');
INSERT INTO Team VALUES (4, 'Avengers', 5, 'real');

--Maple Leafs
INSERT INTO Player VALUES (1, 'Austin', 'Matthews', 31, 24, 'center', 1);
INSERT INTO Player VALUES (2, 'Mitch', 'Marner', 15, 33, 'rover', 1);
INSERT INTO Player VALUES (3, 'Nazem', 'Kadr', 25, 22, 'left wing', 1);
INSERT INTO Player VALUES (4, 'William', 'Nylander', 17, 27, 'center', 1);
INSERT INTO Player VALUES (5, 'Connor', 'Brown', 15, 12, 'rover', 1);

--Canadiens
INSERT INTO Player VALUES (6, 'Max', 'Pacioretty', 31, 25, 'left wing', 2);
INSERT INTO Player VALUES (7, 'Alexander', 'Radulov', 15, 31, 'right wing', 2);
INSERT INTO Player VALUES (8, 'Shea', 'Weber', 14, 23, 'defense', 2);
INSERT INTO Player VALUES (9, 'Andrei', 'Markov', 4, 23, 'defense', 2);
INSERT INTO Player VALUES (10, 'Paul', 'Byron', 14, 15, 'center', 2);

--Guardians of the Galaxy
INSERT INTO Player VALUES (11, 'Wayne', 'Gretzky', 894, 1963, 'forward', NULL);
INSERT INTO Player VALUES (12, 'Mark', 'Messier', 694, 1193, 'forward', NULL);
INSERT INTO Player VALUES (13, 'Gordon', 'Howe', 801, 1049, 'forward', NULL);
INSERT INTO Player VALUES (14, 'Ray', 'Bourque', 717, 873, 'defense', NULL);
INSERT INTO Player VALUES (15, 'Paul', 'Coffey', 396, 1135, 'defense', NULL);

--Avengers
INSERT INTO Player VALUES (16, 'Erik', 'Karlsson', 10, 45, 'forward', NULL);
INSERT INTO Player VALUES (17, 'Mark', 'Stone', 22, 25, 'forward', NULL);
INSERT INTO Player VALUES (18, 'Kyle', 'Turris', 22, 22, 'defense', NULL);
INSERT INTO Player VALUES (19, 'Mike', 'Hoffman', 19, 22, 'forward', NULL);
INSERT INTO Player VALUES (20, 'Derick', 'Brassard', 11, 22, 'defense', NULL);

--Goalies
INSERT INTO Goalie VALUES (1, 'Carey', 'Price', 0.920, 2);
INSERT INTO Goalie VALUES (2, 'Frederik', 'Andersen', 0.915, 1);
INSERT INTO Goalie VALUES (3, 'Curtis', 'McElhinney', 0.938, 1);
INSERT INTO Goalie VALUES (4, 'Cory', 'Schneider', 0.923, 3);
INSERT INTO Goalie VALUES (5, 'Corey', 'Crawford', 0.917, 4);