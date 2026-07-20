CREATE DATABASE aSystem;
USE aSystem;

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

SELECT * FROM student;

ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE student
MODIFY COLUMN age VARCHAR(2);

ALTER TABLE stu
CHANGE age stu_age INT;

INSERT INTO student
(rollno, name, marks, stu_age)
VALUES
(405, "ryzo", 56, 20);

ALTER TABLE student
DROP COLUMN stu_age;

ALTER TABLE stu
RENAME TO student;

TRUNCATE TABLE student;

ALTER TABLE student
CHANGE COLUMN name full_name VARCHAR(50);

SET SQL_SAFE_UPDATE = 1;

DELETE FROM student
WHERE marks < 80;

SELECT name, marks
FROM student
WHERE marks >
(SELECT AVG(marks) FROM student);

CREATE VIEW view1 AS
SELECT rollno, name, marks FROM student;

SELECT * FROM view1
WHERE marks > 90;

DROP VIEW view1;