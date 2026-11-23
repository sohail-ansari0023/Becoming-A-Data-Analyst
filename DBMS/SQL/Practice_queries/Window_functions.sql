/*------------------------------------------------------------
                     WINDOW_FUNCTION 
--------------------------------------------------------------*/

/* Q1. Write a query that retrieves: invoice_id, customer_id,
total, and The average invoice total across the entire invoice
table.

Condition: Every invoice must remain visible. Do not use GROUP BY.*/

SELECT * FROM invoice;

SELECT
	invoice_id,
	customer_id,
	total,
	AVG(total) OVER ()
FROM invoice;

/* Q2. Calculate the total spending of each customer while 
retaining every individual invoice. Return: invoice_id, 
customer_id, total, customer_total. */

SELECT
	invoice_id,
	customer_id,
	total,
	SUM(total) OVER(
		PARTITION BY customer_id
	) AS customer_total_spending
FROM invoice;

/* Q3. Calculate a running total of invoice revenue across
the entire invoice table. Return: invoice_id, invoice_date,
total, running_total.

Requirements: 

- Sort invoices by invoice_date ascending.
- Use window function.
- If multiple invoices share a date, use invoice_id as secondary
sorting column. */

SELECT * FROM invoice;

SELECT
	invoice_id,
	invoice_date,
	total,
	SUM(total) OVER(
		ORDER BY invoice_date, invoice_id
	) AS running_total
FROM invoice;

/* Q4. Calculate a running total of spending separately for
every customer. Return: customer_id, invoice_id, invoice_date,
total, customer_running_total

Each customer's running total should restart from their first
invoice. */

SELECT
	customer_id,
	invoice_id,
	invoice_date,
	total,
	SUM(total) OVER (
		PARTITION BY customer_id
		ORDER BY invoice_date, invoice_id
	) AS customer_running_total
FROM invoice;

/* ----------------------------------------------------------
                       ROW_NUMBER()
-------------------------------------------------------------*/

/* Q1. Retrieve: invoice_id, customer_id, total, and row_number
Assign row numbers across the entire invoice table, ordering
by total from highest to lowes. */

SELECT
	invoice_id,
	customer_id,
	total,
	ROW_NUMBER() OVER (
		ORDER BY total DESC, invoice_id
	) AS row_number
FROM invoice;

/* Q2. Assign row numbers separately for every customer.

Requirements:
- Partition by customer_id.
- Order invoices by invoice_date from oldest to newest.
- Include invoice_id, customer_id, invoice_date, and row_num. */

SELECT
	invoice_id,
	customer_id,
	invoice_date,
	ROW_NUMBER() OVER (
		PARTITION BY customer_id
		ORDER BY invoice_date ASC, invoice_id
	) AS row_num
FROM invoice;

/* Q3. Find the single highest_value invoice for every customer
using ROW_NUMBER(). Return only the first-ranked invoice for
each customer. */

WITH ranked_invoices AS (
	SELECT
		invoice_id,
		customer_id,
		total,
		ROW_NUMBER() OVER (
			PARTITION BY customer_id
			ORDER BY total DESC, invoice_id
		) AS row_num
	FROM invoice
)

SELECT * FROM ranked_invoices
WHERE row_num = 1;

/* Q4. Find the latest invoice for every customer.

Return: customer_id, invoice_id, invoice_date, total

Use a CTE. */

WITH ranked_invoices AS (
	SELECT
		customer_id,
		invoice_id,
		invoice_date,
		total,
		ROW_NUMBER() OVER (
			PARTITION BY customer_id
			ORDER BY invoice_date DESC, invoice_id
		) AS invoice_rank
	FROM invoice
)

SELECT *
FROM ranked_invoices
WHERE invoice_rank = 1;

/* Q5. Find the three hihgest_value invoices for every customer.

Return all five relevant fields: customer_id, invoice_id, 
invoice_date, total, row_num */

WITH ranked_invoice_total AS (
	SELECT
		customer_id,
		invoice_id,
		invoice_date,
		total,
		ROW_NUMBER() OVER (
			PARTITION BY customer_id
			ORDER BY total DESC, invoice_id
		) AS invoice_rank
	FROM invoice
)

SELECT * FROM
ranked_invoice_total
WHERE invoice_rank <=3;

-- Independent problem solving 

/* Q6. Write a query that identifies both the first and latest 
invoice for every customer. Return:

customer_id, invoice_id, invoice_date, total, row_num_ascending
row_num_descending

Requirements:
- Use ROW_NUMBER() twice.
- Both calculations must partition by customer_id.
- The first calculation should order by invoice date ascending.
- the second calculation should order by invoice date descending.
- use invoice_id as a secondary sorting column.
- Return only the first and latest invoice for each customer.*/

WITH customer_invoice AS(
	SELECT
		customer_id,
		invoice_id,
		invoice_date, 
		total,
		ROW_NUMBER() OVER (
			PARTITION BY customer_id
			ORDER BY invoice_date ASC, invoice_id
		) AS row_num_ascending,
		ROW_NUMBER() OVER (
			PARTITION BY customer_id
			ORDER BY invoice_date DESC, invoice_id DESC
		) AS row_num_descending
	FROM invoice
)

SELECT * 
FROM customer_invoice
WHERE row_num_ascending = 1
	OR row_num_descending = 1;

/*--------------------------------------------------------------
                   RANK() & DENSE_RANK()
----------------------------------------------------------------*/

/* Q1. Rank all invoices by total in descending order.

Return: invoice_id, cusotmer_id, total and rank_num. */

SELECT
	invoice_id,
	customer_id,
	total,
	RANK() OVER (
		ORDER BY total DESC
	) AS rank_num
FROM invoice;

/* Q2. Repeat Q1 using DENSE_RANK().

Observe what happens when multiple invoices have identical totals. */

SELECT
	invoice_id,
	customer_id,
	total,
	DENSE_RANK() OVER (
		ORDER BY total DESC
	) AS rank_num
FROM invoice;

/* Q3. Display: invoice_id, customer_id, total, row_num, rank_num,
dense_rank_num

Use all thrre window functions to rank invoices by total DESC. */

SELECT
	invoice_id,
	customer_id,
	total,
	ROW_NUMBER() OVER (
		ORDER BY total DESC
	) AS row_num,
	RANK() OVER (
		ORDER BY total DESC
	) AS rank_num,
	DENSE_RANK() OVER (
		ORDER BY total DESC
	) AS dense_rank_num
FROM invoice;

/* Q4. Rank each customer's invoices according to their total, 
highest first.

Return: customer_id, invoice_id, total and invoice_rank

Use RANK() With PARTITION BY customer_id */

SELECT
	customer_id,
	invoice_id,
	total,
	RANK() OVER (
		PARTITION BY customer_id
		ORDER BY total DESC
	) AS rank_num
FROM invoice;

/* Q5. Find invoices belonging to the top three distinct invoice-
total levels for each customer. 

Return: customer_id, invoice_id, total, dense_rank

Use DENSE_RANK and a CTE to filter the results. */

WITH customer_total_ranks AS (
	SELECT
		customer_id,
		invoice_id,
		total,
		DENSE_RANK() OVER (
			PARTITION BY customer_id
			ORDER BY total DESC
		) AS dense_rank_
	FROM invoice
)

SELECT * 
FROM customer_total_ranks
WHERE dense_rank_ <= 3;

/*---------------------------------------------------------------
                 LEVEL 2 — Business-oriented ranking
		(ranking function with joins, aggregations and CTEs.)
----------------------------------------------------------------*/

/* Q6. Using customer and invoice tables:
- Calculate each customer's total spending.
- Rank customers by spending, highest first.
- Include customers who have never made a purchase.

Return: customer_id, first_name, last_name, total_spending,
spending_rank. USE RANK(). */

WITH customers_total_spending AS (
	SELECT
		c.customer_id,
		c.first_name,
		c.last_name,
		SUM(i.total) AS total_spending
	FROM customer AS c
	LEFT JOIN invoice AS i
		ON c.customer_id = i.customer_id
	GROUP BY 
		c.customer_id,
		c.first_name,
		c.last_name
)

SELECT
	customer_id,
	first_name,
	last_name,
	total_spending,
	RANK() OVER (
		ORDER BY total_spending DESC
	) AS spending_rank
FROM customers_total_spending;

/* Q7. Find the top three customers by spending in each country
- Calculate total spending per customer.
- Rank customers separately within each country.
- Return only the top three ranks.

Return country, customer_id, first_name, total_spending, customer_
rank. Use DENSE_RANK() and a CTE */

WITH customer_total_spending AS (
	SELECT
		c.customer_id,
		c.first_name,
		c.country,
		SUM(i.total) AS total_spending
	FROM customer AS c
	JOIN invoice AS i
		ON c.customer_id = i.customer_id
	GROUP BY
		c.customer_id,
		c.first_name,
		c.country
),

customer_ranks AS (
	SELECT
		country,
		customer_id,
		first_name,
		total_spending,
		DENSE_RANK() OVER (
			PARTITION BY country
			ORDER BY total_spending DESC
		) AS customer_rank
	FROM customer_total_spending
)

SELECT *
FROM customer_ranks
WHERE customer_rank <= 3;

/* Q8. Find customers who are tied in toal spending.

Return: customer_id, first_name, country, total_spending, spending_
rank. Use RANK() and return only customers whose rank is shared with
at least one other customer. */

WITH customer_total_spending AS (
	SELECT
		c.customer_id,
		c.first_name,
		c.country,
		SUM(i.total) AS total_spending
	FROM customer AS c
	JOIN invoice AS i
		ON c.customer_id = i.customer_id
	GROUP BY
		c.customer_id,
		c.first_name,
		c.country
),

customers_ranking AS (
	SELECT 
		customer_id,
		first_name,
		country,
		total_spending,
		RANK() OVER (
			ORDER BY total_spending DESC
		) AS spending_rank
	FROM customer_total_spending
),

rank_counts AS (
	SELECT
		*,
		COUNT(*) OVER (
			PARTITION BY spending_rank
		) AS rank_count
	FROM customers_ranking
)

SELECT * FROM  rank_counts
WHERE rank_count > 1
ORDER BY spending_rank, customer_id;