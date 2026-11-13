/* -------------------------------------------------------------
           EXISTS & NOT EXISTS — Mastery Practice
--------------------------------------------------------------*/

/*
LEVEL 1: Foundation (Q1 - Q5)

Focus: Understanding matching records and the relationship
between outer and inner queries. */

   
/* Q1. Retrieve the customer_id, first_name, and country of 
customers who have made at least one purchase.

Requirements: EXISTS */

SELECT
	customer_id,
	first_name,
	country
FROM customer
WHERE EXISTS (
	SELECT 1
	FROM invoice
	WHERE invoice.customer_id = customer.customer_id
);

/* Q2. Find all tracks that have never been purhased by any 
customer. Return: track_id, name, composer

Requirement: Use NOT EXISTS */

SELECT
	t.track_id,
	t.name, 
	t.composer
FROM track AS t
WHERE NOT EXISTS (
	SELECT 1
	FROM invoice_line AS il
	WHERE il.track_id = t.track_id
);

/* Q3. Find customers who have made at least one purchase where
the invoice total exceeds $15.

Return their customer_id and name.

Requirement: Use EXISTS with a correlated subquery. */

SELECT
	c.customer_id,
	CONCAT(c.first_name, ' ', c.last_name) AS name
FROM customer AS c
WHERE EXISTS (
	SELECT 1
	FROM invoice AS i
	WHERE i.customer_id = c.customer_id
		AND i.total > 15
);

/* Q4. Find employees who are not currently assigned to support
any customers.

Return employee_id, first_name, last_name, title

Requirement: Use NOT EXISTS. */

SELECT
	e.employee_id,
	e.first_name,
	e.last_name,
	e.title
FROM employee AS e
WHERE NOT EXISTS (
	SELECT 1
	FROM customer AS c
	WHERE c.support_rep_id = e.employee_id
);

/* Q5. Find albums for which none of their tracks have ever been
purchased.

Return: album_id, title.
Requirement: USE NOT EXISTS. */

-- Find those tracks which has been purchased
-- Find those albums that doesn't belongs to those tracks.
SELECT
	a.album_id,
	a.title
FROM album AS a
WHERE NOT EXISTS (
	SELECT 1
	FROM (
		SELECT
			t.track_id,
			t.name,
			t.album_id
		FROM track AS t
		WHERE EXISTS (
			SELECT 1
			FROM invoice_line AS il
			WHERE il.track_id = t.track_id
		)
	) AS tracks_never_purchased
	WHERE tracks_never_purchased.album_id = a.album_id
);


/*-----------------------------------------------------------
            LEVEL 2: Intermediate (Q6 - Q7)
 Focu: Multiple conditions, nested relatinships and correled
                       filtering.
------------------------------------------------------------*/

/* Q6. Find customers who have never made a purchase during
2012. 
Important: A customer may have purchased music in other years
and still qualify.

Return customer_id, name and country.

Requirement: NOT EXISTS. */

-- Find those invoices that are not made on the year 2012. 
-- get those customer_id. 

SELECT
	c.customer_id,
	c.first_name, 
	c.country
FROM customer AS c
WHERE NOT EXISTS (
	SELECT 1
	FROM invoice AS i
	WHERE i.customer_id = c.customer_id
	    AND EXTRACT(YEAR FROM i.invoice_date) = 2012
);

/* Find customer who have purchased at least one track belonging
to the genre Rock.

Return customer_id, first_name, and last_name.

Requirement: EXISTS */


SELECT * FROM invoice_line;
SELECT * FROM invoice;
SELECT * FROM customer;
SELECT * FROM track;

-- tracks that belongs to genre "ROCK"
SELECT
	track_id,
	name,
	genre_id
FROM track
WHERE genre_id = (
		SELECT genre_id
		FROM genre
		WHERE name = 'Rock'
);

-- invoices made on those tracks
SELECT
	il.invoice_id,
	il.track_id
FROM invoice_line AS il
WHERE il.track_id IN (
	SELECT t.track_id
	FROM track AS t
	WHERE genre_id =(
		SELECT genre_id
		FROM genre
		WHERE name = 'Rock'
	)
)

SELECT
	c.customer_id,
	c.first_name,
	c.last_name
FROM customer AS c
JOIN invoice AS i
	ON c.customer_id = i.customer_id
WHERE i.invoice_id IN (
	SELECT
		il.invoice_id
	FROM invoice_line AS il
	WHERE il.track_id IN (
		SELECT t.track_id
		FROM track AS t
		WHERE genre_id =(
			SELECT genre_id
			FROM genre
			WHERE name = 'Rock'
		)
	)
)

/* Q8. Find tracks that have never been purchased by a customer
from Brazil.

Important: A track may have been purchased by customers from
other countries. It should still qualify if no Brazillion 
customer purchased it.

Return track_id, and track_name.

Requirement: NOT EXISTS */

-- Those invo

