SELECT * FROM customers.flights;

SELECT MONTHNAME(date_of_journey), COUNT(*)
FROM flights
GROUP BY MONTHNAME(date_of_journey)
ORDER BY COUNT(*) DESC LIMIT 1;

SELECT DAYNAME(date_of_journey), AVG(price) FROM flights
GROUP BY DAYNAME(date_of_journey)
ORDER BY AVG(price) DESC LIMIT 1;

SELECT MONTHNAME(date_of_journey), COUNT(*) FROM flights
WHERE Airline = 'Indigo'
GROUP BY MONTHNAME(date_of_journey);

SELECT * FROM flights
WHERE source = 'Banglore' AND Destination = 'Delhi' AND
Dep_Time > '10:00:00' AND Dep_Time < '14:00:00';

SELECT COUNT(*) FROM flights
WHERE source = 'Banglore' AND
DAYNAME(date_of_journey) IN ('saturday','sunday');

ALTER TABLE flights ADD COLUMN departure DATETIME;

SET SQL_SAFE_UPDATES = 0;
UPDATE flights
SET departure = STR_TO_DATE(CONCAT(date_of_journey,' ',dep_time),'%Y-%m-%d %H:%i');
SET SQL_SAFE_UPDATES = 1;

ALTER TABLE flights ADD COLUMN duration_mins INTEGER,
ADD COLUMN arrival DATETIME;

SELECT Duration,
REPLACE(SUBSTRING_INDEX(duration,' ',1),'h','')*60 +
CASE
	WHEN SUBSTRING_INDEX(duration,' ',-1) = SUBSTRING_INDEX(duration,' ',1) THEN 0
    ELSE REPLACE(SUBSTRING_INDEX(duration,' ',-1),'m','')
END AS 'mins'
FROM flights;

UPDATE flights
SET duration_mins = 
CASE
	WHEN duration LIKE '%h%' THEN CAST(REPLACE(SUBSTRING_INDEX(duration,'h','1'),' ','') AS UNSIGNED)*60
    ELSE 0
END +
CASE
	WHEN duration LIKE '%m%' THEN CAST(REPLACE(SUBSTRING_INDEX(SUBSTRING_INDEX(duration,'m','1'),' ','-1'),' ','') AS UNSIGNED)
    ELSE 0
END;
SELECT * FROM flights;

SELECT departure,duration_mins,DATE_ADD(departure, INTERVAL duration_mins MINUTE)
FROM flights;

UPDATE flights
SET arrival = DATE_ADD(departure, INTERVAL duration_mins MINUTE);

SELECT * FROM flights;

SELECT TIME(arrival) FROM flights;
SELECT DATE(arrival) FROM flights;

SELECT COUNT(*) FROM flights
WHERE DATE(departure) != DATE(arrival);

SELECT source,Destination,
TIME_FORMAT(SEC_TO_TIME(AVG(duration_mins)*60),'%kh:%im') AS 'avg_duration' FROM flights
GROUP BY source,Destination;

SELECT * FROM flights
WHERE Total_Stops = 'non-stop' AND
DATE(departure) < DATE(arrival);

SELECT airline, QUARTER(departure), COUNT(*)
FROM flights
GROUP BY airline, QUARTER(departure);

WITH temp_table AS (SELECT *,
CASE
	WHEN total_stops = 'non-stop' THEN 'non-stop'
    ELSE 'with stop'
END AS 'temp'
FROM flights)

SELECT temp,
TIME_FORMAT(SEC_TO_TIME(AVG(duration_mins)*60),'%kh:%im') AS 'avg_duration',
AVG(price) AS 'avg_price'
FROM temp_table
GROUP BY temp;

-- 1st Mar 2019 to 10th Mar 2019
SELECT * FROM flights
WHERE source = 'Delhi' AND
DATE(departure) BETWEEN '2019-03-1' AND '2019-03-10';

SELECT airline,
TIME_FORMAT(SEC_TO_TIME(MAX(duration_mins)*60),'%kh:%im') AS 'max_duration'
FROM flights
GROUP BY airline
ORDER BY MAX(duration_mins) DESC;

SELECT source,Destination,
TIME_FORMAT(SEC_TO_TIME(AVG(duration_mins)*60),'%kh:%im') AS 'avg_duration' FROM flights
GROUP BY source,Destination
HAVING AVG(duration_mins) > 180;

SELECT DAYNAME(departure),
SUM(CASE WHEN HOUR(departure) BETWEEN 0 AND 5 THEN 1 ELSE 0 END) AS '12AM - 6AM',
SUM(CASE WHEN HOUR(departure) BETWEEN 6 AND 11 THEN 1 ELSE 0 END) AS '6AM - 12PM',
SUM(CASE WHEN HOUR(departure) BETWEEN 12 AND 17 THEN 1 ELSE 0 END) AS '12PM - 6PM',
SUM(CASE WHEN HOUR(departure) BETWEEN 18 AND 23 THEN 1 ELSE 0 END) AS '6PM - 12PM'
FROM flights
WHERE source = 'Banglore' AND Destination = 'Delhi'
GROUP BY DAYNAME(departure), DAYOFWEEK(departure)
ORDER BY DAYOFWEEK(departure) ASC;