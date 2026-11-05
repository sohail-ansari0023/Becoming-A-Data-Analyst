/*--------------------------------------------------------------
              PRACTICE TEST 
---------------------------------------------------------------*/

/* Q1. Write a query to display each customer's full name in 
uppercase, combining first_name and last_name. Also display the 
length of their email address.*/

SELECT
    UPPER(CONCAT(first_name, ' ', last_name)) AS full_name,
	LENGTH(email) AS len_email
FROM customer;

/* Q2. Write a query that returns each invoice's invoice_id, the
first four characters of its billing country, and its total rounded
to two decimal places. Use invoice and its `billing_country`
column. */

SELECT
	invoice_id,
	SUBSTRING(billing_country FROM 1 FOR 4) 
	    AS first_four_billing_country,
	ROUND(total, 2) AS rounded_total
FROM invoice;

/* Q3. Calcualte total revenue for each calendar year using
invoice_data and total. Display the year and revenue, ordered
from earliest to latest year. */

SELECT
    EXTRACT(YEAR FROM invoice_date) AS invoice_year,
	SUM(total) AS yearly_revenue
FROM invoice
GROUP BY EXTRACT(YEAR FROM invoice_date)
ORDER BY invoice_year;

SELECT
    DATE_TRUNC('year', invoice_date) AS invoice_year,
	SUM(total) AS yearly_revenue
FROM invoice
GROUP BY DATE_TRUNC('year', invoice_date)
ORDER BY invoice_year;

/* Q4. Explain the difference between EXTRACT(MONTH FROM invoice_date)
and DATE_TRUNC('month', invoice_date). Give one practical example
of when you'd use each. */

/* Explaination-----------------------------------------------

The major difference from EXTRACT() and DATE_TRUNC() is that
EXTRACT() extract the desired time(year, month, hour) from a 
timestamp column and produces a numeric result, whereas the 
DATE_TRUNC() are used to Group timestamp adn produces another
timestamp column, I would use EXTRACT() if I have to analyze
the time (year, month, hour) the invoices are made, and use the
DATE_TRUNC() to calculate aggregates. */

/*------------------------------------------------------------
              PRACTICE TEST - 2
-------------------------------------------------------------*/

/* Q1.Write a query that returns the current timestamp and current
date in two separate columns. Explain the difference. */

SELECT
     NOW() AS current_timestamp_,
	 CURRENT_DATE AS current_date_;
/* for current_timestamp I use NOW() and curent_date used 
CURRENT_DATE , the timestamp gives a result that contains 
date and time along with timezone, where as the current_date
contains date 2026-10-27 */

/* Q2. Display every invoice ID and its invoice date formatted 
as `YYYY-MM`. */

SELECT
	invoice_id,
	TO_CHAR(invoice_date, 'YYYY-MM') AS invoice_date
FROM invoice;

/* Q3. Write a query that retuns all invoices issued during the 
March 2025, including invoices made late on March 31. Assume
invoice_date is a timestamp.*/

SELECT *
FROM invoice
WHERE invoice_date >= TIMESTAMP '2025-03-01'
	AND invoice_date < TIMESTAMP '2025-04-01';

/* ----------------------------------------------------------
                     THE SQL MASTERY

        SECTION A — Query fundamentals and filtering
-------------------------------------------------------------*/

/* Q1. Write a query to retrieve the customer_id, full name, 
email, and country of customers who:

- Live in either India, Canada, or Brazil.
- Have an email address ending in .com.
- Have a first name that startas with A or M

Sort the results by country in ascending order and then by 
last name in descending order. Return only the first 10 rows.*/

SELECT
	customer_id, 
	CONCAT(first_name, ' ', last_name) AS full_name,
	email,
	country
FROM customer
WHERE country IN ('India', 'Canada', 'Brazil')
	AND (email LIKE '%.com') -- Like since the .com should be case sensitive
	AND (first_name ILIKE 'A%' OR first_name ILIKE 'M%')
ORDER BY country, last_name DESC
LIMIT 10;


/* Q2. Write two separate queries:

1. Display every distinct billing_country found in the invoice
table, in alphabetical order.

2. Count how many invoices have a missing billing_country.

Explain why COUNT(billing_country) would not give the answer
to the second question. */

-- Query 1.
SELECT
	DISTINCT(billing_country)
FROM invoice
ORDER BY billing_country ASC; -- it isn't necessary but let's make sure of it.

-- Query 2.
SELECT 
	SUM(
		CASE
			WHEN billing_country IS NULL THEN 1
			ELSE 0
		END
	) total_inoices_with_missing_country
FROM invoice;

/* Explaination

COUNT(billing_country) will only count non-null values, only
invoices that have billing country, but the question requires
the count of those country which have null for their billing_
country, that's why I use SUM(CASE WHEN...) or I can use
GROUP BY billing_country and returns the count of each country
along with null as the value of billing_country. */

/* ----------------------------------------------------------
            SECTION B — JOINS and relationship logic
------------------------------------------------------------*/

/* Q1. Write a query that displays every customer, including 
those who have never made a purchase.

For each customer, show: customer_id, Full name, Number of invoices
and Total amount spent

Customer with no invoices must show 0 invoices and 0 spending,
not NULL. */

SELECT
	c.customer_id, 
	CONCAT(c.first_name, ' ', c.last_name) AS full_name,
	COALESCE(COUNT(i.invoice_id), 0) AS invoice_count,
	COALESCE(SUM(i.total), 0) AS total_spending
FROM customer AS c
LEFT JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id, CONCAT(c.first_name, ' ', c.last_name);

/* Q2. A manager wants a report of every customer, but only 
wants to display invoices whose total is greater than $10.

Write the correct query so that:
- Every customer appears.
- Invoices greater than $10 appear with thier details.
- customers without qualifying invoices remain in the results,
with NULL in the invoice columns.

Then explain why putting i.total > 10 in the WHERE clause would
produce a different result. */

SELECT
	c.customer_id,
	c.first_name,
	i.invoice_id,
	i.total
FROM customer AS c
LEFT JOIN invoice AS i
	ON c.customer_id = i.customer_id;
/* Explaination

If I use i.total > 10 in WHERE clause the rows will be filtered
to only those rows that have total greater than $10, since the
management requires all of the records it would eleminate all
those records that are lesser than 10 and contains NULL. */


/*-----------------------------------------------------------
                       The SQL Mastery
------------------------------------------------------------*/

/* Q1. Write a query to retrieve the customer-id, full name, email,
and country of customers who:
- Live in either India, Canada, or Brazil.
- Have an email address ending in .com.
- Have a first name that starts with A or M

sort the results by country in ascending order and then by last
name in descending order. */

SELECT
	customer_id,
	CONCAT(first_name, ' ', last_name) AS full_name,
	email,
	country
FROM customer
WHERE country IN ('India', 'Canada', 'Brazil')
	AND email LIKE '%.com'
	AND (first_name ILIKE 'A%'
		OR first_name ILIKE 'M%')
ORDER BY country, last_name DESC;

/* Q2. Write two separate queries:

1. Display every distinct billing_country found in the invoice
table, in alphabetical order.
2. Count how many invoices hava a missing billing_country.

Explain why COUNT(billing_country) would not give the answer to 
the second question. */

-- 1.
SELECT
	DISTINCT(billing_country) 
FROM invoice;

-- 2. 
SELECT
	SUM(
		CASE
			WHEN billing_country IS NULL THEN 1
			ELSE 0
		END
	) AS invoices_with_missing_country
FROM invoice;

/* Explaination

COUNT(billing_country) would not work because it will only count
those invoices which have non-NULL billing country, since the
question specifically required to count those invoices which 
NULL as the value of billing country, and that's why I used
SUM(CASE WHEN...) */

/* Q3. Write a query that displays every customer, including thsoe
who have never made a purchase.

For each customer, show: customer_id, Full name, Number of invoices
Total amount spent.

Customer with no invoices must show 0 invoices and 0 spending, 
not NULL. */

SELECT
	c.customer_id,
	CONCAT(c.first_name, ' ', c.last_name) AS full_name,
	COALESCE(COUNT(i.invoice_id), 0) AS invoice_count,
	COALESCE(SUM(i.total), 0) AS total_spent
FROM customer AS c
LEFT JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id, full_name;

/* Q4. A manager wants a report of every customer, but only wants
to display invoices whose total is greater than $10.

Write the correct query so that:
- Every customer appears.
- Invoices greater than $10 appear with their details.
- Customer without qualifying invoices remain in the results,
with NULL in invoice columns.

Then explain why putting i.total > 10 in the WHERE clause would
produce a different result. */

SELECT
	c.customer_id,
	CONCAT(c.first_name, ' ', c.last_name) AS full_name,
	i.total
FROM customer AS c
LEFT JOIN invoice AS i
	ON c.customer_id = i.customer_id 
		AND i.total > 10;
		
/* Exaplaination

putting i.total > 10 would eliminate all those customer that
have invoice_total <=10 along with those who have NULL as there
invoices, but the manager wants to look at those too which have
NULL on their invoices and that's why Using i.total > 10 in
ON condition would be appropriate. */

/* Q5. Find all customers who have zero invoices with a total
greater than $10.

Result must include both:
- Customers who have never made a purchase.
- Customers who have invoices, but all of them are $10 or less.

Explain why simply writting WHERE i.total <= 10 after a join woudl
not reliably solve this problem. */

SELECT
	c.customer_id,
	c.first_name
FROM customer AS c
LEFT JOIN invoice AS i
	ON c.customer_id = i.customer_id
		AND i.total > 10
WHERE i.invoice_id IS NULL;

/* Explaination

writing WHERE i.total <= 10 after a join would get those inovices
which has invoices lesser than 10 dollar, but it doesnot sure
that all of those customer does not have any invioce with total
greater than 10$. */

/* Q6. Write a query that returns one row per customer, showing:
- customer ID and full name
- Total number of invoices
- Total spending
- Average invoice value, rounded to two decimal places
- Number of invoices with a total greater than or equal to $20.

Include only customers whose total spending is greater than $100.

Important: Customers must not be accidently merged merely 
becuase they share same first name. */

SELECT
	c.customer_id,
	CONCAT(c.first_name, ' ', c.last_name) AS full_name,
	COUNT(i.invoice_id) AS total_invoices,
	SUM(i.total) AS total_spending,
	ROUND(AVG(i.total), 2) AS average_invoice_value,
	SUM(
		CASE
			WHEN i.total >= 20 THEN 1
			ELSE 0
		END
	) AS invoices_total_atleast_20
FROM customer AS c
JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id, full_name
HAVING SUM(i.total) > 100;


/* Q7. For every customer, calculate:
- Number of invoices below $5.
- Number of invoices btween $5 and $20, inclusive.
- Total money spent on invoices above $20.

Include every customer and display zero where there are no 
qualifying invoices. */

SELECT
	c.customer_id,
	CONCAT(c.first_name, ' ', c.last_name) AS full_name,
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
	) AS invoices_between_5_to_20,
	SUM(
		CASE
			WHEN i.total > 20 THEN i.total
			ELSE 0
		END
	) AS spending_above_20
FROM customer AS c
LEFT JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id, full_name;

/* Q8. Calculate monthly revenue for 2025.
Output:
- Month in `YYYY-MM` format
- Total revenue rounded to two decimal places

Only show months with invoice records. Sort chronologically.
Also explain why a half-open date range is preferable to using
the last day of the month as an inclusive timestamp boundary.*/

SELECT
	TO_CHAR(DATE_TRUNC('month', invoice_date), 'YYYY-MM') AS invoice_month,
	SUM(total) AS total_revenue
FROM invoice
WHERE invoice_date >= TIMESTAMP '2025-01-01 00:00:00'
	AND invoice_date < TIMESTAMP '2026-01-01 00:00:00'
GROUP BY invoice_month
ORDER BY invoice_month;

/* Q9. For every customer, retrieve:
- Uppercase full name,
- Email lenght,
- First four characters of their country.
- current date,
- The text value '250.75' converted to a numeric value.

Explain CAST() versus :: . */

SELECT
	UPPER(CONCAT(first_name, ' ', last_name)) AS full_name_upper,
	LENGTH(email) AS email_len,
	SUBSTRING(country FROM 1 FOR 4) AS first_four_char_country,
	CURRENT_DATE AS current_date_,
	CAST('250.75' AS NUMERIC)
FROM customer;

/* Q10. For every customer, calculate the percentage of their
invoices whose total exceeds $20.

Display: customer_id, total_invoice_count, count of invoices
above $20, percentage above $20, rounded to two decimal places

Include customers with no invoices. Their percentage should be
zero. Avoid division by zero an integer division. */

SELECT
	c.customer_id,
	COUNT(i.invoice_id) AS total_invoice_count,
	SUM(CASE WHEN i.total > 20 THEN 1 ELSE 0 END) AS invoice_above_20,
	ROUND(
			100.0 * (SUM (CASE WHEN i.total > 20 THEN 1 ELSE 0 END))
			/ NULLIF(COUNT(invoice_id), 0),
			2
	) AS percentage_invoice_above_20
FROM customer AS c
LEFT JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id;


/*----------------------------------------------------------
                 SQL Analyst's Challenge
				         ROUND 2
-----------------------------------------------------------*/

/* Q1. Find customers who have made at least one purchase, but
have never purchased from an invoice biled to Brazil. 

Display their customer ID, full name, and total number of
invoices.

Be careful: a customer might have invoices from both Brazil
and other countries. */

SELECT
	c.customer_id,
	CONCAT(c.first_name, ' ', c.last_name) AS full_name,
	COUNT(invoice_id) AS invoice_counts
FROM customer AS c
INNER JOIN invoice AS i -- question states at least one purchase
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id, full_name
HAVING SUM(
			CASE
				WHEN i.billing_country = 'Brazil' THEN 1
				ELSE 0
			END
) = 0;

/* Q2. Calculate each customer's perentage contribution to the
overall invoice revenue.

Diplay: customer_id, full_name, customer's total spending, 
percentage contribution to overall revenue.

Sort from highest contribution to lowest. */

SELECT
	c.customer_id,
	CONCAT(c.first_name, ' ', c.last_name) AS full_name,
	SUM(total) AS total_spending,
	ROUND(
		100.0 * SUM(total) / (SELECT SUM(total) FROM invoice),
		2
	) AS per_to_overall_revenue
FROM customer AS c
JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id, full_name
ORDER BY per_to_overall_revenue DESC;


/* Q3. Find all invoices created during the alst quarter of 
2025 (october, November, December).

Display: invoice_id, customer_id, invoice_date, invoice_month
in MON YYYY format, invoice total.

Sort by invoice date. */

SELECT
	invoice_id, 
	customer_id, 
	invoice_date,
	TO_CHAR(invoice_date, 'Mon YYYY') AS invoice_month,
	total AS invoice_total
FROM invoice
WHERE invoice_date >= TIMESTAMP '10-01-2025'
	AND invoice_date < TIMESTAMP '01-01-2026'
ORDER BY invoice_date;

/* Q4. An analyst wants to find customers whose average invoice
value exceeds $15. They write:

SELECT
	c.customer_id,
	c.first_name,
	AVG(i.total) AS average_spending
FROM customer AS c
LEFT JOIN invoice AS i
	ON c.customer_id = i.customer_id
WHERE AVG(i.total) > 15
GROUP BY c.customer_id, c.first_name;

Identify every issue you can find and rewrite the query correctly.
Also explain whether INNER JOIN would be an acceptable 
alternative here. */

/* WHERE AVG(i.total) > 15 would not be the appropriate clause 
also in the wrong position, instead we use HAVING clause for
filetering after the grouping.

And yes INNER JOIN would be acceptable, since the question 
doesn't specifically require to keep those customers who 
have zero invoices. */

-- Correct query
SELECT
	c.customer_id,
	c.first_name,
	ROUND(AVG(i.total), 2) AS average_spending
FROM customer AS c
JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name
HAVING AVG(i.total) > 15;

/* Q5. For each customer, calculate:
- Total revenue from invoices below $10.
- Total revenue from invoices between $10 and $50, inclusive.
- Total revenue from invoices above $50.
- Overall revenue.

Display all customers, including those whit no invoices. */

SELECT
	c.customer_id,
	CONCAT(c.first_name, ' ', c.last_name) AS full_name,
	SUM(CASE WHEN i.total < 10 THEN i.total ELSE 0 END) AS below_10_revenue,
	SUM(
		CASE
			WHEN i.total BETWEEN 10 AND 50 THEN i.total
			ELSE 0
		END
	) AS revenue_between_10_to_50,
	SUM (
		CASE WHEN i.total > 50 THEN i.total ELSE 0 END
	) AS revenue_above_50,
	SUM(i.total) AS overall_revenue
FROM customer AS c
LEFT JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id, full_name;

/* Q6. Write a query displaying:
- customer_id, full_name UPPERCASE, first three chars of the 
first_name, last three chars of the email, length of the full
name.

Only include customers whose email is not NULL.

Sort by full-name length, longest first. */

SELECT
	customer_id,
	UPPER(CONCAT(first_name, ' ', last_name)) AS full_name,
	SUBSTRING(first_name FROM 1 FOR 3) AS first_three_char_name,
	SUBSTRING(email FROM (LENGTH(email) - 2) FOR LENGTH(email)) AS last_three_char_email,
	LENGTH(CONCAT(first_name, ' ', last_name)) AS len_full_name
FROM customer
WHERE email IS NOT NULL
ORDER BY len_full_name DESC;

/* Q7. Consider the following query:

SELECT
	c.cusomer_id,
	COUNT(*) AS count_star,
	COUNT(i.invoice_id) AS count_invoice,
	SUM(i.total) AS total_spending,
	AVG(i.total) AS average_spending
FROM customer AS c
LEFT JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id;

For a customer who has never made an invoice, prdict the output
of all four aggregate expressions.

Then explain why COALESCE() is useful for some of these expre-
ssions but unnecessary for others. */

/* Explainations

COUNT(*) Would count all customers even those cusomers who
doesn't have any invoices, and gives the count 1.

COUNT(i.invoice_id) Will count only those customers who have
non-null invoice_ids that statement would need the COALESCE 
function to put desired value e.g. 0 if the count(invoice_id)
is NULL.

SUM(i.total) and AVG(i.total) Aggregate functions doesn't not
required to put COALESCE that would be unnecessary , it would
assign 0 for those customers who have NULL invoices.*/

/* Q8. A company wants to identify customers who:
- Have made at least three invoices.
- Have spent more than $100 in total.
- Have at least two invoices with a total greater than $20.
- Have an average invoice value greater thant $15.

Write a query that returns customer ID, full name, invoice count,
total spending, average invoice value, and count of invoices
above $20. */

SELECT
	c.customer_id,
	CONCAT(c.first_name, ' ', c.last_name) AS full_name,
	COUNT(i.invoice_id) AS invoice_count,
	SUM(i.total) AS total_spending,
	ROUND(AVG(i.total), 2) AS average_invoice_value,
	SUM(
		CASE
			WHEN i.total > 20 THEN 1 ELSE 0
		END
	) AS invoices_above_20
FROM customer AS c
JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id, full_name
HAVING
	COUNT(i.invoice_id) >= 3 AND
	SUM(i.total) > 100 AND
	SUM(
		CASE
			WHEN i.total > 20 THEN 1 ELSE 0
		END
	) >= 2 AND
	AVG(i.total) > 15;

/* ---------------------------------------------------------
                     ANTI-JOIN (mini-lab)
-----------------------------------------------------------*/

/* Q1. Find customers who have never made an invoice. Display
customer_id and full name.

We may use either LEFT JOIN or NOT EXISTS. */

SELECT
	c.customer_id,
	CONCAT(c.first_name, ' ', c.last_name) AS full_name
FROM customer AS c
LEFT JOIN invoice AS i
	ON c.customer_id = i.customer_id
WHERE i.invoice_id IS NULL;

/* Q2. Find customers who have made purchases, but have never 
made an invoice with a total greater than $20. 
Include customers whose invoices are all $20 or less.
Display customer_id and total invoice count. */

SELECT
	c.customer_id,
	COUNT(i.invoice_id) AS invoice_count
FROM customer AS c
JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id
HAVING SUM(
			CASE
				WHEN i.total > 20 THEN 1 
				ELSE 0
			END
) = 0;

/* Q3. Find customers who:
- Have made at least one invoice
- Have never made an invoice billed to Brazil.
- Have at least one invoice greater than $20.
Display customer_id, full_name, total invoice count, and 
total spending. */

SELECT
	c.customer_id,
	CONCAT(c.first_name, ' ', c.last_name) AS full_name,
	COUNT(i.invoice_id) AS invoice_count,
	SUM(i.total) AS total_spending
FROM customer AS c
JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id, full_name
HAVING SUM(
			CASE
				WHEN i.billing_country = 'Brazil' THEN 1
				ELSE 0
			END
) = 0 AND SUM(
			CASE 
				WHEN i.total > 20 THEN 1 ELSE 0
			END
) >= 1;

/*------------------------------------------------------------
             ROUND 3 — The Advanced Analyst Challenge 
------------------------------------------------------------*/

/* Q1. Find customers who:
- Have at least one invoice above $50.
- Have at least one invoice below $10.
- Have never made an invoice billed to Brazil.

Display customer_id, full_name, total_invoice_count, and total
spending. */

SELECT
	c.customer_id, 
	CONCAT(c.first_name, ' ', c.last_name) AS full_name,
	COUNT(i.invoice_id) AS invoice_count,
	SUM(i.total) AS total_spending
FROM customer AS c
JOIN invoice AS i
	ON c.customer_id = i.invoice_id
GROUP BY c.customer_id, full_name
HAVING
	SUM(CASE WHEN i.total >= 50 THEN 1 ELSE 0 END) >= 1 AND
	SUM(CASE WHEN i.total <= 10 THEN 1 ELSE 0 END) >= 1 AND
	SUM(CASE
			WHEN i.billing_country = 'Brazil' THEN 1 
			ELSE 0
		END
	    ) = 0;

/* Q2. Find customers whose total spending is greater than the
average total spending per customer.

Importan: calculate the average of customer-level spending, not
the average individual invoice amount.

Display customer_id, full_name, total spending, and average 
customer spending for comparison. */


/* Q3. Find customers who have made purchases at some point but
have not made any purchasing during 2025.
Display customer ID and their total invoice count across all 
years.

Hint: Their overall purchase history and thier 2025 purchase
history are two separate conditions.

/* Q4. An analyst wants customer who have at least two invoices 
above $20. 

They write:

SELECT
	customer_id,
	COUNT(invoice_id) AS invoice_count
FROM invoice
WHERE total > 20 
GROUP BY customer_id
HAVING COUNT(invoice_id) >= 2;

Is this query correct for the requirement? If yes, explain why.
If not, correct it.

Also explain whether the resulating invoice_count represents all
invoices or only invoices above $20. */

/* Q5. for every customer, calcualte:

- Number of invoices with a non_NULL total.
- Number of invoices with a NULL total.
- Total spending from non-NULL invoice amounts.

Include every customer, even those with no invoices.

Think carefully about the difference between a customer with no
invoices and a customer with invoices whose totals are all NULL.*/

