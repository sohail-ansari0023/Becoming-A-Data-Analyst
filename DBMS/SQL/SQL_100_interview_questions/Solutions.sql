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

SELECT * FROM employees;

SELECT
	e.employee_name AS employee,
	e2.employee_name AS manager
FROM employees AS e
LEFT JOIN employees AS e2
	ON e.manager_id = e2.employee_id;

/* Q53. Write a SQL query to find employees who earn more than
their immediate manager. */

SELECT
	e.employee_name AS employee,
	e.salary AS employee_salary,
	e2.employee_name AS manager,
	e2.salary AS manager_salary
FROM employees AS e
JOIN employees AS e2
	ON e.manager_id = e2.employee_id
WHERE e.salary > e2.salary;

/* Q54. Write a SQL query to show each order with its handling
employee and that employee's department. Include orders with no 
assigned employee.*/

SELECT * FROM orders;
SELECT * FROM employees;

WITH employee_with_department AS (
	SELECT
		e.employee_id,
		e.employee_name,
		d.department_id,
		d.department_name
	FROM employees AS e
	JOIN departments AS d
		ON e.department_id = d.department_id
)

SELECT
	o.order_id,
	ed.employee_name,
	ed.department_name
FROM orders AS o
LEFT JOIN employee_with_department AS ed
	ON o.employee_id = ed.employee_id;

/* Q55. Write a SQL query to count each customer’s delivered
orders using a LEFT JOIN, including customers with zero
delivered orders. Place the status condition so those 
customers remain in the result. */

SELECT * FROM orders;
SELECT * FROM customers;
WITH delivered_orders AS (
	SELECT * 
	FROM orders
	WHERE status = 'delivered'
)

SELECT
	c.customer_id,
	c.full_name,
	o.status,
	COUNT(o.order_id) AS order_count
FROM customers AS c
LEFT JOIN delivered_orders AS o
	ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name, o.status;

/* Q56. Write a SQL query to show each wishlist entry and
whether that customer has purchased the reviewed product
in a delivered order, Return exactly one row per wishlist
entry. */

WITH delivered_items AS (
	SELECT
		o.customer_id,
		o.order_id,
		oi.product_id,
		o.status
	FROM orders AS o
	JOIN order_items AS oi
		ON o.order_id = oi.order_id
	WHERE o.status = 'delivered'	
)

SELECT
	w.customer_id,
	w.product_id,
	w.added_at,
	CASE
		WHEN EXISTS (
			SELECT 1
			FROM delivered_items AS di
			WHERE w.customer_id = di.customer_id
				AND w.product_id = di.product_id
		) THEN 'Yes' ELSE 'No'
	END AS is_purchased
FROM wishlist AS w;

/* Q57. Write a SQL query to find reviews written by customers
who have never purchased the reviewed product in a delivered
order. */

WITH delivered_items AS (
	SELECT
		o.customer_id,
		oi.product_id,
		o.status
	FROM orders AS o
	JOIN order_items AS oi
		ON o.order_id = oi.order_id
	WHERE o.status = 'delivered'
		
)

SELECT *
FROM reviews AS r
WHERE NOT EXISTS (
	SELECT 1
	FROM delivered_items AS di
	WHERE di.customer_id = r.customer_id
		AND di.product_id = r.product_id
);

/* Q58. Write a SQL query to find products purchased by at
least two different customers in dleivered orders. Show each
product and its number of distinct buyers. */

WITH delivered_items AS (
	SELECT
		o.customer_id,
		oi.product_id,
		o.status
	FROM orders AS o
	JOIN order_items AS oi
		ON o.order_id = oi.order_id
	WHERE o.status = 'delivered'		
)

SELECT
	p.product_id,
	p.product_name,
	COUNT(DISTINCT di.customer_id) AS distinct_customers
FROM products AS p
JOIN delivered_items AS di
	ON p.product_id = di.product_id
GROUP BY p.product_id, p.product_name
HAVING COUNT(DISTINCT di.customer_id) >= 2;

/* Q59. Write a SQL query to show each order's item sales, 
total successful payments, and total approved refunds. Include
orders with no payments or refunds, and avoid multiplying
amounts when joining the tables. */

WITH item_sales AS (
	SELECT
		order_id,
		SUM((quantity*unit_price)-discount_amount) AS item_sales
	FROM order_items
	GROUP BY order_id
),

payments_cte AS (
	SELECT
		order_id,
		SUM(amount) AS total_successful_payment
	FROM payments
	WHERE status = 'success'
	GROUP BY order_id
),

refund_cte AS (
	SELECT
		order_id,
		SUM(ors.refund_amount) AS total_approved_refunds
	FROM order_items AS oi
	JOIN order_returns AS ors
		ON oi.order_item_id = ors.order_item_id
	WHERE ors.status = 'approved'
	GROUP BY order_id
)

SELECT
	o.order_id,
	COALESCE(i.item_sales, 0) AS item_sales,
	COALESCE(p.total_successful_payment, 0) AS total_successful_payments,
	COALESCE(r.total_approved_refunds, 0) AS total_approved_refunds
FROM orders AS o
LEFT JOIN item_sales AS i
	ON o.order_id = i.order_id
LEFT JOIN payments_cte AS p
	ON o.order_id = p.order_id
LEFT JOIN refund_cte AS r
	ON o.order_id = r.order_id
ORDER BY o.order_id;

/* Q60. Write a SQL query to show each customer who referred
another customer, along with their number of direct referrals.
Count each referred customer once.*/

SELECT
	c.customer_id AS referrer_id,
	c.full_name AS referrer_name,
	COUNT(c2.customer_id) AS direct_referrals
FROM customers AS c
JOIN customers AS c2
	ON c.customer_id = c2.referred_by
GROUP BY
	c.customer_id,
	c.full_name;

/* Q61. Write a SQL query to find customers who purchased a
product from the Books category in a delivered order. Return
each customer only once. */

WITH order_item_book_cat AS (
	SELECT
		order_id
	FROM order_items
	WHERE product_id IN (
		SELECT
			product_id
		FROM products 
		WHERE category_id = (
			SELECT
				category_id
			FROM categories
			WHERE category_name = 'Books'
		)
	)
)

SELECT
	c.customer_id,
	c.full_name
FROM customers AS c
WHERE EXISTS (
	SELECT 1
	FROM (
		SELECT o.customer_id
		FROM orders AS o
		JOIN order_item_book_cat AS oibc
			ON o.order_id = oibc.order_id
		WHERE status = 'delivered'
	) AS order_with_book_category
	WHERE order_with_book_category.customer_id = c.customer_id
);

/* Q62. Write a SQL query to list the items in delivered orders, 
showing order ID, customer name, product name, quantity, and
price charged per unit. Return one row per order item. */

WITH customer_with_orders AS (
	SELECT
		c.customer_id,
		c.full_name,
		o.order_id,
		o.status
	FROM customers AS c
	JOIN (
		SELECT *
		FROM orders
		WHERE status = 'delivered'
	) AS o
		ON c.customer_id = o.customer_id		
),

product_in_order_items AS (
	SELECT
		oi.order_id,
		oi.product_id,
		oi.quantity,
		p.product_name,
		p.price AS price_per_unit
	FROM order_items AS oi
	JOIN products AS p
		ON oi.product_id = p.product_id
)

SELECT
	co.order_id,
	co.full_name AS customer_name,
	po.product_name,
	po.quantity,
	po.price_per_unit
FROM customer_with_orders AS co
JOIN product_in_order_items AS po
	ON co.order_id = po.order_id;

-- SIMPLE VERSION

SELECT
	o.order_id,
	c.full_name AS customer_name,
	p.product_name,
	oi.quantity,
	oi.unit_price AS price_charged_per_unit
FROM orders AS o
JOIN customers AS c
	ON o.customer_id = c.customer_id
JOIN order_items AS oi
	ON o.order_id = oi.order_id
JOIN products AS p
	ON oi.product_id = p.product_id
WHERE o.status = 'delivered'
ORDER BY o.order_id, oi.order_item_id;

/* Q63. Write a SQL query to find customer-product pairs that appear
in both wishlist and reviews. Show the customer, product, and rating
match on both customer ID and product ID. */

SELECT
	c.full_name,
	p.product_name,
	r.rating
FROM wishlist AS w
JOIN reviews AS r
	ON w.customer_id = r.customer_id
		AND w.product_id = r.product_id
JOIN customers AS c
	ON w.customer_id = c.customer_id
JOIN products AS p
	ON w.product_id = p.product_id;

/* Q64. Write a SQL query to show each referred customer alongside
the name of the customer who referred them. Return one row per
referral and exclude customers with no referrer. */

SELECT
	c.full_name AS referred_customer,
	ref.full_name AS referred_by
FROM customers AS c
JOIN customers AS ref
	ON c.referred_by = ref.customer_id;

/*--------------------------------------------------------------
         STAGE 6 — Subqueries, CTEs and Set reasoning
----------------------------------------------------------------*/

/*---------------------------------------------------------------
          STAGE 7 — Window functions and raning
----------------------------------------------------------------*/

/* Q78. Write a SQL query to find employees in the top three dist-
inct salary levels within eah department. Include ties. */

WITH ranked_salary AS (
	SELECT
		employee_id,
		employee_name,
		department_id,
		salary,
		DENSE_RANK() OVER (
			PARTITION BY department_id
			ORDER BY salary DESC
		) AS rank_num
    FROM employees
)

SELECT
	rs.employee_id,
	rs.employee_name,
	rs.department_id,
	d.department_name,
	rs.salary,
	rs.rank_num
FROM ranked_salary AS rs
JOIN departments AS d
	ON rs.department_id = d.department_id
WHERE rs.rank_num <= 3;