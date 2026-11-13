/* --------------------------------------------------------------
                   STAGE 1 — Beginner Warm-up
---------------------------------------------------------------*/

/* Q1. Write a SQL query to show all columns for every customer.*/

SELECT * FROM customers;

/* Q2. Write a SQL query to show only the ID, name, and price of
every product. */

SELECT
	product_id,
	product_name,
	price
FROM products;

/* Q3. Write a SQL query to show all orders whose status is
delivered. */

SELECT *
FROM orders
WHERE status = 'delivered';

/* Q4. Write a SQL query to find products priced at ₹1,000 or 
more. */

SELECT *
FROM products
WHERE price > 1000;

/* Q5. Write a SQL query to find active products with stock
greater than zero. */

SELECT *
FROM products
WHERE is_active = 1
	AND stock_quantity > 0;

/* Q6. Write a SQL query to find customers whose city is either
Delhi or Mumbai using IN. */

SELECT *
FROM customers 
WHERE city IN ('Delhi', 'Mumbai');

/* Q7. Write a SQL query to list the distinct statuses found in
the orders table. */

SELECT 
	DISTINCT (status)
FROM orders;

/* Q8. Write a SQL query to list products from highest to lowest
price, breaking ties by product_id. */

SELECT
	product_id,
	product_name,
	price
FROM products
ORDER BY price DESC, product_id;

/* Q9. Write a SQL query to show the five cheapest products, 
breaking prices ties by product_id. */

SELECT
	product_id,
	product_name,
	price
FROM products
ORDER BY price, product_id
LIMIT 5;

/* Q10. Write a SQL query to count the total number of orders.*/

SELECT
	COUNT(*) AS total_products
FROM products;

/*--------------------------------------------------------------
                    Stage 2 - Querying, filtering and 
					          epressions
--------------------------------------------------------------*/

/* Q11. Write a SQL query to list customers from Delhi or Mumbai,
sorted by full_name and then customer_id. */

SELECT *
FROM customers
WHERE city IN ('Delhi', 'Mumbai')
ORDER BY full_name, customer_id;

/* Q12. Write a SQL query to find active products priced between
₹500 and ₹1,500 inclusive, with stock greater than zero. Sort
by price descending, the product_id. */

SELECT *
FROM products
WHERE is_active = 1
	AND (price BETWEEN 500 AND 1500)
	AND stock_quantity > 0
ORDER BY price DESC, product_id;

/* Q13. Write a SQL query to find orders whose status is placed
or shipped, exluding orders with free shipping. Sort by ordered_at
then order_id. */

SELECT *
FROM orders
WHERE status IN ('placed', 'shipped')
	AND shipping_fee <> 0
ORDER BY ordered_at, order_id;

/* Q14. Write a SQL query to find products whose name contains
Book, and customers whose name begins with A. Write two queries
using the database collation. */

SELECT *
FROM products
WHERE product_name ILIKE '%Book%';

SELECT *
FROM customers
WHERE full_name ILIKE 'A%';


/* Q15. Write a SQL query to find customeres whth no phone number
and no referrer. Do not compare NULL using the equality operator.*/

SELECT *
FROM customers
WHERE phone IS NULL
	AND referred_by IS NULL;

/* Q16. Write a SQL query to list each city once, alphabetically.
Write a separate query counting distinct cities. */

SELECT
	DISTINCT city
FROM customers
ORDER BY city ASC;

SELECT
	COUNT(DISTINCT city) AS city_count
FROM customers;

/* Q17. Write a SQL query to return the second page of active 
products using five rows per page, sorted by price descending
and product_id ascending. */

SELECT *
FROM products
WHERE is_active = 1
ORDER BY price DESC, product_id ASC
LIMIT 5 OFFSET 5;

/* Q18. Write a SQL query to find every order placed in January
2025, including orders late on January 31. Use an inclusive
start and exlusive end timestamp. */

SELECT *
FROM orders
WHERE ordered_at >= TIMESTAMP '2025-01-01'
	AND ordered_at < TIMESTAMP '2025-02-01';

/* Q19. Write a SQL query to calculate each line's subtotal
before discount and lines sales after discount for order 4.*/

SELECT 
    order_item_id,
    product_id,
    (quantity * unit_price) AS subtotal_before_discount,
    (quantity * unit_price) - discount_amount AS sales_after_discount
FROM order_items
WHERE order_id = 4;

/* Q20. Write a SQL query to label each product out_of_stock
when stock is zero, low_stock when stock is 1- 20, and in
stock otherwise. */

SELECT
	product_id,
	product_name,
	price,
	stock_quantity,
	(
		CASE
			WHEN stock_quantity = 0 THEN 'out_of_stock'
			WHEN stock_quantity BETWEEN 1 AND 20 THEN 'low_stock'
			ELSE 'In stock'
		END
	) AS stock_status
FROM products;

/* Q21. Write a SQL query to show each customer with phone_display
equal to their phone or not provided when it's NULL. */

SELECT
	customer_id,
	full_name,
	phone,
	CASE
		WHEN phone IS NULL THEN 'Not Provided'
		ELSE phone
	END AS phone_display
FROM customers;

/* Q22. Write a SQL query to produce each customer's lowercase
email domain & the charachter length of the their full name. */

SELECT
	LOWER(SPLIT_PART(email, '@', 2)) AS email_domain,
	LENGTH(full_name) AS length_full_name
FROM customers;

/* Q23. Write a SQL query to calculate calender days from order
date to delivery date for delivered orders. Return only those
taking more than five days. */

SELECT
	order_id,
	customer_id,
	ordered_at,
	status,
	delivered_at,
	DATE(delivered_at) - DATE(ordered_at) AS days_to_deliver
FROM orders
WHERE DATE(delivered_at) - DATE(ordered_at) > 5;

/* Q24. Write a SQL query to find active products where either
price is below ₹500 or stock is zero. Explain why dropping the 
parentheses can change the result.*/

SELECT
	product_id,
	product_name,
	price,
	stock_quantity,
	is_active
FROM products
WHERE is_active = 1
	AND (price < 500 OR stock_quantity = 0);

/* Q25. Write a SQL query to list active products whose name
does not contain the text 'Book' anywhere, sorted by product_id.*/

SELECT 
	product_id,
	product_name,
	is_active
FROM products
WHERE product_name NOT ILIKE '%Book%'
	AND is_active = 1
ORDER BY product_id;

/* Q26. Write a SQL query to find active products whsoe category_id
is not in categories 1 or 2. Use NOT IN and sort by product_id.*/

SELECT
	product_id,
	category_id,
	product_name,
	is_active
FROM products
WHERE is_active = 1
	AND category_id NOT IN (1, 2);

/* Q27. Write a SQL query to find products whose stock quantity
is outside the inclusive range 10-50. Use NOT BETWEEN and include
products with zero stock.*/ 

SELECT
	product_id,
	product_name,
	stock_quantity
FROM products
WHERE stock_quantity NOT BETWEEN 10 AND 50;

/* Q28. Write a SQL query to find customers whose second charachter
in full_name is a. use the single-character wildcard in LIKE.*/

SELECT
	customer_id,
	full_name
FROM customers
WHERE full_name LIKE '_a%';

/* Q29. Write a SQL query to find shipped orders assigned to an
employee. Use IS NOT NULL on employee_id and return the order ID,
employee ID, and order timestamp. */

SELECT
	order_id,
	employee_id,
	ordered_at,
	shipped_at
FROM orders
WHERE status = 'shipped'
	AND employee_id IS NOT NULL;

/* Q30. Write a SQL query to find customers outside Delhi whose 
phone number is missing. Use <> for the city comparison and the
correct NULL condition for the phone. */

SELECT *
FROM customers
WHERE city <> 'Delhi'
	AND phone IS NULL;
