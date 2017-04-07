--Mark Davis
--cs342, homework 8
--April 7, 2017

--Exercise 8.2

-- Insert your results into this table.
CREATE TABLE SequelsTemp (
  id INTEGER,
  name varchar2(100),
  PRIMARY KEY (id)
 );
 
CREATE OR REPLACE PROCEDURE getSequels (movieIdIn IN Movie.id%type) AS
	cursor temp is
	select sequelId from Movie where id = movieIdIn;
begin
	delete from SequelsTemp;
	for sequel in temp LOOP
		getSequels(sequel.sequelId);
		insert into SequelsTemp (select id, name from Movie where id = sequel.sequelId);
	end LOOP;
END;
/

-- Get the sequels for Ocean's 11, i.e., 4 of them.
BEGIN  getSequels(238071);  END;
/
SELECT * FROM SequelsTemp;

-- Get the sequels for Ocean's Fourteen, i.e., none.
BEGIN  getSequels(238075);  END;
/
SELECT * FROM SequelsTemp;

-- Clean up.
DROP TABLE SequelsTemp;