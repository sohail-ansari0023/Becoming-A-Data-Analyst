## SQL Aggregate Functions: COUNT, SUM, AVG, MIN, MAX

### **Lesson 1 - Undrstanding aggregate funcitons**

An aggregate function takes multiple values from a row and produce a summary result.

Imagine a music store has thousands of tracks. Instead of looking at every track individually, a manage might ask:

- How many tracks are in the store?
- What is the total value of trak prices?
- What is the average track price?
- What is the cheapest track?
- What is the most expensive track?

Aggregate functions helps answer these questions.

#### **The five functions ata a glance**

**1. `COUNT()` - count rows or values**

Counts rows or non-NULL values, depending on the expression.

```SQL
SELECT COUNT(*)
FROM tracks;
```
Business question: How many tracks are stored in the database?

**2. `SUM()` - Calculate a total**

Adds numeric values together.

```SQL
SELECT SUM(total)
FROM invoice;
```
Business question: What is the total of all invoice amounts?

**3. `AVG()` - Calculate an average**

Calculates the arithmetic mean of numeric values.

```SQL
SELECT AVG(unit_price)
FROM track;
```
Business question: What is the average price of a track?

**4. `MIN()` - Find the minimum**

Returns the smallest value in the input set.

```SQL
SELECT MIN(unit_price)
FROM track;
```
Business question: What is the lowest track price?

**5. `MAX()` - Find the Maximum**

Returns the largest value in the input set.

```SQL
SELECT MAX(unit_price)
FROM track;
```
Business question: What is the highest track price?

### **3. A critical distinction: `COUNT(*)` vs `COUNT(column)`**

This is one the most important details to understand early.

Consider this example:

| **Customer** | **Company** |
|--------------|-------------|
| Asha | Acme Ltd |
| Ravi | NULL |
| Neha | NULL | 
| Omar | Music Corp |

Compare these queries:
```SQL
SELECT COUNT(*)
FROM customer;
```
This counts every row including rows containing **NULL** vlaues.

```SQL
SELECT COUNT(Company)
FROM customer;
```
This counts only rows where `company` is **not** NULL.

For the Four-row example:
- `COUNT(*)` returns `4`.
- `COUNT(Company)` returns `2`.

PostgreSQL also supports:

```SQL
SELECT COUNT(DISTINCT comapany)
FROM customer
```
This counts distinct, non-NULL company values. In our example, the result is `2`.

**Remember**: `COUNT(*)` counts rows; `COUNT(column)` counts non-NULL values in that column.

### **4. How NULL affects aggregate functions**

Most aggregate functions ignore NULL values.

Suppose the values are:

`100, 200, NULL, 300`

| **Function** | **Result** | **Reason** |
|--------------|------------|------------|
| `COUNT(*)` | 4 | Counts all rows |
| `COUNT(amount)` | 3 | exclude NULL values |
| `SUM(amount)` | 600 | Adds the three kown amounts |
| `AVG(amount)` | 200 | 600 / 3, not 4 |
| `MIN(amount)` | 100 | Smallest non-NULL value |
| `MAX(amount)` | 300 | Largest non-NUL value |

This matters in real analysis. If we calculate an average, NULL values are not treated as zero; the are excluded from the calculations.

One additonal detail: If an aggregate recieves non non-NULL values, `SUM()`, `AVG()`, `MIN()`, `Max()` return NULL. `COUNT()` returns zero.

### 5. ** Practical exercise - 1**

**[Click here](../Practice_queries/SQL_Aggregate_funcitions.sql)**

### **Lesson 2: Aggregate Funcitons + `WHERE`**

#### **1. Understand the idea first**

Suppose our manager asks:

_"What is the average price of tracks belonging to genre 1?"_

We don't want the average price of every track. We want only tracks where `genre_id = 1`.

Here's the query:
```SQL
SELECT AVG(unit_price) AS average_price
FROM track
WHERE genre_id = 1;
```

#### **2. More examples**

**Examaple A - Count tracks priced at 0.99**

```SQL
SELECT COUNT(*) AS track_count
FROM track
WHERE unit_price = 0.99;
```

This countrs only the rows stisfying the price condition.

**Example B- Calculate total invoice value for invoices above 10.00**

```SQL
SELECT SUM(total) AS total_value
FROM invoice
WHERE total > 10.00;
```

This adds totals of ivoices whose individual total is greater than 10. It does not calculate the sum of every invoice.

**Example C - Find the highest track price for genre 1**

```SQL
SELECT MAX(unit_price) AS highest_price
FROM track
WHERE genre_id = 1;
```

This returns the highest price among matching tracks, not the highest price across all genres.

### **Practical Test - 2**

**[Click here](../Practice_queries/SQL_Aggregate_funcitions.sql)**