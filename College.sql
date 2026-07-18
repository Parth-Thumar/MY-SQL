CREATE DATABASE collegeSystem;
USE collegeSystem;

CREATE TABLE student (
	 rollno INT PRIMARY KEY,
     name VARCHAR(50),
     marks INT NOT NULL,
     grade VARCHAR(1),
     city VARCHAR(20)
);

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(101, "anil", 80, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 86, "B", "Mumbai"),
(104, "dhruv", 78, "B", "Delhi"),
(105, "eny", 12, "C", "Delhi"),
(106, "faran", 89, "B", "Delhi");

SELECT DISTinct city FROM student;
SELECT * FROM student WHERE marks > 80;
SELECT * FROM student WHERE city = "Mumbai";
SELECT * FROM student WHERE marks BETWEEN 80 AND 90;
SELECT * FROM student WHERE city IN ("Delhi", "Mumbai");
SELECT * FROM student WHERE city NOT IN ("Delhi", "Mumbai");
SELECT * FROM student LIMIT 3;
SELECT * FROM student WHERE marks > 75 LIMIT 3;
SELECT * FROM student ORDER BY city ASC;
SELECT MAX(marks) FROM student;
SELECT MIN(marks) FROM student;
SELECT AVG(marks) FROM student;
SELECT COUNT(rollno) FROM student;
SELECT city, count(name) FROM student GROUP BY city;

SELECT city, avg(marks)
FROM student
GROUP BY city
ORDER BY avg(marks) DESC;

SELECT city, COUNT(rollno)
FROM student
GROUP BY city
HAVING MAX(marks) > 90;

SELECT city 
FROM student 
WHERE grade = "A" OR "B" 
GROUP BY city
HAVING MAX(marks) >= 90
ORDER BY city ASC;

SET SQL_SAFE_UPDATES = 0;

UPDATE student
SET grade = "O"
WHERE grade = "A";

SELECT * FROM student;

UPDATE student
SET marks = 80
WHERE  rollno = 104;

UPDATE student
SET grade = "B"
WHERE marks BETWEEN 80 AND 90;

UPDATE student 
SET marks = marks + 1;

SELECT * FROM student;

DELETE FROM  student
WHERE marks < 33;

CREATE TABLE dept(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

SELECT * FROM dept;

INSERT INTO dept
VALUES
(101, "English"),
(102, "IT"); 

CREATE TABLE teacher(
	id INT PRIMARY KEY,
    naem VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO teacher
VALUES
(1, "Adam", 101),
(2, "Eve", 102);

SELECT * FROM teacher;

UPDATE dept
SET id = 103
WHERE id = 102;

SELECT name, marks
FROM student
WHERE marks >
(SELECT AVG(marks) FROM student);

SELECT rollno
FROM student
WHERE rollno % 2 = 0;

SELECT name, rollno
FROM student
WHERE rollno % 2 = 0;

SELECT name, rollno
FROM student
WHERE rollno IN(
	SELECT rollno
    FROM student
    WHERE rollno % 2 = 0);
    
SELECT MAX(marks)
FROM (SELECT * FROM student WHERE city = "Delhi") AS temp;

SELECT (SELECT MAX(marks) FROM student), name
FROM student;