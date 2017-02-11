-- This command file loads a simple movies database, dropping any existing tables
-- with the same names, rebuilding the schema and loading the data fresh.
--
-- CS 342, Spring, 2015
-- kvlinden

--edited by Mark Davis, mjd85

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

--edits by Mark Davis for lab02

--a. i.
--INSERT INTO Movie VALUES (1, 'Indiana Jones', 1975, 8.8); --primary key already exists

--a. ii.
--INSERT INTO Movie VALUES (NULL, 'LOTR', 1999, 10.0); -- cannot have NULL as primary key value

--a. iii.
--INSERT INTO Movie VALUES (3, 'Argo', 1800, 8.5); -- violates check restraint

--a. iv.
--INSERT INTO Movie VALUES (ID, 'New Movie', 1955, LowRating); --violates datatype constraint

--a. v.
--INSERT INTO Movie VALUES (5, 'Negative Score', 1987, -4.0); --negative values still work

--b. i.
--INSERT INTO Casting VALUE (NULL, 3, 'prop'); --no error

--b. ii.
--INSERT INTO Casting VALUE (2, 6, 'STAR'); -- error, must reference existing primary keys

--b. iii.
--INSERT INTO Performer VALUE (5, 'COSTAR'); -- no error

-- c. i.
--DELETE FROM Performer
--WHERE name='Harrison Ford' AND id=1; --no error

--c. ii.
--DELETE FROM Casting 
--WHERE movieId=1 AND performerId=1; -- no error

--c. iii.
--UPDATE Movie
--SET id=342
--WHERE year=1977; --error, integrity constraint