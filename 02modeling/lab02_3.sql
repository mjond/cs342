--homework exercise 2.4
--Mark Davis

-- Drop current database
DROP TABLE Casting;
DROP TABLE Movie;
DROP TABLE Performer;

-- Create database schema
CREATE TABLE Movie (
	id integer,
	title varchar(70) NOT NULL, 
	year decimal(4), 
	score float,
	PRIMARY KEY (id),
	CHECK (year > 1900)
	);

CREATE TABLE Performer (
	id integer,
	name varchar(35),
	PRIMARY KEY (id)
	);

CREATE TABLE Casting (
	movieId integer,
	performerId integer,
	status varchar(6),
	FOREIGN KEY (movieId) REFERENCES Movie(Id) ON DELETE CASCADE,
	FOREIGN KEY (performerId) REFERENCES Performer(Id) ON DELETE SET NULL,
	CHECK (status in ('star', 'costar', 'extra'))
	);

--SEQUENCE HERE
CREATE SEQUENCE movie_seq
	START WITH 1001
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;

--2.4
--A)
--No, an additional sequence for the performer relation is not needed because the 
--sequence for the movie table will work concurrently for the Performer table.

--B)
--No, I do not see any problems with using sequences in a DDL.


-- Load sample data
INSERT INTO Movie VALUES (1,'Star Wars',1977,8.9);
INSERT INTO Movie VALUES (2,'Blade Runner',1982,8.6);

INSERT INTO Performer VALUES (1,'Harrison Ford');
INSERT INTO Performer VALUES (2,'Rutger Hauer');
INSERT INTO Performer VALUES (3,'The Mighty Chewbacca');
INSERT INTO Performer VALUES (4,'Rachael');

INSERT INTO Casting VALUES (1,1,'star');
INSERT INTO Casting VALUES (1,3,'extra');
INSERT INTO Casting VALUES (2,1,'star');
INSERT INTO Casting VALUES (2,2,'costar');
INSERT INTO Casting VALUES (2,4,'costar');