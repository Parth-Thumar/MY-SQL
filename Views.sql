SELECT* FROM customers.flights;

CREATE VIEW indigo AS
SELECT * FROM flights
WHERE airline = 'Indigo';

SELECT * FROM indigo;

CREATE VIEW air_india AS
SELECT * FROM flights
WHERE airline = 'Air India';

SELECT * FROM air_india;

CREATE VIEW airline_summary AS
SELECT Airline,COUNT(*) AS Total_flights,
ROUND(AVG(Price), 2) AS average_price,
MIN(Price) AS minimum_price,
MAX(Price) AS maximum_price
FROM flights
GROUP BY Airline;

SELECT * FROM airline_summary;

CREATE VIEW route_summary AS
SELECT Source,Destination,
COUNT(*) AS total_flights,
ROUND(AVG(Price), 2) AS average_price,
MIN(Price) AS minimum_price,
MAX(Price) AS maximum_price
FROM flights
GROUP BY Source, Destination;

SELECT * FROM route_summary;

SELECT * FROM route_summary
WHERE total_flights > 10
AND average_price > (SELECT AVG(price) FROM flights)
ORDER BY average_price DESC;

CREATE VIEW budget_direct_flights AS
SELECT Airline,Source,Destination,Total_Stops,Price
FROM flights
WHERE Total_Stops = 'non-stop'
AND Price < 10000;

SELECT *
FROM budget_direct_flights;

SELECT Airline, COUNT(*) AS Total_Flights
FROM budget_direct_flights
GROUP BY Airline
ORDER BY Total_Flights DESC;

SELECT Airline,ROUND(AVG(Price), 2) AS Average_Price
FROM budget_direct_flights
GROUP BY Airline
ORDER BY Average_Price ASC;

CREATE VIEW flight_search_view AS
SELECT Airline,Date_of_Journey,Source,Destination,Dep_Time,Duration,Total_Stops,Price
FROM flights;

SELECT *
FROM flight_search_view
WHERE Source = 'Delhi'
AND Destination = 'Cochin'
AND Price <= 10000
ORDER BY Price ASC;

SELECT *
FROM flight_search_view
WHERE Source = 'Delhi'
AND Destination = 'Cochin'
AND Airline = 'IndiGo'
AND total_stops = 'non-stop'
ORDER BY Price ASC;

