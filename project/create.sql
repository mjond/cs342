--Mark Davis
--CS342 Project Design
--March 9, 2017

--This database is intended to be used for fantasy hockey. See vision statement.
--------------------------------------------

DROP USER hockey CASCADE;
CREATE USER hockey
	IDENTIFIED BY MonkeyHat8
	QUOTA 5M ON System;

GRANT
	CONNECT,
	CREATE TABLE,
	CREATE SESSION,
	CREATE SEQUENCE,
	CREATE VIEW,
	CREATE MATERIALIZED VIEW,
	CREATE PROCEDURE,
	CREATE TRIGGER,
	UNLIMITED TABLESPACE
	TO hockey;

CONNECT hockey/MonkeyHat8;

@load