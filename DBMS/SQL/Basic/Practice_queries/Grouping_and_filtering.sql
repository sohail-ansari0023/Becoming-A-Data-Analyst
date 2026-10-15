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
