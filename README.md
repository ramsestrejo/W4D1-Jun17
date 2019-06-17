# W4D1-Jun17
# Intro to Relational databases and SQL


## Introduction to databases
In today's lecture, we explored the world of databases. We use databases to PERSIST (or keep memory of) data that will be used later for some purpose. Relational databases, have a niche use when the structure and relationship orientation of relational databases are critical for implementation of software systems.

## Data Modeling
Although the term and structure of ERDs (Entity Relationship Diagram) are used loosely, they are the preferred way of representing and modeling data structures, many times using the Crow's foot notation. A simple, and free tool to easily create ERDs is draw.io

## Relational Databases
Relational database systems or RDBMS organize data in databases. Databases are composed of collections of tables, and tables are a combination of rows and columns, similar to spreadsheets.

Primary keys (PK) provide a way to uniquely identify each row in a table. Typically, database tables are configured to automatically calculate primary keys when new rows are inserted to maintain uniqueness. On the other hand, Foreign keys (FK) are identifiers that enable a dependent relation (on the many side of a relationship) to refer to its parent relation (on the one side of the relationship) by mirroring the value of the parent's primary key (PK).

## SQL
SQL is a language that is used to communicate RDBMS to do CRUD operations Create (INSERT), Read or query (SELECT) Update (UPDATE) or Delete (DELETE) data contained in databases. 

There are a number of clauses that help refine the behaviour of SQL statements :
* SELECT 	(List of columns to return)
* FROM 		(List of tables where columns are)
* WHERE		(List of conditions that values should meet)
* GROUP BY	(List of columns to group by – folding results)
* HAVING		(List of conditions that grouping should meet)
* ORDER BY	(List of columns to sort results by)


In a SQL statement it is recommended to capitalize keywords and to divide it in multiple lines for increased readability. End every statement with a semicolon (;).

## Quizzes and Students Example
We modeled a problem for immplementing a quiz that contains questions and user's submissions to each question. 
A quiz can have many multi-choice questions & users can skip answering certain questions

### Requirements
Quiz has many questions
Questions have many options (multi choice)
Questions have many answers or none
A submission has a user key
A submission has many answers

### Solution
A script with the solution (quiz.sql with ddl and dml) is included in the repository. Before running this script follow these steps:
1. Connect to PostgreSQL with psql command
2. Create quiz database with CREATE DATABASE quiz;
3. Connect to database with \c quiz
4. Run script with \i quiz.sql

### Queries 

```
-- Retrieve questions for quiz #1
select caption from question q join quiz qz on q.quiz_id = qz.id where qz.id = 1;

-- Retrieve options for question #21 
select a.id,o.caption from answer a join option o on a.option_id = o.id where o.question_id = 21;

-- Retrieve students who answered question #21 correctly
select a.id,o.caption,st.name from answer a join option o on a.option_id = o.id join submission s on o.id = s.option_id join student st on s.student_id = st.id where o.question_id = 21;

-- Retrieve students who answered question #22 correctly (none)
select a.id,o.caption,st.name from answer a join option o on a.option_id = o.id join submission s on o.id = s.option_id join student st on s.student_id = st.id where o.question_id = 22;
```

## About JOINs
JOINs allow you to cross-reference data between two tables. They put the relational in relational databases.

Example: ```sql -- Find all tracks including with artist name and album name

SELECT tracks.title AS title, albums.title AS album, artists.name AS artist FROM tracks JOIN albums ON tracks.albumid = albums.id JOIN artists ON albums.artistid = artists.id; ```

### OUTER JOIN vs INNER JOIN
The difference is simple: * OUTER JOINs will return all results present on the left side (or first table) of the join no matter if related data is present on the right side. * INNER JOINs will only return data if both sides of the relationship contain the referenced data.

When the type of JOIN isn't specified, SQL will assume you're talking about a LEFT INNER JOIN.


## Other Examples
### Sample Queries to the Music Database


![Music ERD](https://fzero.github.io/lhl-lectures/assets/musicdb.svg)

```
-- all tracks, with artist name and album name

SELECT
  tracks.title AS title,
  albums.title AS album,
  artists.name AS artist
FROM tracks
JOIN albums ON tracks.album_id = albums.id
JOIN artists ON albums.artist_id = artists.id;
```

```
-- # of albums per artist
SELECT
  artists.name as artist,
  COUNT(albums.id) as album_count
FROM artists
JOIN albums ON albums.artist_id = artists.id
GROUP BY artists.id;
```


```
-- # all albums and their titles
SELECT albums.title, tracks.title 
FROM tracks
LEFT OUTER JOIN albums ON tracks.album_id = albums.id
GROUP BY albums.title, tracks.title ORDER BY albums.title;
````





