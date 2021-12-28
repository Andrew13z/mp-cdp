--OPTION 1
--make a databse dump in a file
--should be run from command line  
pg_dump postgres > db-dump/dump.sql -U postgres;

--create database
CREATE DATABASE POSTGRES_DUMP;

--recreate a databse from the dump file
--should be run from command line  
psql postgres_dump < db-dump/dump.sql -U postgres;

--OPTION 2
CREATE DATABASE POSTGRES_COPY
WITH TEMPLATE POSTGRES_DUMP
OWNER POSTGRES;

--OPTION 3
--should be run from postgres cli
\copy (
	SELECT ST.FIRSTNAME, ST.SURNAME, SU.TITLE, ER.MARK 
	FROM EXAM_RESULTS ER
	JOIN STUDENTS ST
	ON ER.STUDENT_ID = ST.ID 
	JOIN SUBJECTS SU 
	ON ER.SUBJECT_ID = SU.ID
) to '/db-dump/copy.csv' with csv;


