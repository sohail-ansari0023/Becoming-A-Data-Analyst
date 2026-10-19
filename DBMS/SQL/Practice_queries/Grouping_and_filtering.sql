/*----------------------------------------------------------------- 
                       GROUP BY ASSESSMENT
-------------------------------------------------------------------*/

/* Q1. Display each genre_id and the number of tracks belonging to that genre. */

SELECT genre_id, COUNT(*) AS track_count
FROM track
GROUP BY genre_id;

/* Q2. Display each genre_id and its average track price, ordered form lowest
to highest genre_id. */

SELECT 
    genre_id,
	AVG(unit_price) AS average_track_price
FROM track
GROUP BY genre_id
ORDER BY genre_id;

/* Q3. Find the maximum unit_price for every genre.*/

SELECT
    genre_id,
	MAX(unit_price) AS highes_track_price
FROM track
GROUP BY genre_id
ORDER BY genre_id;

/* Q4. For tracks priced above 1.00, count how many tracks belong to each
genre.*/

SELECT 
    genre_id,
	COUNT(*) AS track_count
FROM track
WHERE unit_price > 1.00
GROUP BY genre_id
ORDER BY genre_id;

/* Q5. For each genre, return the track count and average unit_price in 
the same reult.*/

SELECT
    genre_id,
	COUNT(*) AS track_count,
	AVG(unit_price) AS average_price
FROM track
GROUP BY genre_id
ORDER BY genre_id;

/* Q6. Display each composer and the number of tracks associated with that
composer. */

SELECT
    composer,
	COUNT(*) AS track_count
FROM track
GROUP BY composer;

/* Q7. For each genre_id, return the minimum, maximum, and average unit_price.*/

SELECT
    genre_id, 
	MIN(unit_price) AS lowest_track_price,
	MAX(unit_price) AS highest_track_price,
	AVG(unit_price) AS average_track_price
FROM track
GROUP BY genre_id
ORDER BY genre_id;

/* Q8. For each genre_id, calculate the sum of unit_price across its track.*/

SELECT
    genre_id,
	SUM(unit_price) AS total_track_value
FROM track
GROUP BY genre_id
ORDER BY genre_id;

/* Q9. For tracks priced at 0.99, count how many tracks belong to each genre_id. */

SELECT
    genre_id,
	COUNT(*) AS track_count -- Only tracks whose price is 0.99
FROM track
WHERE unit_price = 0.99
GROUP BY genre_id
ORDER BY genre_id;

/* Q10. For tracks in genre_id 1 or 2 with unit_price greater than 1.00, 
count tracks per genre_id. */

SELECT
    genre_id,
	COUNT(*) AS track_count -- tracks that contain 1 or 2 for genre_id, and price cost > 1.00
FROM track
WHERE genre_id IN (1, 2)
    AND unit_price > 1.00
GROUP BY genre_id
ORDER BY genre_id;

/* Q11. Display the number of tracks for each combination of genre_id 
and unit_price.*/

SELECT
    genre_id,
	unit_price,
	COUNT(*) AS track_count
FROM track
GROUP BY genre_id, unit_price
ORDER BY genre_id;

/* Q12. For each composer, calculate the average unit_price and the number
of tracks. Include only tracks whose unit_price is at least 1.00. */

SELECT
    composer,
	AVG(unit_price) AS average_price,
	COUNT(*) AS track_count
FROM track
WHERE unit_price >=1.00
GROUP BY composer;

/* Q13. Using the invoice table, display each cutomer_id and the sum of
their invoice totals. Sort from highest total to lowest total. */

SELECT 
    customer_id,
	SUM(total) AS invoice_total
FROM invoice
GROUP BY customer_id
ORDER BY invoice_total DESC;

/* Q14. For each genre_id, return track count, total unit_price, average
unit_price, minimum price, and maximum price. Sort by average price from
highest to lowest. */

SELECT
    genre_id,
	COUNT(*) AS track_count,
	SUM(unit_price) AS total_price,
	AVG(unit_price) AS average_price,
	MIN(unit_price) AS lowest_unit_price,
	MAX(unit_price) AS highest_unit_price
FROM track
GROUP BY genre_id
ORDER BY average_price DESC, genre_id; -- added another Order for keeping the result predictable.

/*----------------------------------------------------------------------
                    NOW COMES HAVING (EXERCISES)
-----------------------------------------------------------------------*/

/* Q1. Display each genre_id and its track count. Return only genres with 
more than 50 tracks.*/

SELECT
    genre_id,
	COUNT(*) AS track_count
FROM track
GROUP BY genre_id
HAVING COUNT(*) > 50
ORDER BY track_count DESC;

/* Q2. Display each genre_id and its average track price. Return only genres
whose average price is greater than 1.00. */

SELECT 
    genre_id,
	AVG(unit_price) AS average_track_price
FROM track
GROUP BY genre_id
HAVING AVG(unit_price) > 1.00
ORDER BY genre_id;

/* Q3. Display each genre_id and the total of tis track prices. Return only
genres whose total is greater than 100. */

SELECT 
    genre_id,
	SUM(unit_price) AS total_track_price
FROM track
GROUP BY genre_id
HAVING SUM(unit_price) > 100
ORDER BY total_track_price DESC;

/* Q4. Display each genre_id and its track count. Return only genres with
at leas 100 tracks, ordered from highest track count to lowest. */

SELECT 
    genre_id,
	COUNT(*) track_count
FROM track
GROUP BY genre_id
HAVING COUNT(*) >= 100
ORDER BY track_count DESC;

/* LEVEL 2 - Combine `WHERE`, `GROUP BY`, and `HAVING` */
---------------------------------------------------------

/* Q5. Among tracks priced above 0.99, show the number of tracks per genre.
Return only genres with more than 10 qualifying tracks. */

SELECT
    genre_id,
	COUNT(*) AS track_count
FROM track
WHERE unit_price > 0.99
GROUP BY genre_id
HAVING COUNT(*) > 10
ORDER BY track_count DESC;

/* Q6. Among tracks priced at least 1.00, calculate the average price per
genre. Return only genres whose average is at least 1.50. Sort by average
price descending. */

SELECT
    genre_id,
	AVG(unit_price ) AS average_track_price
FROM track
WHERE unit_price >= 1.00
GROUP BY genre_id
HAVING AVG(unit_price) >= 1.50
ORDER BY average_track_price DESC;

/* Q7. Group traks by genre_id and unit_price. Show the count for each 
combination, but return only combinations containing more than 20 tracks. */

SELECT
    genre_id,
	unit_price,
	COUNT(*) AS track_count
FROM track
GROUP BY genre_id, unit_price
HAVING COUNT(*) > 20;

/* Q8. Group invoices by customer_id. Calculate each customer's total invoice
amount using SUM(total). Return only customers whose total exceeds 40.00,
sorted from highest total to lowest. */

SELECT
    customer_id,
	SUM(total) AS total_invoice_amount
FROM invoice
GROUP BY customer_id
HAVING SUM(total) > 40.00
ORDER BY total_invoice_amount DESC;

/* LEVEL 3 - More Advanced analytical thinking */
------------------------------------------------------------------------

/* Q9. Group tracks by composer. Show the number of tracks per composer,
but return only groups with more than 10 tracks. Consider how NULL composer
values are handled. */

SELECT 
    composer,
	COUNT(*) AS track_count
FROM track
GROUP BY composer
HAVING COUNT(*) > 10;
/* Explaination: Every composer containing NULL becomes a single entity
and aggregated to total 977 number of tracks, since the COUNT(*) even counts
NULL values. */

/* Q10. For each genre, calculate all three metrics:
   - Track count
   - Average track price
   - Maximum track price
 Return only genres with more than 50 tracks and an average price greater
 than 1.00. Sort by average price descending. */

SELECT
    genre_id,
	COUNT(*) AS track_count,
	AVG(unit_price) AS average_track_price,
	MAX(unit_price) AS highest_track_price
FROM track
GROUP BY genre_id
HAVING COUNT(*) > 50
        AND AVG(unit_price) > 1.00
ORDER BY average_track_price DESC;

/* Q11. Among invoices with a total greater than 5.00, group by customer_id.
Show each customer's invoice count and average invoice amount. Return only
customers with at least 5 qualifying invoices. */

SELECT
    customer_id,
	COUNT(*) AS invoices_count,
	AVG(total) AS average_invoice_amount
FROM invoice
WHERE total > 5.00
GROUP BY customer_id
HAVING COUNT(*) >= 5;


/* Q12. Write a query that groups tracks by genre_id, calculates the track
count and average price, and returns genres that satisfy either of these
conditions:
    - More than 100 tracks, or
	- An average price above 1.50
Sort by track count descending, then genre ID ascending. */

SELECT
    genre_id,
	COUNT(*) AS track_count,
	AVG(unit_price) AS average_track_price
FROM track
GROUP BY genre_id
HAVING COUNT(*) > 100
        OR AVG(unit_price) > 1.50
ORDER BY
    track_count DESC, genre_id ASC;
