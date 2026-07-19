CREATE DATABASE ADIT;
USE ADIT;

CREATE TABLE student(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO student (id ,name)
VALUES
(101, "adam"),
(102, "bob"),
(103, "casey");

CREATE TABLE course(
	id INT PRIMARY KEY,
    course VARCHAR(50)
);

INSERT INTO course (id, course)
VALUES
(102, "englifh"),
(105, "math"),
(103, "science"),
(107, "computer science");

SELECT * FROM student;
SELECT * FROM course;

SELECT * FROM student
INNER JOIN course
ON student.id = course.id;

SELECT * FROM student AS a
LEFT JOIN course AS b
ON a.id = b.id;

SELECT * FROM student AS a
RIGHT JOIN course AS b
ON a.id = b.id;

SELECT * FROM student AS a
LEFT JOIN course AS b
ON a.id = b.id
UNION
SELECT * FROM student AS a	
RIGHT JOIN course AS b
ON a.id = b.id;

SELECT * FROM student AS a
LEFT JOIN course AS b
ON a.id = b.id
WHERE b.id IS NULL;

SELECT * FROM student AS a
RIGHT JOIN course AS b
ON a.id = b.id
WHERE a.id IS NULL;

SELECT * FROM student AS a
LEFT JOIN course AS b
ON a.id = b.id
WHERE b.id IS NULL
UNION
SELECT * FROM student AS a
RIGHT JOIN course AS b
ON a.id = b.id
WHERE a.id IS NULL;

CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    manaager_id INT
);

INSERT INTO employee (id, name, manaager_id)
VALUES
(101, "adam", 103),
(102, "bob", 104),
(103, "casey", NULL),
(104, "donald", 103);

SELECT * FROM employee;

SELECT a.name AS manager_name, b.name 
FROM employee AS a
JOIN employee AS B
ON a.id = b.manaager_id;