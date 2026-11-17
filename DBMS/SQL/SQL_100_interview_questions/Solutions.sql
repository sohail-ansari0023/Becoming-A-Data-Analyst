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

/*------------------------------------------------------------
               Stage 3 — Aggregation and grouping
-------------------------------------------------------------*/

/* Q31. Write a SQL query to find the product count, minimum
price, average price rounded to two decimals, and total stock
quantity. */

SELECT
	COUNT(*) AS product_count,
	MIN(price) AS minimum_price,
	ROUND(AVG(price), 2) AS avg_price,
	SUM(stock_quantity) AS total_stock
FROM products;

/* Q32. Write a SQL query to count all customers, customers with
a phone, and customers without a phone in one query.*/

SELECT
	COUNT(*) AS total_customers,
	COUNT(phone) AS customer_with_phone,
	SUM(
		CASE
			WHEN phone IS NULL THEN 1
			ELSE 0
		END
	) AS customer_without_phone
FROM customers;

/* Q33. Write a SQL query to count customers in  each city.
Order by count descending and city ascending.*/

SELECT
	city,
	COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC, city ASC;

/* Q34. Write a SQL query to find customers with at least five
orders of any status.*/

SELECT
	customer_id,
	COUNT(*) AS order_counts
FROM orders
GROUP BY customer_id
HAVING COUNT(*) >= 5;

/* Q35. Write a SQL query to find customers with at least four
orders among delivered orders placed during January—June 2025.*/

SELECT
	customer_id,
	COUNT(*) AS order_placed
FROM orders
WHERE status = 'delivered'
    AND (ordered_at >= TIMESTAMP '2025-01-01'
	AND ordered_at < TIMESTAMP '2025-07-01')
GROUP BY customer_id
HAVING COUNT(*) >= 4;

/* Q36. Write a SQL query to calculate item sales and payable
amount for every order, including cancelled orders. Add each 
order's shipping fee exactly once. */

SELECT
	o.order_id,
	o.status,
	o.shipping_fee,
	COALESCE(SUM((oi.quantity * oi.unit_price) - oi.discount_amount), 0) AS total_item_sales,
	COALESCE(SUM((oi.quantity * oi.unit_price) - oi.discount_amount), 0) + o.shipping_fee AS payable_amount
FROM orders AS o
LEFT JOIN order_items AS oi
	ON o.order_id = oi.order_id
GROUP BY
	o.order_id,
	o.status,
	o.shipping_fee;

/* Q37. Write a SQL query to count total, delivered, cancelled
and currently opens orders for every customer who has orders.
Open means placed or shipped. */

SELECT
	customer_id,
	COUNT(*) AS total_orders,
	COUNT(*) FILTER (WHERE status = 'delivered') AS delivered_orders,
	COUNT(*) FILTER (WHERE status = 'cancelled') AS cancelled_orders,
	COUNT(*) FILTER (WHERE status IN ('placed', 'shipped')) AS open_orders
FROM orders
GROUP BY customer_id
ORDER BY customer_id;

/* Q38. Write a SQL query to find average payable amount across
delivered orders. Calculate each order's total before taking
the average.*/

WITH order_totals AS (
	-- Phase 1: Calculate the total payable amount per delivered order
	SELECT
		o.order_id,
		COALESCE(SUM((oi.quantity * oi.unit_price) - oi.discount_amount), 0) + o.shipping_fee AS amount_payable
	FROM orders AS o
	LEFT JOIN order_items AS oi
		ON o.order_id = oi.order_id
	WHERE o.status = 'delivered'
	GROUP BY o.order_id, o.shipping_fee
)

-- Phase 2: Take the average of those calculated totals
SELECT
	AVG(amount_payable) AS average_amount
FROM order_totals;

/* Q39. Write a SQL query to calculate units sold, sales, and 
distinct buyers for categories with delivered sales. Ignore
returns. */

WITH delivered_sales AS (
	SELECT
		o.order_id,
		o.customer_id,
		oi.product_id,
		oi.quantity,
		oi.unit_price,
		oi.discount_amount
	FROM orders AS o
	JOIN order_items AS oi
		ON o.order_id = oi.order_id
	WHERE o.status = 'delivered'
)

SELECT
	p.category_id,
	SUM(quantity) AS units_sold,
	COALESCE(SUM((ds.quantity * ds.unit_price) - ds.discount_amount),0) AS sales,
	COUNT(DISTINCT ds.customer_id) AS distinct_buyers
FROM delivered_sales AS ds
JOIN products AS p
	ON ds.product_id = p.product_id
GROUP BY category_id;

/* Q40. Write a SQL query to count attempts, successess, and
failures for each payment method. Calculate successful amount
and attempt success rate as a percentage. */

SELECT * FROM payments;

SELECT
	method,
	COUNT(*) AS total_attempts,
	COUNT(*) FILTER (WHERE status = 'success') AS successes,
	COUNT(*) FILTER (WHERE status = 'failed') AS failures,
	COALESCE(SUM(amount) FILTER (WHERE status = 'success'), 0) AS total_successful_amount,
	ROUND(
		COUNT(*) FILTER (WHERE status = 'success') * 100.0 /
		COUNT(*), 2
	) AS success_rate_perc
FROM payments
GROUP BY method;

/* Q41. Write a SQL query to count orders, unique ordering 
customers, and orders per customer for each month with orders
in 2025, include every status. */

SELECT * FROM orders;

SELECT
	EXTRACT(MONTH FROM ordered_at) AS order_month,
	COUNT(order_id) AS total_orders,
	COUNT(DISTINCT customer_id) AS unique_customers,
	ROUND(COUNT(order_id)::NUMERIC / COUNT(DISTINCT customer_id), 2) AS orders_per_customer
FROM orders
WHERE ordered_at >= TIMESTAMP '2025-01-01'
	AND ordered_at < TIMESTAMP '2026-01-01'
GROUP BY EXTRACT(MONTH FROM ordered_at) 
ORDER BY order_month;

/* Q42. Write a SQL query to find products with at least two
reviews and average rating of at least 3. Include average rating
and review count. */

SELECT * FROM reviews;

SELECT
	product_id,
	COUNT(review_id) AS review_count,
	ROUND(AVG(rating), 2) AS avg_rating
FROM reviews
GROUP BY product_id
HAVING COUNT(review_id) >= 2
	AND ROUND(AVG(rating), 2) >=3;

/* Q43. Write a SQL query to count orders in each status and
show the total shipping fees for that status. Include every
status present in the orders table. */

SELECT * FROM orders;

SELECT	
	status,
	COUNT(order_id) AS order_count,
	SUM(shipping_fee) AS total_shipping_fee
FROM orders
GROUP BY status;

/* Q44. Wrtie a SQL query to find employee names that appear
more than once. Show each name and its number of occurrences.*/

SELECT * FROM orders;

SELECT
	employee_id,
	COUNT(order_id) AS occurences
FROM orders
GROUP BY employee_id
ORDER BY employee_id;

/* Q45. Write a SQL query to show each department's employee
count and average salary. Return only departments least three
employees using HAVING. */

SELECT * FROM departments;
SELECT * FROM employees;

SELECT
	department_id,
	COUNT(employee_id) AS employee_count,
	ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) >= 3;
	


/* Q46. Write a SQL query to find salary amounts earned by 
more than one employee. Show each salary and the number of 
employees earning it. */

SELECT * FROM employees;

SELECT
	salary,
	COUNT(employee_id) AS number_of_employee
FROM employees
GROUP BY salary
HAVING COUNT(employee_id) > 1;

/*-----------------------------------------------------------
                 STAGE 4 — Joins and relationship
				            reasoning
------------------------------------------------------------*/

/* Q47. Write a SQL query to list each order with the customer's
name and city, regardless of order status. */

SELECT * FROM orders;

SELECT
	c.customer_id,
	c.full_name,
	c.city,
	o.order_id,
	o.status
FROM customers AS c
JOIN orders AS o
	ON c.customer_id = o.customer_id;

/* Q48. Write a SQL query to return every customer with their
number of orders. including customers with zero orders.*/

SELECT
	c.customer_id,
	c.full_name,
	COUNT(order_id) AS orders_count
FROM customers AS c
LEFT JOIN orders AS o
	ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY c.customer_id;

/* Q49. Write a SQL query to find customers who have never
placed an order, using LEFT JOIN. */

SELECT
	c.customer_id,
	c.full_name,
	o.order_id
FROM customers AS c
LEFT JOIN orders AS o
	ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.customer_id;

/* Q50. Write a SQL query to return every category with its
number of products, including categories with no products. */

SELECT
	c.category_id,
	c.category_name,
	COUNT(p.product_id) AS product_counts
FROM categories AS c
LEFT JOIN products AS p
	ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name;

/* Q51. Write a SQL query to find products that have never
appeared in order_items, regardless of order status. */

SELECT * FROM order_items;

SELECT
	p.product_id,
	p.product_name,
	o.order_item_id
FROM products AS p
LEFT JOIN order_items AS o
	ON p.product_id = o.product_id
WHERE o.order_item_id IS NULL;

/* Q52. Write a SQL query to show every employee alongside
their manager's name, including employees without a manager. */

