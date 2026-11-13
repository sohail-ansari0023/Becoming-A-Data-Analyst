/* Q1. Find all invoices whose total is greater than the average
invoice total. Display invoice_id and total. */

SELECT
	invoice_id,
	total
FROM invoice
WHERE total > (
	SELECT AVG(total)
	FROM invoice
);

/* Q2. Find customers who belong to countries where at least one
other customer exists. Display customer_id, first_name, last_name
and country. */

SELECT
	customer_id,
	first_name,
	last_name, 
	country
FROM customer
WHERE country IN (
	SELECT country
	FROM customer
);

/* Q3. Find all invoices belonging to customers from Brazil.
Display invoice_id, customer_id, and total. */

SELECT
	invoice_id,
	customer_id,
	total
FROM invoice
WHERE customer_id IN (
	SELECT customer_id
	FROM customer
	WHERE country = 'Brazil'
);

/* Q4. Find customers who have never made an invoice. Display
customer_id, first_name, and last_name. */

SELECT
	customer_id,
	first_name,
	last_name
FROM customer
WHERE customer_id NOT IN (
	SELECT customer_id
	FROM invoice
);

/* Q5. Find invoices whose total is greater than the maximum 
invoice total belonging to customer_id 5. */

SELECT
	customer_id,
	invoice_id,
	total
FROM invoice
WHERE total > (
	SELECT MAX(total)
	FROM invoice
	WHERE customer_id = 5
);

/*------------------------------------------------------------
             Understanding correlated subqueries
-------------------------------------------------------------*/

/* Q1. Find invoices whose total is greater than the average
invoice total of their respective customers. 

Display: invoice_id, customer_id, total */

SELECT
	i.invoice_id,
	i.customer_id,
	i.total
FROM invoice AS i
WHERE i.total > (
	SELECT AVG(i2.total)
	FROM invoice AS i2
	WHERE i2.customer_id = i.customer_id
);

/* Q2. Find invoice whose total is lower than their respective
customer's average invoice total. Display the same three column.*/

SELECT
	i.invoice_id,
	i.customer_id,
	i.total
FROM invoice AS i
WHERE i.total < (
	SELECT AVG(i2.total)
	FROM invoice AS i2
	WHERE i2.customer_id = i.customer_id
);

/* Q3. Find customers who have at least one invoice whose total
exceeds their own average invoice total. 
Display: customer_id, first_name, last_Name */

SELECT
	c.customer_id,
	c.first_name,
	c.last_name
FROM customer AS c
WHERE c.customer_id IN (
	SELECT
		i.customer_id
    FROM invoice AS i
	WHERE i.total > (
		SELECT AVG(i2.total)
		FROM invoice AS i2
		WHERE i2.customer_id = i.customer_id
	)
	GROUP BY i.customer_id
	HAVING COUNT(*) >= 1
);

/* Q4. Find invoices whose total equals the maximum invoice 
total of their respective customer.

Display: invoice_id, customer_id, total */

SELECT
	i.invoice_id, 
	i.customer_id,
	i.total
FROM invoice AS i
WHERE i.total = (
	SELECT MAX(i2.total)
	FROM invoice AS i2
	WHERE i2.customer_id = i.customer_id
);

/* Q5. Find customers who have made at least two invoices.

Display: customer_id, first_name, last_name */


SELECT
	c.customer_id,
	c.first_name, 
	c.last_name
FROM customer AS c
WHERE c.customer_id IN (
	SELECT
		i.customer_id
	FROM invoice AS i
	GROUP BY i.customer_id
	HAVING COUNT(i.invoice_id) >= 2
);

/*-----------------------------------------------------------
           Part B — Business Analyst Challenges
		         (Intermeidiate—Advanced)
------------------------------------------------------------*/

/* Q6. Find customers whose total spending is greater than the
average total spending of customers from their respective
country.

Display: customer_id, first_name, country, total_spending */

SELECT
	c.customer_id,
	c.first_name,
	c.country,
	SUM(i.total) AS total_spending
FROM customer AS c
JOIN invoice AS i
	ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name, c.country
HAVING SUM(i.total) > (
	SELECT AVG(avg_spending_country)
	FROM (
		SELECT
			c2.customer_id,
			SUM(i2.total) AS avg_spending_country
		FROM customer AS c2
		JOIN invoice AS i2
			ON c2.customer_id = i2.customer_id
		WHERE c2.country = c.country
		GROUP BY c2.customer_id
	)
);


/* Q7. Find customers who have never made an invoice greater 
than $20. Include customers with no invoices at all.

Display: customer_id, first_name, last_name. */

SELECT
	c.customer_id,
	c.first_name,
	c.last_name
FROM customer AS c
LEFT JOIN invoice AS i
	ON c.customer_id = i.customer_id
WHERE NOT EXISTS (
	SELECT 1
	FROM invoice AS i2
	WHERE i2.customer_id = c.customer_id
		AND i2.total > 20
);

