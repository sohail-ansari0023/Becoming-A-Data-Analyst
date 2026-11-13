## **Conditional Aggregation `CASE WHEN`**

The idea is simple: Instead of calculating only one total, we can calculate different totals or counts based on different conditions—all in the same query.

### **Lesson 1: Conditional aggregation**

Imagine a customer has these invoices:

| Invoice_id | Total |
|------------|-------|
| 101 | $8 |
| 102 | $25 |
| 103 | $60 | 
| 104 | $15 |

Suppose the business asks: "How many invoices are above $20, and how much money came from those invoices?"

We already know how to filter rows with `WHERE`, but if we use `WHERE total > 20`, we lose the other invoices from the result. Conditional aggregation lets us calculate the above -$20 figures while keeping the overall customer group.

#### **1. Understand `CASE WHEN`**
```SQL
CASE
    WHEN i.total > 20 THEN 1
    ELSE 0
END
```

This expression checks each invoice:
- If the ivoice total is greater then $20, return `1`.
- Otherwise, return `0`.

For our example, the results would be `0`, `1`, `1`,`0`.

Now, summing those values gives the number of invoices above $20.

#### **2. Count invoices that meet a condition**
```SQL
SELECT
    c.customer_id,
    c.first_name,
    SUM(
        CASE
            WHEN i.total > 20 THEN 1
            ELSE 0
        END
    ) AS invoices_above_20
FROM customer AS c
LEFT JOIN invoice AS i
   ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name
ORDER BY invoices_above_20 DESC;
```
Why does `SUM()` count invoices? Becuase every invoice meeting the condition contributes `1`, While every other invoice contributes `0`.

For our example:
> **0 + 1 + 1 + 0 = 2**

So the customer has **2 invoices above $20.**

#### **3. Calculate spending above a threshold**

What if we want the actual amount spent on invoices avobe $20, rather than the number of invoices?

```SQL
SUM(
    CASE
        WHEN i.total > 20 THEN i.total
        ELSE 0
    END
) AS spending_above_20
```

For our example, the calculation is:
> **0 + 25 + 60 + 0 = $85**

Notice the difference:
| Expression | What it calculates | Result |
|------------|--------------------|--------|
| `SUM(CASE WHEN i.total > 20 THEN 1 ELSE 0 END)` | Number of qualifying invoices | 2 |
| `SUM(CASE WHEN i.total > 20 THEN i.total ELSE 0 END)` | Total value of qualifying invoices. | $85 |

The condition is the same, but the value returned by `THEN` changes the calculation.

#### **4. Calculate both metrics in one query**
```SQL
SELECT
    c.customer_id,
    c.first_name,
    COUNT(i.invoice_id) AS total_invoices,
    SUM(
        CASE
            WHEN i.total > 20 THEN 1
            ELSE 0
        END
    ) AS invoices_above_20
    SUM(
        CASE
            WHEN i.total > 20 THEN i.total
            ELSE 0
        END
    ) AS spending_above_20
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name
OERDER BY spending_above_20 DESC;
```

One query now tells us each customer's invoice count, number of invoices above $20, and spending on those invoices.

Notice that we used `COUNT(i.invoice_id)` for the total invoice count. This return `0` for a customer without invoices. The conditional `SUM()` expressions also return `0` in that situation because of `ELSE 0`.

### **Level 4—Batch 1**

**[Click here](../Practice_queries/Conditional_aggregation.sql)**

Example table **customer**

| customer_id | first_name |
|-------------|------------|
| 1 | sohail |
| 2 | rehan | 
| 3 | alfi | 
| 4 | sabir | 
| 5 | wasim | 

**Invoice table**

| customer_id | invoice_id | total |
|-------------|------------|-------|
| 1 | 101 | 20 |
| 2 | 102 | 13 | 
| 1 | 103 | 14 |
| 3 | 104 | 24 | 
| 3 | 105 | 21 | 
| 1 | 106 | 32 | 
| 2 | 107 | 20 | 

```SQL
SELECT 
    c.customer_id,
    c.first_name,
    i.invoice_id,
    i.total
FROM c.customer_id AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id;
```
| customer_id | first_name | invoice_id | total |
|-------------|------------|------------|-------|
| 1 | sohail | 101 | 20 |
| 2 | rehan | 102 | 13 | 
| 1 | sohail | 103 | 14 |
| 3 | alfi | 104 | 24 |
| 3 | alfi | 105 | 21 |
| 1 | sohail | 106 | 32 |
| 2 | rehan | 107 | 20 |
| 4 | sabir | NULL | NULL | 
| 5 | wasim | NULL | NULL |

```SQL
SELECT
    c.customer_id,
    c.first_name,
    COUNT(invoice_id) AS invoice_count
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name;
```
| customer_id | first_name | invoice_count |
|-------------|------------|---------------|
| 1 | sohail | 3 | 
| 2 | rehan | 2 | 
| 3 | alfi | 2 | 
| 4 | sabri | 0 |
| 5 | wasim | 0 |

```SQL
SELECT
    c.customer_id,
    c.fist_name,
    SUM(
        CASE
            WHEN i.total > 15 THEN 1
            ELSE 0
        END
    ) AS invoice_above_15
FROM customer AS c
LEFT JOIN invoice AS i
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name
```

| customer_id | first_name | invoice_id | total | score_count|
|-------------|------------|------------|-------|------------|
| 1 | sohail | 101 | 20 | 1 |
| 2 | rehan | 102 | 13 | 0 | 
| 1 | sohail | 103 | 14 | 0 | 
| 3 | alfi | 104 | 24 | 1 | 
| 3 | alfi | 105 | 21 | 1 |
| 1 | sohail | 106 | 32 | 1 | 
| 2 | rehan | 107 | 20 | 1 |
| 4 | sabir | NULL | NULL | 0 |
| 5 | wasim | NULL | NULL | 0 | 

| customer_id | first_name | invoice_above_15 |
|-------------|------------|------------------|
| 1 | sohail | 2 |
| 2 | rehan | 1 |
| 3 | alfi | 2 |
| 4 | sabir | 0 | 
| 5 | wasim | 0 | 

### **Multi-condition SQL analysis**

We'll use our Chinook database and practice combining `CASE WHEN`, `AND`, `OR`, `COUNT()`, `SUM()`, and `HAVING`.

#### **First, one important concept**

Suppose a customer has these invoice totals:
| Invoice total | Categroy |
|---------------|----------|
| $4 | Below $5 | 
| $12 | Between $5 and $20 |
| $20 | Between $5 and $20 | 
| $35 | Above $20 |

We can calculate all three categories in a single query instead of runnig three separate queries.

```SQL
SELECT
    c.customer_id,
    c.first_name,

    SUM(
        CASE
            WHEN i.total < 5 THEN 1
            ELSE 0
        END
    ) AS invoices_below_5,

    SUM(
        CASE
            WHEN i.total >= 5 AND i.total <= 20 THEN 1
            ELSE 0
        END
    ) AS invoices_5_to_20,

    SUM(
        CASE
            WHEN i.total > 20 THEN 1
            ELSE 0
        END
    ) AS invoices_above_20

FROM customer AS c
JOIN invoice As i
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name;
```
For the example customer, the result would be:
| Below $5 | $5-$20 inclusive | Above $20 |
|----------|------------------|-----------|
| 1 | 2 | 1 |

Notice the exactly $20 belongs in the middle category, not the above-$20 category.

#### **Two upgrades we should know**

**1. Use `BETWEEN` for ranges**

```SQL
WHEN i.total >= 5 AND i.total <= 20
-- Can also be written as
WHEN i.total BETWEEN 5 AND 20
```
`BETWEEN` includes both endpoints. So `$5` and `$20` both qualify.

**2. Use `AND` and `OR` to combine conditions**

For example, to count invoices that are either below $5 or above $20:

```SQL
SUM(
    CASE
        WHEN i.total < 5 OR i.total > 20 THEN 1
        ELSE 0
    END
) AS invoices_outside_range
```

**_One important trap:_** `NOT` and `NULL` can behave unexpectedly if we are not careful. In SQL, comparisons involving `NULL` don't evaluate to true or false in the ordinary way; they produce an unkown result.

### **Challenge: Level 5, Batch 1**

**[Click here](../Practice_queries/Conditional_aggregation.sql)**


### **SQL — Level 6: Advanced Analytical Queries**

1. `HAVING` with conditional aggregation
2. `Calculating` percentages using SQL
3. Using `CASE` with `AVG()`
4. Debugging analytical queries

#### **Concept 1: `HAVING` with conditional aggregations**

Imagine we have an `invoice` table like this:

| invoice_id | customer_id | total |
|------------|-------------|-------|
| 1 | 101 | 25 |
| 2 | 101 | 35 |
| 3 | 101 | 12 |
| 4 | 102 | 15 |s
| 5 | 102 | 40 | 
| 6 | 103 | 50 |

**Our business question:** Which customers have at least three invoices with a total greater than $20?

We already know that `WHERE` filters individual rows and `HAVING` filters groups. But how do we count only the invoices that satisfy a condition?

We use `SUM(CASE WHEN...)`.

```SQL
SELECT
    c.customer_id,
    SUM(
        CASE
            WHEN i.total > 20 THEN 1
            ELSE 0
        END
    ) AS invoices_above_20
FROM customer AS c
JOIN invoice AS i
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name
HAVING SUM(
    CASE
        WHEN i.total > 20 THEN 1
        ELSE 0
    END
) >= 3;
```

The reuslt: Would be an **empty table** since no such qualifying category.

#### **Concept 2: Calculating percentages in SQL**

Now suppose we want to answer:

**What percentage of each customer's invoices are greater than $20?**

The formula is:

> **Percentage = (Qualifying invoices / All invoices) x 100**

In PostgreSQL:

```SQL
SELECT
    c.customer_id,
    COUNT(invoice_id) AS total_invoices,
    SUM(CASE WHEN i.total > 20 THEN 1 ELSE 0 END)
        AS invoices_over_20,
    ROUND(
        100.0 * SUM(
            CASE WHEN i.total > 20 THEN 1 ELSE 0 END
        ) / NULLIF(COUNT(invoice_id), 0),
        2
    ) AS percentage_over_20
FROM invoice
GROUP BY customer_id;
```

Why use `100.0` rather than `100`? It helps ensure decimal arithmetic instead of accidentally getting an integer result in integer-based calculations.

Why `NULLIF(COUNT(invoice_id), 0)`? It prevents division by zero by turning a zero denominator into `NULL`.

### **Level 6 Challenge**

**[Click here](../Practice_queries/Conditional_aggregation.sql)**