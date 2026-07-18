CREATE DATABASE college;
USE college;

CREATE TABLE student(
	rollno INT PRIMARY KEY,
    name VARCHAR(50)
);

SELECT * FROM student;

INSERT INTO student
(rollno, name)
VALUES
(101, "Karan"),
(102, "Arjun"),
(103, "Ram");

INSERT INTO student VALUES (104, "Shyam");

CREATE DATABASE xyz_company;
USE xyz_company;

CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(100),
    salary INT
);

INSERT INTO employee
(id, name, salary)
VALUES
(1, "Adam", 25000),
(2, "bob", 30000),
(3, "casey", 40000);

SELECT * FROM employee;

CREATE TABLE temp1(
	id INT,
    age INT,
    city VARCHAR(20),
    PRIMARY KEY (id)
);

CREATE TABLE emp(
	id INT,
    salary INT DEFAULT 25000);
INSERT INTO emp(id) VALUES (1); 
SELECT * FROM emp;