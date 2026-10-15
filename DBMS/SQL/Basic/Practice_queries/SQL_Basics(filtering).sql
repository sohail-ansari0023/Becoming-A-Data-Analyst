/* Q1. Find tracks whose unit_price is greater than 1.00 AND whose
milliseconds are greater than 300000. Show name, unit_price, and
milliseconds */

SELECT name, unit_price, milliseconds
FROM track
WHERE unit_price > 1.00
    AND milliseconds > 300000;

/* Q2. Find customers whose country is Brazil or Germany. Show 
first_name, last_name, and country. */

SELECT first_name, last_name, country
FROM customer
WHERE country = 'Brazil'
    OR country = 'Germany';

/* Q3. Find tracks whose unit_price is NOT equal to 0.99. Show 
name and unit_price. */

SELECT name, unit_price
FROM track
WHERE NOT (unit_price = 0.99);

/* Q4. Find cutomers who are from Brazil AND whose city is São Paulo.
Show first_name, last_name, city, and country. */

SELECT first_name, last_name, city, country
FROM customer
WHERE country = 'Brazil'
    AND city = 'São Paulo';

/* Q5. Find tracks whos genre_id is 1 OR 2, AND whose unit_price
is greater than 1.00. Show name, genre_id, and unit_price. Use
parentheses to group the OR Conditions. */

SELECT name, genre_id, unit_price
FROM track
WHERE (genre_id = 1 OR genre_id = 2)
    AND unit_price > 1.00;

/* ----------------------------------------
      LESSON 1 ENDS HERE (below is lesson 2)
-------------------------------------------*/

/* Q6. Find customers from Brazil, Germany, or France. Display 
first_name, last_name, and country. Use IN. */

SELECT first_name, last_name, country
FROM customer
WHERE country IN ('Brazil', 'Germany', 'France');

/* Q7. Find tracks with unit_price between 0.99 and 1.99, including
both endpoints. Display name and unit_price. */

SELECT name, unit_price
FROM track
WHERE unit_price BETWEEN 0.99 AND 1.99;

/* Q8. Find invoices with a total between 5.00 and 10.00, including
both endpoints. Display invoice_id and total. */

SELECT invoice_id, total
FROM invoice
WHERE total BETWEEN 5.00 AND 10.00;

/* Q9. Find customers whose country is not Brazil, Germany, or France.
Display first_name, last_name, and country. Use NOT IN. */

SELECT first_name, last_name, country
FROM customer
WHERE country NOT IN ('Brazil', 'Germany', 'France');

/* Q10. Find tracks whose genre_id is either 1, 2, or 3 AND whose
unit_price is between 0.99 and 1.99. Display name, genre_id, and 
unit_price. */

SELECT name, genre_id, unit_price
FROM track
WHERE genre_id IN (1, 2, 3)
    AND (unit_price BETWEEN 0.99 AND 1.99);

/* ----------------------------------------------------------
      LESSON 2 ENDS HERE (below is lesson 3)
-----------------------------------------------------------*/

/* Q11. Find tracks whose names begins with 'Love'. Display name
Use LIKE. */

SELECT name
FROM track
WHERE name LIKE 'Love%';

/* Q12. Find tracks whose names contain 'love' anywhere, regradless
of capitalization. Display name, Use ILIKE. */

SELECT name
FROM track
WHERE name ILIKE '%love%';

/* Q13. Find customers whose email addresses end with 'gmail.com'.
Display first_name, last_name, and email. Use ILIKE. */

SELECT first_name, last_name, email
FROM customer
WHERE email ILIKE '%gmail.com';

/* Q14. Find tracks whose names begin with 'A' and have at least
one more character. Display name. Use LIKE. */

SELECT name
FROM track
WHERE name LIKE 'A_%';

/* Q15. Find customers whose first name begin with 'M' or 'S', 
regardless of capitalization. Display first_name, last_name, and email. */

SELECT first_name, last_name, email
FROM customer
WHERE first_name ILIKE 'M%'
    OR first_name ILIKE 'S%';

/* -------------------------------------------------------
      LESSON 3 ENDS HERE (below is lesson 4)
---------------------------------------------------------*/

/* Q16. Find customers whose company is NULL. Display first_name, 
last_name, and company. */

SELECT first_name, last_name, company
FROM customer
WHERE company IS NULL;

/* Q17. Find customers whose company is NOT NULL. Display first_name,
last_name, and company. */

SELECT first_name, last_name, company
FROM customer
WHERE company IS NOT NULL;

/* Q18. Find tracks whose composer is NULL. Display name and compose. */

SELECT name, composer
FROM track
WHERE composer IS NULL;

/* Q19. Find tracks whose composer is NOT NULL and whose unit_price
is greater than 1.00. Display name, composer, and unit_price.*/

SELECT name, composer, unit_price
FROM track
WHERE composer IS NOT NULL
    AND unit_price > 1.00;

/* Q20. Find customers who are not from Brazil, including customers
whose country is NULL Display first_name, last_name, and country.*/

SELECT first_name, last_name, country
FROM customer
WHERE country <> 'Brazil'
    OR country IS NULL;

/*-----------------------------------------------------------
     LESSON 4 ENDS HERE (below is Test questions)
-------------------------------------------------------------*/

/* ALL 8 Filtering Concepts together: AND, OR, NOT, IN, BETWEEN,
LIKE, ILIKE, and IS NULL. */

-- ROUND 1: MIXED FILTERING CHALLENGE

/* Q1. Find cusotmers from Brazil, Germany, or France. Display
first_name, last_name, and country. */

SELECT first_name, last_name, country
FROM customer
WHERE country IN ('Brazil', 'Germany', 'France');

/* Q2. Find tracks priced from 0.99 to 1.99 including both endpoints.
Display name and unit_price */

SELECT name, unit_price
FROM track
WHERE unit_price BETWEEN 0.99 AND 1.99;

/* Q3. Find tracks whose names begin with A, regardless of case.
Display name. */

SELECT name
FROM track
WHERE name ILIKE 'A%';

/* Q4. Find customers whose company is missing. Display first_name, 
last_name, and company */

SELECT first_name, last_name, company
FROM customer
WHERE company IS NULL;

/* Q5. Find tracks costing more than 1.00 AND lasting loger than
300,000 milliseconds. Display name, unit_price, and milliseconds. */

SELECT name, unit_price, milliseconds
FROM track
WHERE unit_price > 1.00
    AND milliseconds > 300000;

/* Q6. Find tracks whose genre_id is NOT 1, 2, or 3. Display
name and genre_id. */

SELECT name, genre_id
FROM track
WHERE NOT genre_id IN (1, 2, 3);

/* Q7. Find customers whose first name begins with M or S, regardless
of case. Display first_name, last_name. */

SELECT first_name, last_name
FROM customer
WHERE first_name ILIKE 'M%'
    OR first_name ILIKE 'S%';

/* Q8. Find invoices wwith total between 5.00 and 10.00 inclusive,
but exclude invoices exactly equal to 7.00. Display invoice_id
and total. */

SELECT invoice_id, total
FROM invoice
WHERE total BETWEEN 5.00 AND 10.00
    AND total <> 7.00;

/* Q9. Find tracks where composer is missing OR unit_price is greater
than 1.00. Display name, composer, unit_price. */

SELECT name, composer, unit_price
FROM track
WHERE composer IS NULL
    OR unit_price > 1.00;

/* Q10. Find customers whose country is not Brazil, including customers
whose country is NULL. Display first_name, last_name, country. */

SELECT first_name, last_name, country
FROM customer
WHERE country <> 'Brazil'
    OR country IS NULL;

/*-----------------------------------------------------------
         WRITING FILTERS FROM BUSINESS REQUIREMENTS
-------------------------------------------------------------*/

/* Q1. Affordable tracks in selected genres
     (Find tracks in gnre 1 or 2 that cost at most 1.00. Display
	 name, genre_id, and unit_price.) */

SELECT name, genre_id, unit_price
FROM track
WHERE (genre_id = 1 OR genre_id = 2)
    AND unit_price <= 1.00;

/* Q2. Customers to exlude
      (Find customers whose country is neither Brazil nor Germany
	  , but include customers whose country is NULL. Diplay first_name,
	  last_name, country.) */

SELECT first_name, last_name, country
FROM customer
WHERE NOT country IN ('Brazil', 'Germany')
    OR country IS NULL;

/* Q3. Tracks needing catalogue review
     (Find tracks whose composer is missing OR whose name contains the word
	 'love', regardless of case. Display name and composer.) */

SELECT name, composer
FROM track
WHERE composer IS NULL
    OR name ILIKE '%love%';

/* Q4. Invoice review
     (Find invoices with totals between 5.00 and 15.00 inclusive, excluding totals
	 above 10.00 unless the total is exactly 12.00. Diplay invoice_id and total)*/

/* I guess this satisfy the required result, every totals above 10.00 is
exluded unless it's exactly 12.00, the range 10.01 to 15.00 is basically
above 10.00 */

SELECT invoice_id, total
FROM invoice
WHERE (total BETWEEN 5.00 AND 10.00)
    OR total = 12.00;




	  