/* INNER JOINS */

SELECT
    c.customer_id,
	c.first_name,
	c.last_name,
	i.invoice_id,
	i.invoice_date,
	i.total
FROM customer AS c
INNER JOIN invoice AS i
    ON c.customer_id = i.customer_id
ORDER BY c.customer_id, i.invoice_date; 

/* Exercise 1: The store wants a list of customers who have made purchases,
showing their names and the amounts of their invoices. */

SELECT
    c.customer_id,
	c.first_name,
	c.last_name,
	i.invoice_id,
	i.total
FROM customer AS c
INNER JOIN invoice AS i
    ON c.customer_id = i.customer_id;

/* Exercise 2: LEFT JOIN
   "which customers have never made a purchase?" */

SELECT
    c.customer_id,
	c.first_name,
	c.last_name,
	i.invoice_id,
	i.total
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
ORDER BY c.customer_id;

/* Exercise 3: Write a query that returns only customers who have
never made a purchase.*/

SELECT
    c.customer_id,
	c.first_name,
	c.last_name,
	i.invoice_id
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
WHERE i.invoice_id IS NULL;

/* Exercise 4: Using the customer and invoice tables, write a
RIGHT JOIN query. */

SELECT
    i.invoice_id,
	i.total,
    c.customer_id,
	c.first_name
FROM customer AS c
RIGHT JOIN invoice AS i
    ON c.customer_id = i.customer_id;
	