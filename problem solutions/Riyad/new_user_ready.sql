alter session set "_ORACLE_SCRIPT"=true; 


create user riyad identified by 1234;
grant connect, resource, unlimited tablespace to riyad;
ALTER USER riyad DEFAULT TABLESPACE USERS;
ALTER USER riyad TEMPORARY TABLESPACE TEMP;

alter session set "_ORACLE_SCRIPT"=true; 


grant create session to riyad;


GRANT CONNECT, RESOURCE, DBA TO riyad;

GRANT UNLIMITED TABLESPACE TO riyad;

SET SERVEROUTPUT ON

grant all privileges to riyad;


select * from user_triggers