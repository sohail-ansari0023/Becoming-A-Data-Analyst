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

/* Exercise 5: FULL OUTER JOIN (Keep all customers and all invoices,
including records without a match) */

SELECT
    c.customer_id,
	c.first_name,
	i.invoice_id,
	i.total
FROM customer AS c
FULL OUTER JOIN invoice AS i
    ON c.customer_id = i.customer_id;

/* ------------------------------------------------------------
               JOIN PRACTICE
---------------------------------------------------------------*/

/* Q1. Write a query to display each customer's firs_name, last_name,
and their invoice_id, using the customer and invoice table. */

SELECT
    c.first_name AS first_name,
	c.last_name AS last_name, 
	i.invoice_id AS invoice_id
FROM customer AS c
JOIN invoice AS i
    ON c.customer_id = i.customer_id;

/* Write a query to find customers who have never made an invoice.
Display customer_id, first_name, and last_name.*/

SELECT
    c.customer_id,
	c.first_name,
	c.last_name,
	i.invoice_id
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
WHERE i.invoice_id IS NULL;


/* Write a query using the actual Chinkook tables genre and media_type
that returns every possible genre/media-type combination. Display
both names. */

SELECT
    g.name AS genre_name,
	m.name AS media_type
FROM genre AS g
CROSS JOIN media_type AS m;

/* Using customer and invoice, return invoice_id, total, and the
customer's first_name. Preserve every invoice, even if a matching
customer were missing. */

SELECT 
    c.first_name,
	i.invoice_id,
	i.total
FROM customer AS c
RIGHT JOIN invoice AS i
    ON c.customer_id = i.customer_id;

/* Using customer and invoice, return customer_id, first_name, and 
invoice_id. Preserve all customers and all invoices, including unmathched
rows from either table. */

SELECT
    c.customer_id,
	c.first_name, 
	i.invoice_id
FROM customer AS c
FULL OUTER JOIN invoice AS i
    ON c.customer_id = i.customer_id;

/* Imagine an employee table with columns employee_id, employee_name
and manager_id, write a query returning each employee's name and
their manager's name. Employees without a manager must still appear.*/

-- SELECT
--     e.employee_name,
-- 	m.employee_name
-- FROM employee AS e
-- LEFT JOIN employee AS m
--     ON e.employee_id = m.manager_id;

/* Q1. Find customer who have never made an invoice. */

SELECT
    c.customer_id,
	c.first_name,
	c.last_name,
	i.invoice_id
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
WHERE i.invoice_id IS NULL;

/* Show every customer and any invoices they have. */

SELECT
    c.first_name,
	i.invoice_id,
	i.total
FROM customer AS c
FULL OUTER JOIN invoice AS i
    ON c.customer_id = i.customer_id;

/* A musice store wants a list of invoice details with the customer's
first and last name. Return first_name, last_name, invoice_id and 
total. Only customers with matching invoices should appear. */

SELECT
    c.first_name,
	c.last_name,
	i.invoice_id,
	i.total 
FROM customer AS c
JOIN invoice AS i -- Only customers with matching invoices should appear.
    ON c.customer_id = i.customer_id;

/* The store wants a list of all customers and their invoice 
details, including customers who have never made a purchase. 
Return customer_id, first_name, invoice_id, and total */

SELECT
    c.customer_id,
	c.first_name,
	i.invoice_id,
	i.total
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id;

/* Identify customers who have never made an invoice.

Return only customer_id, first_name and last_name. Don't include
customers who have at least one invoice. */

SELECT * FROM invoice;

SELECT
    c.customer_id,
	c.first_name,
	c.last_name
FROM customer AS c
LEFT JOIN invoice as i
    ON c.customer_id = i.customer_id
WHERE i.invoice_id IS NULL
GROUP BY c.customer_id
HAVING COUNT(*) <= 1; -- neglect customer who have at least one invoice.


/* Display every invoice with invoice_id, total and the the customer's
first_name. The requirement says to preserve all invoices even if 
a mathcing customer record is missing. */

SELECT
    i.invoice_id,
	i.total,
	c.first_name
FROM customer AS c
RIGHT JOIN invoice AS i
    ON c.customer_id = i.customer_id;

/* A music store wants a list of all customers and their invoice
details, but customers without invoices must also appear. Return
customer_id, first_name, invoice_id, total */

SELECT 
    c.customer_id,
	c.first_name,
	i.invoice_id, 
	i.total
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id;

/* The store wants to display every inovice with the customer's 
first_name. Even if an invoice has no matching customer record, it
must remain in the result. Return invoice_id, total, first_name.*/

SELECT 
    i.invoice_id,
	i.total,
	c.first_name
FROM invoice AS i
LEFT JOIN customer AS c
    ON i.customer_id = c.customer_id;

/* Find customers who have never made an invoice. Exclude anyone 
With one or more invoices. Return customer_id, first_name, last_name */

SELECT
    c.customer_id,
	c.first_name,
	c.last_name
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
WHERE i.invoice_id IS NULL;

/* The store wants to identify customers who have never made a puchase.
Return only customers for whom no ivoice exists.

Return exactly: customer_id, first_name, last_name. */

SELECT
    c.customer_id,
	c.first_name,
	c.last_name
FROM customer AS c
LEFT JOIN invoice AS i
     ON c.customer_id = i.customer_id
WHERE i.invoice_id IS NULL;

/* Return every invoice alongside the customer's first and last name.
Ther requirement is to preserve all invoices. even if a matching
customer record is missing. */

SELECT
    i.invoice_id,
	c.first_name,
	c.last_name
FROM invoice AS i
LEFT JOIN customer AS c
    ON i.customer_id = c.customer_id;

/* Show all customers and their invoice totals. Customers with
multiple invoices should appear once per invoice; customers with
no invoices must still appear. 
Return exactly: customer_id, first_name, invoice_id, total */

SELECT DISTINCT
    c.customer_id,
	c.first_name,
	i.invoice_id,
	i.total
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id;

/* ----------------------------------------------------------
               LEVEL 2: missing records, NULLs
			            INTERMEDIATE
-----------------------------------------------------------*/

/* The store wants a list of customers who have never made an
invoice. Return: customer_id, first_name, and last_name. only
customers without matching invoices should appear. */

SELECT
    c.customer_id,
	c.first_name,
	c.last_name
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
WHERE i.invoice_id IS NULL;

/* The store wants all customers, including customers without
invoices. If a customer has an invoice, show the invoice_id 
only when the invoice total is greater than 10. Customers with
no qualifying invoice must still appear. Return: customer_id, 
first_name, and invoice_id. */

SELECT 
    c.customer_id,
    c.first_name,
    i.invoice_id
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
   AND i.total > 10;

/* Find customers who have no invoice with a total greater than
10. A customer who has only invoices of 10 or less should qualify,
as should a customer with no ivoices at all. Return: customer_id,
first_name. */

SELECT
    c.customer_id,
    c.first_name
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
   AND i.total > 10
WHERE i.invoice_id IS NULL;

/* Q1. Write a query that returns every customer, even if they have
no invoices. Return: customer_id, first_name, inovice_id, total.
Only invoices with a total >= 5 should match a customer. If a
customer has no qualifying invoice, the invoice columns should
contain NULL. */

SELECT
    c.customer_id,
	c.first_name,
	i.invoice_id,
	i.total
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
	AND total >= 5;

/* Q2. Return only customers who have an invoice with a total > 10.
Show: customer_id, first_name, invoice_id. Customers without
qualifying invoices must not appear. */

SELECT
    c.customer_id,
	c.first_name,
	i.invoice_id
FROM customer AS c
JOIN invoice AS i
    ON c.customer_id = i.customer_id
	AND i.total > 10;

-- OR

SELECT
    c.customer_id,
	c.first_name,
	i.invoice_id
FROM customer AS c
JOIN invoice AS i
    ON c.customer_id = i.customer_id
WHERE i.total > 10;

-- I guess both can be valid right!

/* Q3. Find customers who have no invoice with a total greater than
10. Include both.

- Customers who have never made a purchase.
- Customer whose invoices are all 10 or less. 

Return customer_id, first_name */

SELECT
    c.customer_id,
	c.first_name,
	i.total
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
	AND i.total <= 10;

/* Q4. */
SELECT
    c.customer_id,
	c.first_name, 
	i.invoice_id,
	i.total
FROM customer AS c
JOIN invoice AS i
     ON c.customer_id = i.customer_id
	 AND i.total >= 5;

/*-----------------------------------------------------------
               LEVEL 2, Batch 2
  Anti-joins, multiple rows, and aggregation after joins
------------------------------------------------------------*/

/*Q1. Using ustomer and invoice find customers who have never had
an invoice. Return customer_id, first_name, last_name.

Constraints: Use LEFT JOIN and IS NULL. */

SELECT
    c.customer_id,
	c.first_name,
	c.last_name
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
WHERE i.invoice_id IS NULL;

/* Q2. Return customers who have more than one invoice.
Return: customer_id, first_name, invoice_count*/

SELECT
    c.customer_id,
	c.first_name,
	COUNT(*) AS invoice_count
FROM customer AS c
JOIN invoice AS i
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name
HAVING COUNT(*) > 1;

/* Q3. Find customers who have no invoice with a total greater than
10, including customers with no invoices at all.

Return customer_id and first_name.

Constraints: Use a LEFT JOIN with the qualifying condition in 
ON, followed by IS NULL. */

SELECT
    c.customer_id,
	c.first_name
FROM customer AS c
LEFT JOIN invoice AS i
     ON c.customer_id = i.customer_id
	 AND i.total > 10
WHERE i.invoice_id IS NULL;

/* Q4. correct query -- Does not require attention */

SELECT
    c.customer_id,
	c.first_name,
	COUNT(i.invoice_id) AS invoice_count
FROM customer AS c
JOIN invoice AS i -- Used INNER JOIN since only customers more than one invoice.
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name
HAVING COUNT(i.invoice_id) > 1;


/* Q1. Write a query that displays every customer and their invoice
count, including customer who have no invoices. Return: customer_id,
first_name, invoice_count */

SELECT
    c.customer_id,
	c.first_name,
	COUNT(i.invoice_id) AS invoice_count
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name;

/* Q2. A student writes this query to count invoices for every customer:

SELECT
    c.customer_id, 
	c.first_name,
	COUNT(*) AS invoice_count
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name;

The query runs successfully, but customers with no invoices receive
and invoice count of 1. 

Explain why this happens and correct the query. */

/* ------------------------------------------------------------
EXPLAINATION: 

Since the student uses COUNT(*) AS invoice_count which counts every
single rows including those customers who have 0 invoices but 
They sure counted as 1 row, the correct query to count only those
customer who have invoices would be the use of COUNT(i.invoice_id)
it'll assign zero count as for the customer who does not have any
invoices or NULL as invoice_id. */

-- Correct query

SELECT
    c.customer_id,
	c.first_name,
	COUNT(i.invoice_id) AS invoice_count
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name;

/* Q3. Return the customer_id and first_name of customers who have
never had an invoice.

Use LEFT JOIN, GROUP BY and HAVING

Hint: We need to filter customers based on their invoice count after
grouping. */

SELECT
    c.customer_id,
	c.first_name
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
WHERE i.invoice_id IS NULL; -- doesn't this query fullfill the requirement

-- OR

SELECT
    c.customer_id,
	c.first_name,
	COUNT(i.invoice_id) AS invoice_count
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name
HAVING COUNT(i.invoice_id) < 1 
    OR COUNT(i.invoice_id) IS NULL;

/* Q4. Return customers who have three or more invoices.

Display: customer_id, first_name, invoice_name 

Use: LEFT JOIN, GROUP BY, and HAVING. */

SELECT
    c.customer_id,
	c.first_name, 
	COUNT(i.invoice_id) AS invoice_count
FROM customer AS c
LEFT JOIN invoice AS i -- I don't LEFT JOIN would be necessary
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name
HAVING COUNT(i.invoice_id) >= 3;

/* -----------------------------------------------------------
            LEVEL 3 - Batch 1
-------------------------------------------------------------*/

/* Q1. Display each customer's customer_id, first_name, and total
spending. Include customers who have no invoices and show their
total spenging as 0 rather than NULL. */

SELECT
    c.customer_id,
	c.first_name,
	COALESCE(SUM(i.total), 0) AS total_spending
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name
ORDER BY total_spending DESC;

/* Q2. Display each customer's customer_id, first_name and average
invoice value. Include all customers, even those without invoices. */

SELECT
    c.customer_id,
	c.first_name,
	COALESCE(AVG(i.total), 0) AS average_invoice_amount
	-- The question doesn't specifically asks for COALESCE method.
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name
ORDER BY average_invoice_amount DESC;


/* Q3. Display customers whose total spending is greater than 
$40. show thei, customer_id, first_name, and total spending.*/

SELECT
   c.customer_id,
   c.first_name,
   SUM(i.total) AS total_spending
FROM customer AS c
JOIN invoice AS i -- INNER JOIN could work for this question though.
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name
HAVING SUM(i.total) > 40
ORDER BY total_spending DESC;

