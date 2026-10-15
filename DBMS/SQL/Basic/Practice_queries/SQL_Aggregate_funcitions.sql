/* ----------------------------------------------------------------------
            PRACTICAL EXERCISE - 1
-----------------------------------------------------------------------*/

/* Q1. Return the total number of rows in the track table. */

SELECT COUNT(*)
FROM track;

/* Q2. Count tracks whose composer is not NULL.*/

SELECT COUNT(composer) -- the count function only counts the non-NULL values
FROM track;

/* Q3. Calculate the sum of the total column in invoice. */

SELECT SUM(total)
FROM invoice;

/* Q4. Return the average unit_price from track. */

SELECT AVG(unit_price)
FROM track;

/* Q5. Return the minimum and maximum unit_price in track in one query. */

SELECT MIN(unit_price), MAX(unit_price)
FROM track;

/*---------------------------------------------------------------------
                      PRACTICAL TEST - 2
----------------------------------------------------------------------*/

/* Q1. Count all tracks whose unit_price is greater than 1.00. */

SELECT COUNT(*) AS total_count
FROM track
WHERE unit_price > 1.00;

/* Q2. Calculate the average unit_price for tracks where genre_id = 2.*/

SELECT AVG(unit_price) AS avg_track_price
FROM track
WHERE genre_id = 2;

/* Q3. find the smallest invoice total among invoices whose total is at
least 5.00. */

SELECT MIN(total) AS smallest_total
FROM invoice
WHERE total >= 5.00;

/* Q4. Calculate the sum of invoice totals for invoices between 5.00 and
10.00, including both boundaries.*/

SELECT SUM(total) AS total_sum
FROM invoice
WHERE total BETWEEN 5.00 AND 10.00;

/* Q5. Count tracks whose composer is known (not NULL) and whose unit_price
 is 0.99. */

SELECT COUNT(composer) AS total_tracks
FROM track
WHERE unit_price = 0.99
    AND composer IS NOT NULL;