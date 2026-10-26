/* --------------------------------------------------------------
                  LEVEL 4 — Batch 1
----------------------------------------------------------------*/

/* Q1. Display each customer's customer_id and first_name, along 
with the number of their inovoices whose total is greater than $10.
Include customers with zero qualifying invoices. Name the result
invoices_above_10. */

SELECT
     c.customer_id,
	 c.first_name,
	 SUM(
        CASE
		    WHEN i.total > 10 THEN 1
			ELSE 0
		END
	 ) AS invoices_above_10
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name;

/* Q2. Display each customer's customer_id and first_name, along
with the total amount spent on invoices whose total is greater
than $10. Include all customers and show 0 when no invoice quali-
fies. Name the result spending_above_10. */

SELECT
    c.customer_id,
	c.first_name,
	SUM(
        CASE
		    WHEN i.total > 10 THEN i.total
			ELSE 0
		END
	) AS spending_above_10
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name;

/* Q3. For each customer, display their first_name, total number 
of invoices, number of invoices with total >=$5, and total spending
on invoices with total >= $5. */

SELECT
	c.first_name,
	COUNT(i.invoice_id) AS total_invoice_count,
	SUM(
		CASE
			WHEN i.total >= 5 THEN 1
			ELSE 0
		END
	) AS invoices_above_5,
	SUM(
		CASE
			WHEN i.total >= 5 THEN i.total
			ELSE 0
		END
	) AS spending_above_5
FROM customer AS c
JOIN invoice AS i -- INNER JOIN would work in this case
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name;

/* ------------------------------------------------------------
                 SQL Challenge: The Analyst's Test
				  
Topics: JOIN keys, GROUP BY, COUNT(), SUM(), CASE WHEN, & HAVING
---------------------------------------------------------------*/

/* Q1. For each customer who has invoices, display:
customer_id, and first_name, Total number of invoices, Number
of invoices with total >= 10, Total spending on invoices with
total >= 10 (Use INNER JOIN and conditional aggregation) */

SELECT
	c.customer_id,
	c.first_name,
	COUNT(i.invoice_id) AS total_invoices_count,
	SUM(
		CASE
			WHEN i.total >= 10 THEN 1
			ELSE 0
		END
	) AS invoices_not_less_than_10,
	SUM(
		CASE
			WHEN i.total >= 10 THEN i.total
			ELSE 0
		END
	) AS spending_above_ten
FROM customer AS c
INNER JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name;

/* Q2. A student writes this query to calculate each customer's
total spending:

SELECT
	c.customer_id,
	c.first_name,
	SUM(i.total) AS total_spending
FROM customer AS c
JOIN invoices AS i
	ON c.customer_id = i.invoice_id
GROUP BY c.first_name
HAVING SUM(i.total) > 50;

Identify two logical problems and provide the corrected query.*/

/* Explaination

Since the question itself is less informative as per the query
written by the student, A/Q I can find more than two error,

1. c.customer_id = i.invoice_ic, wrong relational column for
   JOIN operation.
2. GROUP BY c.first_name only, will combine different customer
   with same name.
3. HAVING SUM(i.total) > 50; won't be necessary if the question
   stays like it is.
*/

-- Correct query 
SELECT
	c.customer_id,
	c.first_name,
	SUM(i.total) AS total_spending
FROM customer AS c
JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name;

/* Q3. Display customers whose total spending across all invoices
is greater than $100. Show their ID, first_name, and total spending,
with the highest spenders first.

Important: the $100 condition applies to the customer's combined
spending, not to individual invoice totals. */

SELECT
	c.customer_id,
	c.first_name,
	SUM(i.total) AS total_spending
FROM customer AS c
JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name
HAVING SUM(i.total) > 100
ORDER BY total_spending DESC;

/* Q4. Consider this expression:

SUM(
	CASE
		WHEN i.total >= 10 THEN i.total
		ELSE 0
	END
)

Explain:
1. What exactly does it calculate?
2. Why is it different from SUM(i.total)?
3. If a customer has invoice totals of $5, $10, and $20, what
   result does it return?
*/

/* Explaination:

1. That expression calculates the customers total spendin on
   only those invoices which have total at least $10.
2. SUM(i.total) would calculate the sum of all invoices that
   a customer have, It doesn't apply any condition while calculating
   the sum. And that's why we use Conditional aggregations.
3. It will return a total spending of $30 dollar, $5 dollar
   would not qualify and falls on to the ELSE phrase i.e. 0
*/

/*-------------------------------------------------------------
         CHALLENGE: Level 5, Batch 1
--------------------------------------------------------------*/

/* Q1. for every customer who has invoices, show customer_id and
first_name, plus the number of invoices in three categories: 
blow $5, from $5 through $20 inlcusive, and above $20. Use one
query and conditional aggregation. */

SELECT
	c.customer_id,
	c.first_name,
	SUM(
		CASE
			WHEN i.total < 5 THEN 1 
			ELSE 0
		END
	) AS invoices_below_5,
	SUM(
		CASE
			WHEN i.total BETWEEN 5 AND 20 THEN 1
			ELSE 0
		END
	) AS invoices_5_to_20,
	SUM(
		CASE
			WHEN i.total > 20 THEN 1
			ELSE 0
		END
	) AS invoices_above_20
FROM customer AS c
JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name;

/* Q2. For each customer who has invoices, calculate their spending
on invoices from $5 through $20 inclusive, and their spending on
invoices above $20. Show customer_id, first_name, and both
spending totals. Use 0 when acategory has no qualifying invoices. */

SELECT
	c.customer_id,
	c.first_name, 
	SUM(
		CASE
			WHEN i.total BETWEEN 5 AND 20 THEN i.total
			ELSE 0
		END
	) AS spending_5_to_20,
	SUM(
		CASE
			WHEN i.total > 20 THEN i.total
			ELSE 0
		END
	) AS spending_above_20
FROM customer AS c
JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name;

/* Q3. Count each customer's invoices where the total is between
$10 and $30 inclusive, OR the total is greater than $100. Display
customer_id, first_name, and the qualifying invoice count. Use
conditional aggregation. */

SELECT
	c.customer_id,
	c.first_name,
	SUM(
		CASE
			WHEN (i.total BETWEEN 10 AND 30)
				OR i.total > 100 THEN 1
			ELSE 0
		END
	) AS invoice_count_10_to_30_above_100
FROM customer AS c
JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name;

/* Q4. Analyst reasoning and debugging

A student wants to count invoices from $5 through $20 inclusive, but writes:

SUM(CASE WHEN i.total > 5 AND i.total < 20 THEN 1 ELSE 0 END)

Explain exactly which boundary values are mishandled and
provide the corrected expression. Then explain why BETWEEN 5
AND 20 is an equivalent alternative. */

/* Explaination----------------------------------------------

The particular expression exclude the boundaries (endpoints)
i.e invoices total has exactly 5 and 20, the correct expression
would be (i.total >= 5 AND i.total <= 20) which includes both
endpoints, BETWEEN 5 AND 20 are equivalent to this expression 
since BETWEEN computes ranges inclusive their endpoints. */

