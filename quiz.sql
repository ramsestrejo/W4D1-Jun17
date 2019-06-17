
DROP TABLE IF EXISTS answer;
DROP TABLE IF EXISTS submission;
DROP TABLE IF EXISTS option;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS quiz;
--DROP DATABASE IF EXISTS quiz;

--CREATE DATABASE quiz;

CREATE TABLE quiz (

   id serial PRIMARY KEY,
   name VARCHAR (50) UNIQUE NOT NULL
);

CREATE TABLE student (

   id serial PRIMARY KEY,
	name VARCHAR (50) NOT NULL,   
   email VARCHAR (50) UNIQUE NOT NULL
);



CREATE TABLE question (
  id serial PRIMARY KEY,
  caption VARCHAR(50) NOT NULL,
  quiz_id INTEGER REFERENCES quiz (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE option (
  id serial PRIMARY KEY,
  caption VARCHAR(50) NOT NULL,
  question_id INTEGER REFERENCES question (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE submission (
  id serial PRIMARY KEY,
  option_id INTEGER REFERENCES option (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE, 
  student_id INTEGER REFERENCES student (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE        
);

CREATE TABLE answer (
  id serial PRIMARY KEY,
  option_id INTEGER REFERENCES option (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE      
);


INSERT INTO quiz VALUES( 1, 'MidTerm Exam');
INSERT INTO student VALUES( 11, 'James Cameron', 'james@gmail.com');
INSERT INTO student VALUES( 12, 'Bob Dean', 'bob@gmail.com');


INSERT INTO question VALUES ( 21, 'What is the most popular web development language?',1);
INSERT INTO question VALUES ( 22, 'What is a database?',1);
INSERT INTO question VALUES ( 23, 'What is a HTTP request?',1);
INSERT INTO question VALUES ( 24, 'What is TCP?',1);
INSERT INTO question VALUES ( 25, 'What is the client/server?',1);

INSERT INTO option VALUES( 31, 'Java',21);
INSERT INTO option VALUES( 32, 'JavaScript',21);
INSERT INTO option VALUES( 33, 'PHP',21);
INSERT INTO option VALUES( 34, 'C#',21);

INSERT INTO submission VALUES( 41, 31, 11);
INSERT INTO submission VALUES( 42, 32, 12);

INSERT INTO answer VALUES( 51, 32);





