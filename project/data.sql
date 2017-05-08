--Mark Davis
--CS342 Project Design
--March 9, 2017

--This database is intended to be used for fantasy hockey. See vision statement.
--------------------------------------------

INSERT INTO UserAccount VALUES (1, 'winner', 'password', 'expert', 'Chuck', 'Norris', 1965);
INSERT INTO UserAccount VALUES (2, 'hockeyFan', 'qwerty', 'legend', 'Bob', 'Vance', 1988);
INSERT INTO UserAccount VALUES (3, 'user11', 'hockey', 'beginner', 'Bruce', 'Wayne', 1980);
INSERT INTO UserAccount VALUES (4, 'helloWorld', '1234', 'medium', 'Michael', 'Scott', 1973);
INSERT INTO UserAccount VALUES (5, 'anonymous', 'passwd', 'beginner', 'Jim', 'Halbert', 1983);
INSERT INTO UserAccount VALUES (6, 'chicago123', 'GrandRapids', 'expert', 'Kevin', 'Malone', 1970);
INSERT INTO UserAccount VALUES (7, 'blueJays', 'Michigan', 'medium', 'Creed', 'Branton', 1962);
INSERT INTO UserAccount VALUES (8, 'canada', 'Mars23', 'medium', 'Stanley', 'Hudson', 1955);
INSERT INTO UserAccount VALUES (9, 'champion', 'chicagobulls', 'medium', 'Dwight', 'Schrute', 1975);
INSERT INTO UserAccount VALUES (10, 'realPlayer', 'bostonceltics', 'expert', 'David', 'Wallace', 1970);
INSERT INTO UserAccount VALUES (11, 'Wayne89', '111gandalf111', 'beginner', 'Todd', 'Packer', 1959);
INSERT INTO UserAccount VALUES (12, 'newPlayer', 'bilboBaggins', 'beginner', 'Andy', 'Bernard', 1980);
INSERT INTO UserAccount VALUES (13, 'lastPlayer', 'frodoBaggins', 'expert', 'Tom', 'Bind', 1889);
INSERT INTO UserAccount VALUES (14, 'secondPlayer', 'pass', 'legend', 'Sam', 'Wise', 1989);
INSERT INTO UserAccount VALUES (15, 'legendOfZelda', 'nope', 'beginner', 'tom', 'thomson', 2004);
INSERT INTO UserAccount VALUES (16, 'marioKart', 'luigi', 'beginner', 'Carey', 'Price', 2009);
INSERT INTO UserAccount VALUES (17, 'super', 'luigi', 'medium', 'John', 'Johnson', 2001);
INSERT INTO UserAccount VALUES (18, 'super', 'luigi', 'beginner', 'John', 'Johnson', 2002);
INSERT INTO UserAccount VALUES (19, 'use0123', 'newbie', 'medium', 'markus', 'davis', 1999);
INSERT INTO UserAccount VALUES (20, 'c++', 'javaScript', 'legend', 'Anonymous', 'Anonymous', 1776);
INSERT INTO UserAccount VALUES (21, 'Ruby', 'Lisp', 'beginner', 'Thomas', 'Shelby', 2001);
INSERT INTO UserAccount VALUES (22, 'C#', 'Python', 'expert', 'Arthur', 'Shelby', 1997);
INSERT INTO UserAccount VALUES (23, 'Go', 'google', 'expert', 'Grace', NULL, 1996);
INSERT INTO UserAccount VALUES (24, 'BeginnerHockeyPlayer', 'whatispassword', 'medium', NULL, NULL, NULL);

----------------------------------------------------------------------------

INSERT INTO Posit VALUES ('rover');
INSERT INTO Posit VALUES ('forward');
INSERT INTO Posit VALUES ('defense');
INSERT INTO Posit VALUES ('center');
INSERT INTO Posit VALUES ('left wing');
INSERT INTO Posit VALUES ('right wing');

-----------------------------------------------------------------------------

INSERT INTO Team VALUES (1, 'Maple Leafs', 5, 'real');
INSERT INTO Team VALUES (2, 'Canadiens', 5, 'real');
INSERT INTO Team VALUES (3, 'Guardians of the Galaxy', 5, 'fantasy');
INSERT INTO Team VALUES (4, 'The Office', 5, 'fantasy');
INSERT INTO Team VALUES (5, 'Corporate', 2, 'fantasy');
INSERT INTO Team VALUES (6, 'CalvinCollege', 5, 'fantasy');
INSERT INTO Team VALUES (7, 'My Team', 5, 'fantasy');
INSERT INTO Team VALUES (8, 'Winners', 5, 'fantasy');
INSERT INTO Team VALUES (9, 'Hockey Team', 5, 'fantasy');
INSERT INTO Team VALUES (10, 'Justice League', 5, 'fantasy');
INSERT INTO Team VALUES (11, 'What is Losing', 5, 'fantasy');
INSERT INTO Team VALUES (12, 'Avengers', 5, 'fantasy');
INSERT INTO Team VALUES (13, 'nope', 0, 'fantasy');
INSERT INTO Team VALUES (14, 'yes', 0, 'fantasy');
INSERT INTO Team VALUES (15, 'maybe', 0, 'fantasy');
INSERT INTO Team VALUES (16, 'posssibly', 0, 'fantasy');
INSERT INTO Team VALUES (17, 'Impossible', 0, 'fantasy');
INSERT INTO Team VALUES (18, 'Possible', 0, 'real');
INSERT INTO Team VALUES (19, 'NULL', 0, 'fantasy');
INSERT INTO Team VALUES (20, NULL, 0, 'fantasy');
INSERT INTO Team VALUES (21, 'Lighting', 0, 'real');
INSERT INTO Team VALUES (22, 'teamNameHere', 0, 'fantasy');
INSERT INTO Team VALUES (23, 'Thunder', 0, 'fantasy');
INSERT INTO Team VALUES (24, 'Grass', 0, 'fantasy');

------------------------------------------------------------------------------

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
INSERT INTO Player VALUES (16, 'Erik', 'Karlsson', 10, 45, 'forward', 3);
INSERT INTO Player VALUES (17, 'Mark', 'Stone', 22, 25, 'forward', 3);
INSERT INTO Player VALUES (18, 'Kyle', 'Turris', 22, 22, 'defense', 3);
INSERT INTO Player VALUES (19, 'Mike', 'Hoffman', 19, 22, 'forward', 3);
INSERT INTO Player VALUES (20, 'Derick', 'Brassard', 11, 22, 'defense', 3);

--The Office
INSERT INTO Player VALUES (21, 'Pam', 'Beasley', 12, 18, 'forward', 4);
INSERT INTO Player VALUES (22, 'Angela', 'Ston', 23, 47, 'rover', 4);
INSERT INTO Player VALUES (23, 'Meredith', 'Turn', 8, 99, 'defense', 4);
INSERT INTO Player VALUES (24, 'Phyllis', 'Vance', 0, 17, 'forward', 4);
INSERT INTO Player VALUES (25, 'Toby', 'Flenderson', 0, 5, 'defense', 4);

--Corporate
INSERT INTO Player VALUES (26, 'Jan', 'Levinson', 2, 1, 'forward', 5);
INSERT INTO Player VALUES (27, 'Mr.', 'Boss', 1, 2, 'defense', 5);

--Calvin College
INSERT INTO Player VALUES (28, 'Pastor', 'Mary', 4, 9, 'forward', 6);
INSERT INTO Player VALUES (29, 'President', 'LeRoy', 12, 24, 'rover', 6);
INSERT INTO Player VALUES (30, 'Professor', 'Norman', 11, 22, 'defense', 6);
INSERT INTO Player VALUES (31, 'Professor', 'Vander Linden', 9, 2, 'forward', 6);
INSERT INTO Player VALUES (32, 'Professor', 'Bailey', 4, 5, 'defense', 6);

--My Team
INSERT INTO Player VALUES (33, 'Tim', 'Tims', 5, 9, 'forward', 7);
INSERT INTO Player VALUES (34, 'Bob', 'Bobs', 13, 7, 'defense', 7);
INSERT INTO Player VALUES (35, 'Chuck', 'Chucks', 0, 9, 'forward', 7);
INSERT INTO Player VALUES (36, 'Sam', 'Sams', 10, 12, 'forward', 7);
INSERT INTO Player VALUES (37, 'Peter', 'Peters', 4, 3, 'defense', 7);

--Winners
INSERT INTO Player VALUES (38, 'Alex', 'Keizer', 6, 9, 'rover', 8);
INSERT INTO Player VALUES (39, 'Jimmy', 'Dirksen', 7, 4, 'defense', 8);
INSERT INTO Player VALUES (40, 'Nate', 'DezWaan', 1, 0, 'defense', 8);
INSERT INTO Player VALUES (41, 'Hunter', 'Darling', 3, 5, 'forward', 8);
INSERT INTO Player VALUES (42, 'Patric', 'Avila', 0, 0, 'rover', 8);

--Hockey Team
INSERT INTO Player VALUES (43, 'A', 'AA', 0, 9, 'defense', 9);
INSERT INTO Player VALUES (44, 'D', 'DD', 0, 4, 'defense', 9);
INSERT INTO Player VALUES (45, 'H', 'HH', 1, 0, 'forward', 9);
INSERT INTO Player VALUES (46, 'E', 'EE', 3, 5, 'forward', 9);
INSERT INTO Player VALUES (47, 'R', 'RR', 3, 3, 'rover', 9);

--Justice League
INSERT INTO Player VALUES (48, 'Q', 'QQ', 0, 0, 'defense', 10);
INSERT INTO Player VALUES (49, 'W', 'WW', 9, 18, 'forward', 10);
INSERT INTO Player VALUES (50, 'T', 'TT', 0, 10, 'defense', 10);
INSERT INTO Player VALUES (51, 'Y', 'YY', 8, 16, 'forward', 10);
INSERT INTO Player VALUES (52, 'I', 'II', 10, 20, 'rover', 10);

--What is Losing
INSERT INTO Player VALUES (53, 'John', 'Johnson', 0, 6, 'defense', 11);
INSERT INTO Player VALUES (54, 'Will', 'Wilson', 15, 5, 'forward', 11);
INSERT INTO Player VALUES (55, 'Tim', 'Timson', 0, 10, 'defense', 11);
INSERT INTO Player VALUES (56, 'Henry', 'Henrison', 13, 2, 'forward', 11);
INSERT INTO Player VALUES (57, 'David', 'Davidson', 12, 9, 'rover', 11);

--Avengers
INSERT INTO Player VALUES (11, 'Wayne', 'Gretzky', 894, 1963, 'forward', 12);
INSERT INTO Player VALUES (12, 'Mark', 'Messier', 694, 1193, 'forward', 12);
INSERT INTO Player VALUES (13, 'Gordon', 'Howe', 801, 1049, 'forward', 12);
INSERT INTO Player VALUES (14, 'Ray', 'Bourque', 717, 873, 'defense', 12);
INSERT INTO Player VALUES (15, 'Paul', 'Coffey', 396, 1135, 'defense', 12);

--players who aren't on a team
INSERT INTO Player VALUES (58, 'Jon', 'Johnny', 2, 9, 'defense', NULL);
INSERT INTO Player VALUES (59, 'Bob', 'Bobby', 0, 8, 'defense', NULL);
INSERT INTO Player VALUES (60, 'Sam', 'Samson', 0, 3, 'defense', NULL);
INSERT INTO Player VALUES (61, 'Spider', 'Man', 23, 30, 'rover', NULL);
INSERT INTO Player VALUES (62, 'Dr.', 'Oz', 78, 95, 'forward', NULL);


------------------------------------------------------------------------

--Goalies
INSERT INTO Goalie VALUES (1, 'Carey', 'Price', 0.920, 2);
INSERT INTO Goalie VALUES (2, 'Frederik', 'Andersen', 0.915, 5);
INSERT INTO Goalie VALUES (3, 'Curtis', 'McElhinney', 0.938, 1);
INSERT INTO Goalie VALUES (4, 'Cory', 'Schneider', 0.923, 3);
INSERT INTO Goalie VALUES (5, 'D', 'DD', 0.917, 9);
INSERT INTO Goalie VALUES (6, 'Clark', 'Kent', 1.0, 6);
INSERT INTO Goalie VALUES (7, 'Michael', 'Jordan', 0.813, 7);
INSERT INTO Goalie VALUES (8, 'Larry', 'Bird', 0.854, 8);
INSERT INTO Goalie VALUES (9, 'Kelly', 'Capore', 0.517, 4);
INSERT INTO Goalie VALUES (10, 'Jimmy', 'Buffet', 0.917, 10);
INSERT INTO Goalie VALUES (11, 'Conan', 'OBrian', 0.988, 11);
INSERT INTO Goalie VALUES (12, 'Aqua', 'Man', 0.989, 12);
INSERT INTO Goalie VALUES (13, 'Who', 'Knows', 0.001, 13);

------------------------------------------------------------------------

--Game
INSERT INTO Game VALUES (1, 1, 2, 1, 3, 2);
INSERT INTO Game VALUES (2, 2, 3, 2, 4, 2);
INSERT INTO Game VALUES (3, 3, 4, 3, 1, 0);
INSERT INTO Game VALUES (4, 1, 4, 1, 5, 2);
INSERT INTO Game VALUES (5, 5, 7, 7, 3, 4);
INSERT INTO Game VALUES (6, 11, 12, 11, 3, 30);
INSERT INTO Game VALUES (7, 8, 9, 9, 1, 2);
INSERT INTO Game VALUES (8, 6, 10, NULL, 2, 2);
INSERT INTO Game VALUES (9, 11, 5, 5, 2, 3);
INSERT INTO Game VALUES (10, 2, 12, 12, 3, 25);
INSERT INTO Game VALUES (11, 9, 11, 11, 0, 4);
INSERT INTO Game VALUES (12, 3, 6, 3, 3, 1);

-----------------------------------------------------------------------

--UserTeams
INSERT INTO UserTeam VALUES (1, 1);
INSERT INTO UserTeam VALUES (2, 2);
INSERT INTO UserTeam VALUES (3, 3);
INSERT INTO UserTeam VALUES (4, 4);
INSERT INTO UserTeam VALUES (5, 5);
INSERT INTO UserTeam VALUES (6, 6);
INSERT INTO UserTeam VALUES (7, 7);
INSERT INTO UserTeam VALUES (8, 8);
INSERT INTO UserTeam VALUES (9, 9);
INSERT INTO UserTeam VALUES (10, 10);
INSERT INTO UserTeam VALUES (11, 11);
INSERT INTO UserTeam VALUES (12, 12);

-----------------------------------------------------------------------

--User Comments
INSERT INTO GameComment VALUES (1, 1, 2, 'Good game noob');
INSERT INTO GameComment VALUES (2, 2, 4, 'Better luck next time');
INSERT INTO GameComment VALUES (3, 1, 3, 'hocky much?');
INSERT INTO GameComment VALUES (4, 2, 3, 'stacked team, eh');
INSERT INTO GameComment VALUES (5, 5, 4, 'good game');
INSERT INTO GameComment VALUES (6, 6, 7, 'see you in the playoffs');
INSERT INTO GameComment VALUES (7, 7, 8, 'learn how to skate');
INSERT INTO GameComment VALUES (8, 8, 8, 'shoot much?');
INSERT INTO GameComment VALUES (9, 9, 9, 'thank you');
INSERT INTO GameComment VALUES (10, 10, 10, 'no comment');
INSERT INTO GameComment VALUES (11, 9, 1, 'no fair');
INSERT INTO GameComment VALUES (12, 7, 7, 'good game');