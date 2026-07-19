CREATE DATABASE customers;
USE customers;

CREATE TABLE customer(
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    age INT
);

INSERT INTO customer VALUES
(1,'Parth','Rajkot',19),
(2,'Rahul','Ahmedabad',21),
(3,'Priya','Surat',20),
(4,'Amit','Rajkot',22),
(5,'Neha','Vadodara',23);

SELECT * FROM customer;

SELECT name, city FROM customer;

SELECT * FROM customer
WHERE city = 'Rajkot';

SELECT MAX(age) AS highest_age
FROM customer;

