/*-----------------------------------------------------------------------
                    REAL LIFE BUSINESS QUESTIONS
------------------------------------------------------------------------*/

/* Challenge 1 - FIND HIGH-SPENDING CUSTOMERS */

SELECT
    customer_id,
	SUM(total) AS total_spent
FROM invoice
GROUP BY customer_id
HAVING SUM(total) > 40
ORDER BY total_spent DESC;

/* Challenge 2 - FIND FREQUENT CUSTOMERS */

SELECT
    customer_id,
	COUNT(*) AS invoice_count,
	AVG(total) AS average_invoice
FROM invoice
GROUP BY customer_id
HAVING COUNT(*) >= 5
ORDER BY invoice_count DESC;

/* Challenge 3 - THER FILTERING TRAP */

SELECT
    customer_id,
	COUNT(*) AS high_value_invoice_count,
	SUM(total) AS high_value_spending
FROM invoice
WHERE total > 5  -- filtering the table for customers who does have high-value-invoices
GROUP BY customer_id
HAVING COUNT(*) >= 3 -- keeping only those customer who does have high-value-purchases
ORDER BY high_value_spending DESC, customer_id;


/* Challenge 4 - GENRE PERFORMANCE ANALYSIS */

SELECT
    genre_id,
	COUNT(*) AS track_count,
	AVG(unit_price) AS average_track_price,
	MAX(unit_price) AS highest_track_price
FROM track
WHERE unit_price >= 1.00 -- filter rows that contains unit_price more than $1.00
GROUP BY genre_id
HAVING (COUNT(*) > 50) 
     OR AVG(unit_price) > 1.50 -- Keep only those genre which have track count > 50 or avg track price > $1.50 
ORDER BY average_track_price DESC, genre_id;

/* Challenge 5 - A MORE REALISTIC BUSINESS QUESTION */

SELECT 
    customer_id,
	COUNT(*) AS invoice_count,
	AVG(total) AS average_invoice
FROM invoice
WHERE total > 5.00
GROUP BY customer_id
HAVING AVG(total) > 6.00 
    AND COUNT(*) >= 2
ORDER BY average_invoice DESC, customer_id;

/* Challenge 6 - Distinguish between WHERE and HAVING without hints */

SELECT
    genre_id,
	COUNT(*) AS track_count,
	AVG(unit_price) AS average_price,
	SUM(unit_price) AS total_listed_price
FROM track
WHERE unit_price >= 1.00 -- below one dollar
GROUP BY genre_id
HAVING COUNT(*) >= 20
    AND AVG(unit_price) < 1.50 -- below 1.50 dollar
ORDER BY average_price, genre_id;

/* Challenge 7 - Customer segmentation */

SELECT
    customer_id,
	COUNT(*) AS invoice_count,
	SUM(total) AS total_spending,
	AVG(total) AS average_invoice
FROM invoice
GROUP BY customer_id
HAVING COUNT(*) >= 3
    AND (SUM(total) > 40 OR AVG(total) > 8)
ORDER BY total_spending DESC, customer_id;

	