/*CREATE DATABASE argha;
create database argha2;

# to delete a database we can use drop database name;
#so I am going to delete a argha2 database
DROP DATABASE argha2;
DROP DATABASE argha;*/
#so now only the college database will stay 
CREATE DATABASE College;
USE college; #whatever we store will stay in the college by using this USE name;
CREATE TABLE student ( 
id INT PRIMARY KEY, 
name VARCHAR(50), 
age INT NOT NULL 
);
INSERT INTO student VALUES (1, "ARGHA", 24);
INSERT INTO student VALUES (2, "SUV", 25);
SELECT * FROM student;
SHOW DATABASES;
SHOW TABLES;
CREATE TABLE student1(
rollno INT PRIMARY KEY,
name VARCHAR(5)
);
#to see the contents of te table we use -->
SELECT * FROM student1;
#To insert data to table for multiple values we use this format-->
 INSERT INTO student1
 (rollno, name)
 VALUES  
 (101, "KARAN"),
  (102, "TARAN");
  SELECT * FROM student1;
   INSERT INTO student1
 (rollno, name)
 VALUES  
 (104, "SARAN");
  SELECT * FROM student1;
  #To insert data to table for single values we can use this format-->
  # INSERT INTO student1 VALUES (104, "SARAN");
  
  CREATE DATABASE xyz_company;
  USE xyz_company;
  CREATE TABLE xyz_company(
  id INT PRIMARY KEY, 
  name VARCHAR(50), 
  salary INT NOT NULL
  );
  INSERT INTO xyz_company
  (id , name, salary)
  VALUES
  (1, "adam" , 25000),
  (2, "bob" , 30000),
  (3, "casey" , 40000);
  SELECT * FROM xyz_company;
  CREATE DATABASE college1;
  USE college;
  CREATE TABLE student2(
  rollno INT PRIMARY KEY,
  name VARCHAR(50),
  marks INT NOT NULL,
  grade VARCHAR(1),
  city VARCHAR(20)
  );
  INSERT INTO student2
  (rollno, name, marks, grade, city)
  VALUES
  (101,"anil",78, "C", "Pune"),
  (102,"bhumika",93, "A", "Mumbai"),
  (103,"chetan",85, "B", "Mumbai"),
  (104,"dhruv",96, "A", "Delhi"),
  (105,"emanuel",12, "F", "Delhi"),
  (106,"farah",82, "B", "Delhi");
  SELECT name, marks FROM student2; #to select custom cols
  
  SELECT DISTINCT city FROM student2; #distinct prints the unique values
  
  #Clause
  
  SELECT * FROM student2 WHERE marks>80;
  SELECT * FROM student2 WHERE city ="Mumbai";
  SELECT * FROM student2 WHERE marks>80 AND city ="Mumbai";
  SELECT * FROM student2 WHERE marks+10>100; #print the date of those student after adding 10 it will cross 100 marks
  
  
#OPERATORS
SELECT * FROM student2 WHERE marks>90 AND city="Mumbai";
SELECT * FROM student2 WHERE marks>90 OR city="Mumbai";
SELECT * FROM student2 WHERE marks BETWEEN 80 AND 90;
SELECT * FROM student2 WHERE city IN ("Delhi","Mumbai");
#to reverse a condition we use NOT Operator
SELECT * FROM student2 WHERE city NOT IN ("Delhi","Mumbai");

#Limit clause
#Sets and upper limit on numbers of(tuples) rows to be returned
SELECT * FROM student2 LIMIT 3;

#ORDER BY CLAUSE
#TO sort data in ascending or descending manner we use this clause
SELECT * FROM student2 ORDER BY city ASC;
SELECT * FROM student2 ORDER BY city DESC;

#AGGREGATE FUNCTIONS
#Aggregate functions perform a calculation on a set of values and return a single value.
#COUNT() MAX() MINI() SUM() AVG()
SELECT COUNT(marks) FROM student2;
SELECT MAX(marks) FROM student2;
SELECT MIN(marks) FROM student2;
SELECT SUM(marks) FROM student2;
SELECT AVG(marks) FROM student2;

#GROUP BY CLAUSE
#It groups rows that have the same values into summary rows.
#It collects data from multiple records and groups the result by one or more column
#generally we use group by with some aggregation function.

SELECT city, COUNT(name) FROM student2 GROUP BY city;

#Practice qs 
#Write the query to find avg marks in each city in ascending order.

SELECT city, AVG(marks) FROM student2 GROUP BY city ORDER BY city ASC;
SELECT city, AVG(marks) FROM student2 GROUP BY city ORDER BY AVG(marks) DESC;
# Having Clause
# SImilar to where clause applies on some condition on rows Used when we want to apply any condition after grouping
# Where we cannot use "where" clause we use having clause
USE college;
SELECT count(name), city 
FROM student2 GROUP BY city 
HAVING max(marks)>90;

#General Order 
#SELECT column(s)
#FROM table_name
# WHERE condition;
#GROUP BY column(s);
#HAVING condition;
#ORDER BY column(s) ASC;

#Table related queries
#Update (to update existing rows)
UPDATE student2
SET grade = " O "
WHERE grade = " B ";
#if it shows error and shows "You are using safe mode, then it warns if we change anything mistakenly
#this is how we turn off the safe mode
SET SQL_SAFE_UPDATES=0;
UPDATE student2
SET marks = 82
WHERE rollno = 105;
USE college;
UPDATE student2
SET grade = " A "
WHERE marks<50;
SELECT * FROM student2;
INSERT INTO student2
  (rollno, name, marks, grade, city)
  VALUES
  (101,"anil",78, "C", "Pune"),
  (102,"bhumika",93, "A", "Mumbai"),
  (103,"chetan",85, "B", "Mumbai"),
  (104,"dhruv",96, "A", "Delhi"),
  (105,"emanuel",12, "F", "Delhi"),
  (106,"farah",82, "B", "Delhi");
 DROP TABLE student2;
 SELECT * FROM student2;
 CREATE TABLE student2(
  rollno INT PRIMARY KEY,
  name VARCHAR(50),
  marks INT NOT NULL,
  grade VARCHAR(1),
  city VARCHAR(20)
  );
  INSERT INTO student2
  (rollno, name, marks, grade, city)
  VALUES
  (101,"anil",78, "C", "Pune"),
  (102,"bhumika",93, "A", "Mumbai"),
  (103,"chetan",85, "B", "Mumbai"),
  (104,"dhruv",96, "A", "Delhi"),
  (105,"emanuel",12, "F", "Delhi"),
  (106,"farah",82, "B", "Delhi");

SELECT * FROM student2;
UPDATE student2
SET grade = " O "
WHERE grade = " B ";
SELECT * FROM student2;
UPDATE student2
SET marks = 82
WHERE rollno = 105;
UPDATE student2
SET grade = "B"
WHERE marks BETWEEN 80 AND 90;
SELECT * FROM student2;
#to update marks by 10
UPDATE student2
SET marks = marks + 10;

#Table related Queries
#Delete(to delete existing rows)
UPDATE student2
SET marks = 12
WHERE rollno = 105;
#it deletes the data from a table as per the condition from a row 
#to delete whole data from a table without deleting the table we use DELETE FROM table_name; without any condition
DELETE FROM student2
WHERE marks < 33;

#Revising FK
CREATE TABLE dept (
id INT PRIMARY KEY,
name VARCHAR(50)
);
CREATE TABLE teacher (
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
);
SELECT * FROM teacher;
#the table where the original primary key was there is parent tabel
#the table where we used foreign key is child tabel

#CASCADING for FK
#On delete cascade- When we create a foreign key using this option, it deletes the referencing rows in the child table,when the referenced row is deleted in the parent table which has a primary key.
#On Update Cascade - When we create a foreign key using UPDATE CASCADE the referencing rows are updated in the child table, when the referenced row is updated in the parent table which has a primary key. 
INSERT INTO dept
VALUES 
(101, "ENGLISH"),
(102, "IT");
INSERT INTO teacher
VALUES 
(101, "ADAM", 101),
(102, "EVE", 102);
SELECT * FROM teacher;
#to update anything in the primary table we want to update at the foreign key table as well
#for that we will use--->
DROP TABLE teacher;
CREATE TABLE teacher (
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);
INSERT INTO teacher
VALUES 
(101, "ADAM", 101),
(102, "EVE", 102);
SELECT * FROM teacher;
INSERT INTO dept
VALUES 
(101, "ENGLISH"),
(102, "IT");
UPDATE dept
SET id = 103
WHERE id = 102;
#Here it will change the values of teacher table as well after updating the datas from dept table
SELECT * FROM teacher;

#Alter (to change the schema)
CREATE TABLE student2(
  rollno INT PRIMARY KEY,
  name VARCHAR(50),
  marks INT NOT NULL,
  grade VARCHAR(1),
  city VARCHAR(20)
  );
  INSERT INTO student2
  (rollno, name, marks, grade, city)
  VALUES
  (101,"anil",78, "C", "Pune"),
  (102,"bhumika",93, "A", "Mumbai"),
  (103,"chetan",85, "B", "Mumbai"),
  (104,"dhruv",96, "A", "Delhi"),
  (105,"emanuel",12, "F", "Delhi"),
  (106,"farah",82, "B", "Delhi");

SELECT * FROM student2;
#Add column
ALTER TABLE student2
ADD COLUMN age INT;
#delete column
ALTER TABLE student2
DROP COLUMN age; 
#rename table 
#ALTER TABLE student2
#RENAME TO studentxl;
ALTER TABLE studentxl
RENAME TO student2;
#Adding col 
ALTER TABLE student2
ADD COLUMN age INT NOT NULL DEFAULT 19;
#Modify column
ALTER TABLE student2
MODIFY COLUMN age VARCHAR(2);
#Change column name 
ALTER TABLE student2
CHANGE age stu_age INT;
#Drop column
ALTER TABLE student2
DROP COLUMN stu_age;
#Rename table
ALTER TABLE student2
RENAME TO stu;
SELECT * FROM stu;
ALTER TABLE stu
RENAME TO student2;

#TRUNCATE -to delete table's data
USE college;
TRUNCATE TABLE student2;
SELECT * FROM student2;
ALTER TABLE student2
CHANGE name full_name VARCHAR(50);
DELETE FROM student2
WHERE marks<80;
ALTER TABLE student2
DROP COLUMN grade;
#JOINS IN SQL
#We use joins to combine multriple tables based on a related column between them
USE college;
#INNER JOIN - Returns records that have matching values in both tables
CREATE TABLE joins(
id INT PRIMARY KEY,
name VARCHAR(50)
);
INSERT INTO joins (id, name)
VALUES 
(101, "Adam"),
(102, "Bob"),
(103, "Casey");
CREATE TABLE course(
id INT PRIMARY KEY,
course VARCHAR(50)
);
INSERT INTO course (id, course)
VALUES 
(102, "English"),
(105, "Math"),
(103, "Science"),
(107, "CS");
SELECT * FROM course;
SELECT * FROM joins;
#to join
SELECT * 
FROM joins AS j #here j is the nickname of joins table. Whenever we call j it will return joins table
INNER JOIN course AS c #here c is the nickname of course table. Whenever we call c it will return course table
ON joins.id = course.id; #to see matching values in both tables
#here j and c are alias
#Left Join -Returns all records from the left table, and the matched records from the right table
USE college;
SELECT * 
FROM joins AS j
LEFT JOIN course AS c
ON j.id = c.id;
SELECT * 
FROM joins AS j
RIGHT JOIN course AS c
ON j.id = c.id;

#In mysql we cannot use full join ndirectly so we use union to use full join
SELECT * 
FROM joins AS j
LEFT JOIN course AS c
ON j.id = c.id
UNION
SELECT * 
FROM joins AS j
RIGHT JOIN course AS c
ON j.id = c.id;
#Qstn- Write sql commands to display the right exclusive join:
#this is for left exclusive join
SELECT * 
FROM joins AS j
LEFT JOIN course AS c
ON j.id = c.id
WHERE c.id IS NULL;
#this is for right exclusive join
SELECT * 
FROM joins AS j
LEFT JOIN course AS c
ON j.id = c.id
WHERE j.id IS NULL;


































  
  

  
  
  
  
  
  
  
  
