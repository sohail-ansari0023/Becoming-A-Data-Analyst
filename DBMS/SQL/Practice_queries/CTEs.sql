/* -------------------------------------------------------------
                  LEVEL 1 — Foundation
---------------------------------------------------------------*/

/* Q1. Create a CTE named customer_invoices that retrieves all 
invoices with total > 10. Display the result CTE using an outer
SELECT. */

WITH customer_invoices AS (
	SELECT
		customer_id,
		invoice_id,
		total
	FROM invoice
	WHERE total > 10
)

SELECT *
FROM customer_invoices;

/* Q2. Create a CTE named genre_tracks that calculates the number
of tracks belonging to each genre. Return genre_id and track_
count */

WITH genre_tracks AS (
	SELECT
		genre_id,
		COUNT(*) AS track_count
	FROM track
	GROUP BY genre_id
)

SELECT *
FROM genre_tracks
ORDER BY genre_id;

/* Q3. Create CTE named customer_spending that calcualtes the
total spending of every customer. Then retrieve only customers
whose spending exceeds $50. */

WITH customer_spending AS (
	SELECT
		customer_id,
		SUM(total) AS total_spending
	FROM invoice
	GROUP BY customer_id
)

SELECT *
FROM customer_spending
WHERE total_spending > 50;

/* -----------------------------------------------------------
                   LEVEL 2 — Intermediate
-------------------------------------------------------------*/

/* Q4. Create a CTE that calculates the average invoice total
for each customer. Join it with the customer table and display:
customer_id, first_name, last_name, average_invoice. */

WITH average_invoice AS (
	SELECT
		customer_id,
		ROUND(AVG(total), 2) AS avg_invoice
	FROM invoice
	GROUP BY customer_id
)

SELECT
	c.customer_id,
	c.first_name, 
	c.last_name,
	ai.avg_invoice
FROM customer AS c
JOIN average_invoice AS ai
	ON c.customer_id = ai.customer_id
ORDER BY c.customer_id;


/* Q5. Create two CTEs:

1. customer_spending: Calculate total spending for every customer.
2. average_spending: Calculate the average of those customer-level
spending totals.

Display customers whose total spending exceeds the overall
average. */

WITH customer_spending AS (
	SELECT
		customer_id,
		SUM(total) AS total_spending
	FROM invoice
	GROUP BY customer_id
),

average_spending AS (
	SELECT
		AVG(total_spending) AS avg_spending
	FROM customer_spending
)

SELECT
	c.customer_id,
	c.first_name,
	cs.total_spending
FROM customer AS c
JOIN customer_spending AS cs
	ON c.customer_id = cs.customer_id
CROSS JOIN average_spending AS av
WHERE cs.total_spending > av.avg_spending;

/* Q6. Create a CTE that calculates total invoice revenue for
each country. Display only countries generating more than $100
in revenue.

Return: billing_country, total_revenue

For this question, use the invoice.billing_country column. */

WITH invoice_revenue AS (
	SELECT
		billing_country,
		SUM(total) AS total_revenue
	FROM invoice
	GROUP BY billing_country
)

SELECT *
FROM invoice_revenue
WHERE total_revenue > 100
ORDER BY total_revenue DESC;