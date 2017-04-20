--Mark Davis
--Project Application
--April 21, 2017

drop user mjd85 cascade;

create user mjd85
identified by MonkeyHat8
quota 5M on System;
grant
  connect,
  create table,
  create session,
  create sequence,
  create view,
  create materialized view,
  create procedure,
  create trigger,
  unlimited tablespace,
  IMP_FULL_DATABASE, 
  EXP_FULL_DATABASE 
  to mjd85;

DROP DIRECTORY exp_dir;
CREATE DIRECTORY exp_dir AS  'C:\Users\mjd85\Documents\project\';
GRANT READ, WRITE ON DIRECTORY exp_dir to mjd85;