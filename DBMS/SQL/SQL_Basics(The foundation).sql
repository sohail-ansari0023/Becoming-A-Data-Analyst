/* Stage A - Foundation */

-- 1. Display every column from the customer table.
SELECT * FROM customer;

-- 2. Display only the first_name column from cutomer.
SELECT first_name FROM customer;

-- 3. Display first_name, last_name, and email from customer.
SELECT first_name, last_name, email
FROM customer;

-- 4. Display the name and unit_price columns from track.
SELECT t.name, t.unit_price
FROM track AS t;

-- 5. Display the name column form artist.
SELECT name FROM artist;

-- 6. Find all cutomers whose country is Brazit.
SELECT * FROM customer
WHERE country = 'Brazil';

-- 7. Find all tracks whose unit_price is greater than 1.00
SELECT * FROM track
WHERE unit_price > 1.00;

-- 8. Find all cutomers whose city is Prague.
SELECT * FROM customer
WHERE city = 'Prague';

-- 9. find all employees whose title is Sales Support Agent.
SELECT * FROM employee
WHERE title = 'Sales Support Agent';

-- 10. find all tracks whose composer is Ludwig van Beethoven.
SELECT * FROM track
WHERE composer = 'Ludwig van Beethoven';

/* Stage B - Sorting and limiting */

-- 11. Display all tracks in ascending order of unit_price
SELECT * FROM track
ORDER BY unit_price ASC;

-- 12. Display all tracks in descending order of unit_price
SELECT * FROM track
ORDER BY unit_price DESC;

-- 13. Display cutomers in alphabetical order by last_name.
SELECT * FROM customer
ORDER BY last_name ASC;

-- 14. Display tracks in alphabetical order by name
SELECT * FROM track
ORDER BY name ASC;

-- 15. Display the 10 tracks with the lowest unit_price
SELECT * FROM track
ORDER BY unit_price ASC
LIMIT 10;

-- 16. Display the 10 tracks with the highest unit_price.
SELECT * FROM track
ORDER BY unit_price DESC
LIMIT 10;

-- 17. Display the first 5 cutomers. Return all their columns.
SELECT * FROM customer
LIMIT 5;

-- 18. Display the unique countries in customer.
SELECT DISTINCT country
FROM customer;

-- 19. Display the unique composers in track.
SELECT DISTINCT composer
FROM track;

-- 20. Display the unique combinations of billing_country and billing_city in invoice.
SELECT DISTINCT billing_country, billing_city
FROM invoice;

/* Stage C - Business-style SQL practice */

/* 21. Find tracks with a unit_price greater than 1.00. Show the name and
price, from highest price to lowest */

SELECT name, unit_price 
FROM (
   SELECT * FROM track
   WHERE unit_price > 1.00
)
ORDER BY unit_price DESC;

/* 22. find customers in Brzil. Display first_name, last_name, and 
email in alphabetical order by last_name */

SELECT first_name, last_name, email
FROM (
   SELECT * FROM customer
   WHERE country = 'Brazil'
)
ORDER BY last_name ASC;

/* 23. Display the 5 longest tracks. Show name and milliseconds,
sorted from longest to shortest. */

SELECT name, milliseconds
FROM (
   SELECT name, milliseconds
   FROM track
   ORDER BY milliseconds DESC
   LIMIT 5
)
ORDER BY milliseconds DESC;

/* 24. Display the 10 shortest tracks. Show name and milliseconds,
sorted from shortest to longest. */

SELECT name, milliseconds
FROM (
   SELECT name, milliseconds
   FROM track
   ORDER BY milliseconds ASC
   LIMIT 10
)
ORDER BY milliseconds ASC;

/* 25. Display invoices with a total greater than 10. Show invoice_id, 
invoice_date, and total. Sort by total from highest to lowest. */

SELECT invoice_id, invoice_date, total
FROM (
    SELECT invoice_id, invoice_date, total
	FROM invoice
	WHERE total > 10
)
ORDER BY total DESC;

/* 26. Display the 5 most recent invoices. Show invoice_id, invoice_date,
and total. Sort by invoice_date from newest to oldest. */

SELECT invoice_id, invoice_date, total
FROM (
    SELECT invoice_id, invoice_date, total
	FROM invoice
	ORDER BY invoice_date DESC
	LIMIT 5
)
ORDER BY invoice_date DESC;

/* 27. Display all employees sorted by hire_date, from earliest to latest.*/

SELECT * FROM employee
ORDER BY hire_date ASC;

/* 28. Display the unique combinations of country and state in customer*/
SELECT DISTINCT country, state
FROM customer;

/* 29. Display the 15 tracks with the highest unit_price. Rename
name as Track Name and unit_price as Price. */

SELECT name AS "Track Name", unit_price AS "Price"
FROM track
ORDER BY unit_price DESC
LIMIT 15;

/* 30. Display the 10 customers whose last names come first alphabetically.
Show first_name ans First Name and last_name as Last Name.*/

SELECT first_name AS "First Name", last_name AS "Last Name"
FROM customer
ORDER BY last_name ASC
LIMIT 10;