## **SQL Functions: String, Date and Numeric**

### **1. String functions**

- **`CONCAT`, `SUBSTRING`, `LENGTH`, `UPPER`, `LOWER`**

Combine, extract, measure, and standardize text.

### **2. Date and time functions**

- **`CURRENT_DATE`, `EXTRACT`, `DATE_TRUC`, date arithmetic**

Analyze when transactions happened and calculate time intervals.

### **3. Numeric functions**

- `ROUND` and related functions

Control decimal precision and present financial figures clearly.

### **Part 1 — String functions**

A _string_ is a sequence of characters, such as name, email address, country, or product description.

For example, `"Mohammad"`, `"SOHAIL"` and `"mohammadsohail@example.come"` are strings. 

#### **1. `CONCAT()` — combine text**

Suppose a customer table has separate `first_name` and `last_name` columns. We want to display a full name.

```SQL
SELECT
    first_name,
    last_name,
    CONCAT(first_name, ' ', last_name) AS full_name
FROM customer;
```

Exmaple:
| first_name | last_name | full_name |
|------------|-----------|-----------|
| John | Smith | John Smith |
| Anna | Brown | Anna Brown |

`CONCAT()` joins the supplied values into one string. The `' '` adds a space between the names.

A common use in data analysis is creating full names, labels, formatted addresses, or readable IDs.

**PostgreSQL note:** `CONCAT()` treats `NULL` arguments as empty strings. So if a last name is `NULL`, the result can still contain the first name and separator. This can leave a trailing space.

#### **2. `SUBSTRING()` — extract part of a string**

Imagine you want to extract the first three characters of a customer's first name.

```SQL
SELECT
    first_name,
    SUBSTRING(first_name FROM 1 FOR 3) AS short_name
FROM customer;
```
Example:
| first_name | short_name |
|------------|------------|
| John | Joh | 
| Anna | Ann |
| Robert | Rob |

The syntax is:
```SQL
SUBSTRING(text FROM start_position FOR number_of_characters)
```
- `text`: the string we want to extract from.
- `start_position`: where extraction begins.
- `number_of_characters`: how many characters to return.

**_SQL string positions begin at 1, not 0._**

#### **3. `LENGTH()` — count characters

```SQL
SELECT
    first_name,
    LENGTH(first_name) AS name_length
FROM customer;
```
Example:
| first_name | name_length |
|------------|-------------|
| John | 4 |
| Anna | 4 |
| Robert | 6 |

This can help identify unusually short or long names, check data quality, or understand text fields.

```SQL
SELECT first_name
FROM customer
WHERE LENGTH(first_name) < 4;
```
This query finds first names containing fewer than four characters.

In PostgreSQL, `LENGTH(text)` counts characters, not bytes. Trailing spaces in a string are counted too.

#### **4. `UPPER()` and `LOWER()` — standardize text**

These function change the letter case.

```SQL
SELECT
    first_name,
    UPPER(first_name) AS uppercase_name,
    LOWER(first_name) AS lowercase_name
FROM customer;
```
Example:
| first_name | uppercase_name | lowercase_name |
|------------|----------------|----------------|
| John | JOHN | john |
| Anna | ANNA | anna |
| Sohail | SOHAIL | sohail | 

A practical data-cleaning example:
```SQL
SELECT *
FROM customer
WHERE LOWER(country) = 'india';
```

This compares the lowercased country value with `'india'`, so a value like `India`, `INDIA`, and `india` match.

**Rememeber:** `UPPER()` and `LOWER()` transform the result; they don't update the stored data unless we use them in an `UPDATE` statement.

### **Part 2 — Numeric functions**

#### **1. `ROUND()` — round numeric values***

Suppose an invoice total is 19.9876. For financial reporting, we may want two decimal places.

```SQL
SELECT
    total,
    ROUND(total::numeric, 2) AS rounded_total
FROM invoice;
```
Example:
| Original Value | Rounded to 2 decimal places |
|----------------|-----------------------------|
| 19.9876 | 19.99 |
| 19.2345 | 19.23 |
| 25.5 | 25.50 |

The syntax is:
```SQL
ROUND(number, decimal_places)
```
In PostgreSQL, the two-argument from `ROUND(number, decimal_places)` accepts `numeric`, so the example casts `total` using `::numeric`. If total is already `numeric`, the cast isn't needed.

### **Part 3 — Date and time functions**
Dates are particularly importants for business analysis: monthly sales, yearly revenue, customer puchase patterns, and invoice trends all depend on them.

#### **1. `CURRENT_DATE` — tody's date

```SQL
SELECT CURRENT_DATE;
```
This returns the current date according to the database session's date context, for example `2026-10-26`.

We can use it to find invoices dated today:

```SQL
SELECT *
FROM invoice
WHERE invoice_date::date = CURRENT_DATE;
```
Here, `invoice_date::date` converts a timestamp to its date component, if needed. If the column is already a `date`, the cast is unnecessary.

#### **2. `EXTRACT()` — get a component of a date**

Suppose `invoice_date` contains timestamps. We want to know the year or month of each invoice.

```SQL
SELECT
    invoice_date,
    EXTRACT(YEAR FROM invoice_date) AS invoice_year,
    EXTRACT(MONTH FROM invoice_date) AS invoice_month
FROM invoice;
```
Example:
| invoice_date | invoice_year | invoice_month |
|--------------|--------------|---------------|
| 2025-03-14 | 2025 | 3 |
| 2025-07-09 | 2025 | 7 |
| 2026-01-22 | 2026 | 1 |

other useful components include:
```SQL
EXTRACT(DAY FROM invoice_date)
EXTRACT(QUARTER FROM invoice_date)
EXTRACT(HOUR FROM invoice_date)
```
The component we extract depends on the type of our date/time column.

#### **3. `DATE_TRUNC()` — group dates into time periods**

This function is especially useful for analytics. It truncates a timestamp to the start of a specified time period.

```SQL
SELECT
    DATE_TRUNC('month', invoice_date) AS invoice_month,
    SUM(total) AS monthly revenue
FROM invoice
GROUP BY DATE_TRUNC('month', invoice_date) 
ORDER BY invoice_month;
```
Instead of reporting every invoice date separately, this query groups invoices by month and calculates monthly revenue.

For example, dates such as March 3, March 14, and March 28, 2025, all become the same monthly group: `2025-03-01 00:00:00`.

We can also use:
```SQL
DATE_TRUNC('year', invoice_date)
DATE_TRUNC('quarter', invoice_date)
DATE_TRUNC('day', invoice_date)
```
The distinction: `EXTRACT(MONTH FROM invoice_date)` returna a number like `3`.

`DATE_TRUNC('month', invoice_date)` returns a timestamp representing the start of that month. The latter also keeps different years separate when grouping monthly data.

#### **Date arithmetic — add or subtract time**

PostgreSQL lets us add or subtract intervals from dates and timestamps.

```SQL
SELECT
    invoice_date,
    invoice_date + INTERVAL '7 days' AS after_one_week,
    invoice_data - INTERVAL '1 month' AS one_month_earlier
FROM invoice;
```

We can also calculate the number of days between two dates using substraction:
```SQL
SELECT DATE '2026-10-26' - DATE '2026-10-01'
    AS days_between;
```
Result: `25`.

One subtle point: subtracting two date values returns an integer number of days. Subtracting timestamps can produce and interval instead.

#### **Quick comparison: Which function should we use?**

| Business requirement | Function |
|----------------------|----------|
| Combine first and last name | `CONCAT()` |
| Extract the first 3 letters | `SUBSTRING()` |
| Count characters in an email | `LENGTH()` |
| Standardized text to uppercase | `UPPER()` |
| Standardized text to lowercase | `LOWER()` |
| Round revenue to 2 decimals | `ROUND()` |
| Get the month number | `EXTRACT()` |
| Group invoices by month | `DATE_TRUNC()` |
| Get today's date | `CURRENT_DATE` |
| Add 7 days to a date | `INTERVAL` arithmetic |

### **Practice test**

**[Click here](../Practice_queries/SQL_functions_date_string_numeric.sql)**

### **Part 4 — Advanced date functions in PostgreSQL**

#### **1. `NOW()` — current date and time**

```SQL
SELECT NOW();
```
Example output: `2026-10-27 13:52:00+05:30` (the precise outpu depends on the databse session's time zone and current time).

Unlike `CURRENT_DATE`, which returns a date, `NOW()` returns a timestamp
with time zone.

Use it when we need the current timestamp, such as recording when an operation happened.

#### **2. `AGE()` — calculate an age or time interval**

Suppose we want to calculate how much time has passed since an invoice was issued.

```SQL
SELECT
    invoice_date,
    AGE(NOW(), invoice_date) AS time_since_invoice
FROM invoice;
```

`AGE()` returns an interval expressed in years, months, and days where applicable.

For example, the interval between `2025-01-27` and `2026-04-27` is 1 year and 3 months.

#### **3. `TO_CHAR()` — format dates for reports**
Sometimes a timestamp is technically correct but not convenient to display. `TO_CHAR()` formats a date or timestamp as text.

```SQL
SELECT
    TO_CHAR(invoice_date, 'DD Mon YYYY') AS formatted_date
FROM invoice;
```

Example:
| original date | Formatted result |
| --------------|------------------|
| 2025-03-14 | 14 Mar 2025 |
| 2025-07-09 | 09 Jul 2025 |

Other useful formats:
```SQL
TO_CHAR(invoice_date, 'YYYY-MM') 
TO_CHAR(invoice_date, 'Month YYYY')
TO_CHAR(invoice_date, 'DD/MM/YYYY')
```

A key distinction: `TO_CHAR()` returns text, not a date. Use it for display and reporting, not as a replacement for proper date values when filtering or sorting chronoogically.

#### **4. Filtering dates correctly**

Suppose we want all invoices from March 2025.

A reliable pattern for a timestamp column is:
```SQL
SELECT *
FROM invoice
WHERE invoice_date >= TIMESTAMP '2025-03-01 00:00:00'
    AND invoice_date <= TIMESTAMP '2025-04-01 00:00:00';
```
Why not use `BETWEEN` with March 1 and March 31? If invoice_date contains times, the upper bound `2025-03-31` may represent midnight at the start of March 31, excluding later invoices that day.

The half-open interval — including the start but excluding the next period's start — captures the whole month safely.

### **Practice Test**

**[Click here](../Practice_queries/SQL_functions_date_string_numeric.sql)**

**customer**

| customer_id | name |
|-------------|------|
| 1 | sohail |
| 2 | alfi |
| 3 | rehan |
| 4 | wasim |
| 5 | haider |
| 6 | sabir | 

**invoice**

| customer_id | invoice_id | billing_country |
|-------------|------------|-----------------|
| 1 | 101 | India |
| 1 | 102 | Brazil |
| 2 | 103 | Canada |
| 2 | 104 | Germany |
| 4 | 105 | Brazil |
| 5 | 106 | India |
| 4 | 107 | Germany |
| 3 | 108 | Canada |