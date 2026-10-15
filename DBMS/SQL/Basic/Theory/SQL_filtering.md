## **SQL filtering**

The goat is not to memorize operators. The goal is to read a business question, identify its conditions, and translate those conditions into **SQL**

We'll study the eight operators in this order:

1. Logical operators (AND, OR, NOT)
    - Combine or reverse conditions.

2. Range and list filtering (IN, BETWEEN)
    - Match a list of values of a range.

3. Text filtering (LIKE, ILIKE)
    - Search text using patterns.

4. Missing values (IS NULL)
    - Find records with missing information.

### **Lesson 1 - AND, OR, and NOT**

#### **1. The foundation: what is a condition?**
A condition is a test that a row must pass.

For example:
```SQL
SELECT *
FROM customer
WHERE country = 'Brazil';
```
The condition is:
```SQL
country = 'Brazil'
```
PostgreSQL checks this condition for each customer. it returns rows where the condition evaluates to true.

#### **2. AND - both conditions must be true**
Imagine we are analysing tracks in a music store. we want tracks whose price is greater than $1.00 and whose duration is greater than five minutes.
```SQL
SELECT name, unit_price, milliseconds
FROM tracks
WHERE unit_price > 1.00 AND milliseconds > 300000;
```

#### **3. OR - at least one condition must be true**
Suppose we want cutomer from Brazil or Germany.
```SQL
SELECT first_name, last_name, country
FROM customer
WHERE country = 'Brazil'O
    OR country = 'Germany';
```
A customer from Brazil qualifies. A customer from Germany also qualifies. A customer from another country does not qualify.

#### **4. NOT - Reverse a condition**
Suppose we want customer who are not from Brazil.
```SQL
SELECT first_name, last_name, country
FROM customer
WHERE NOT (country = 'Brazil');
```
For ordinary non- **NULL** country values, this returns customers whose country is not Brazil.

We can also write:
```SQL
SELECT first_name, last_name, country
FROM customer
WHERE country <> 'Brazil';
```
`<>` means "not equal to".

**Important**: if `country` is `NULL`, neither of these queries returns that row. `NULL` represents missing or unknown information, so it needs special handling.

#### **5. Combining AND and OR**
This where many beginner make mistakes.

Suppose we want tracks that cost more than $1.00 and belong to either Rock or Jazz genre.

```SQL
SELECT name, unit_price, genre_id
FROM tracks
WHERE unit_price > 1.00 
    AND (genre_id = 1 OR genre_id = Jazz);
```
The example above intentionally needs correction: SQL values in a numeric column must be numeric, so `jazz` connot be used like a numeric genre ID. In Chincook, we can use the genre names through a join, which we'll learn later. For now, we use the genre IDs.
```SQL
SELECT name, unit_price, genre_id
FROM tracks
WHERE unit_price > 1.00
    AND (genre_id = 1 OR genre_id = 2);
```

The parentheses group the two genre alternatives together. The price conditon must also be true.

Without parentheses, `AND` has higher precedence than `OR` in PostgreSQL. That can change the meaning of a query.

**Lesson 1: Practice Questions and there solutions**

**[Click here](../Practice_queries/SQL_Basics(filtering).sql)**

### **Lesson 2 - `IN` and `BETWEEN`**

These two operators make filtering shorter and easier to read.

#### **1. `IN` - match any value in a list**

Suppose we want customers from Brazil, Germany, or France.

We could write:
```SQL
SELECT first_name, last_name, country
FROM cutomer
WHERE country = 'Brazil'
    OR country = 'Germany'
    OR country = 'France';
```

That works but becomes harder when the list grows.

With `IN`:
```SQL
SELECT first_name, last_name, country
FROM customer
WHERE country IN ('Brazil', 'Germany', 'France');
```
The results follows the same matching logic.

**RULE**: `IN` is a compact way to test whether a value matches any item in a specified list.

We can slow use `NOT IN` to exclude listed values:

```SQL
SELECT first_name, last_name, country
FROM customer
WHERE country NOT IN ('Brazil', 'Germany', 'France');
```

**Important**: `NULL` values require care with `NOT IN`. If the list itself contains a `NULL`, the result can behave unexpectedly. we'll revisit this when study missing values.

#### **2. `BETWEEN` - match a range**

Suppose we want tracks with a price from 0.99 to 1.99.
```SQL
SELECT name, unit_price 
FROM track
WHERE unit_price BETWEEN 0.99 AND 1.99;
```
`BETWEEN` includes both endpoints. It is equivalent to:
```SQL
WHERE unit_price >= 0.99
    AND unit_price <= 1.99;
```
So a track priced at exactly 0.99 or 1.99 qualifies.

We can use it with dates, too. For examples:
```SQL
SELECT invoice_id, invoice_date, total
FROM invoice
WHERE invoice_date BETWEEN DATE '2023-01-0' AND DATE '2023-12-31';
```
**Lesson 2: Practice questions and solutions**

**[Click here](../Practice_queries/SQL_Basics(filtering).sql)**

### **Lesson 3 - `LIKE` and `ILIKE`**

Now let's learn how to search text when we don't know the complete value.

Imagine we want to find a track, but we only remember that its name begins with "Love". Or we want to find customers whose email adresses end in a particular domain.

This is where pattern matching helps.

#### **1. The two essential wildcards**

| **Symbol** | **Meaning** | **Example** |
|------------|-------------|-------------|
| `%` | Zero or more characters | `Love%` |
| `_` | Exactly one character | `B_b%` |

For example, `Love%` can match `Love`, `Lovely`, or `Love Song`.

`_ove%` can match `Love` or `Dove`, because the underscore represents exactly one character before `ove`.

#### **2. `LIKE` - match a text pattern**
Find tracks whose names begins with "Love":
```SQL
SELECT name
FROM track
WHERE name LIKE 'Love%';
```
In PostgreSQL, `LIKE` is case-sensitive for ordinary text comparisons. So `Love%` and `love%` can produce different results.

#### **3. `ILIKE` - case-insensitivve matching**

Find tracks whose names begins with "love", regardless of capitalization:
```SQL
SELECT name
FROM track
WHERE name ILIKE 'love%';
```

In PostgreSQL, `ILIKE` performs a case-insensitive match according to the active locale.

For common English text searches, it is useful whe we want `Love`, `LOVE`, and `love` to match the same pattern.

#### **4. Common patterns to understand**

Assume we search a text column called `name`.

| **Pattern** | **Meaning** |
|-------------|-------------|
| `Love%` | Begins with `Love` |
| `%Love` | Ends with `Love` |
| `%Love%` | contains `Love` anywhere |
| `A_` | Starts with `A`, followed by exactly one character |
| `_a%` | Second character is `a` |

**Professionl tip**: A pattern like `Love%` can often use a suitable index, while `%Love%` generally cannot use a standard B-tree index efficiently. For now, focus on understanding the patterns.

**Lesson 3- Practice questions and solutions**

**[Click here](../Practice_queries/SQL_Basics(filtering).sql)**


### **Lesson 4 - `IS NULL` and `IS NOT NULL`**
This is our final topic in the filtering module, and it is especially useful for data analysis.

#### **1. What does `NULL` mean?**

`NULL` means the information is **missing** or **unknown**, it does not same as zero, an empty string, or the text `NULL`.

For example, a customer's `company` field might be `NULL` because no company information is recorded.

To find those records, use:
```SQL
SELECT first_name, last_name, company
FROM customer
WHERE company IS NULL;
```

#### **2. `IS NOT NULL` - find values that are present**
to find customers whose company field contains a value:

```SQL
SELECT first_name, last_name, company
FROM customer
WHERE company IS NOT NULL;
```

This returns rows where `company` is not `NULL`. It does not necessarily mean the value is meaningful or non-empty; and empty string is different from `NULL`.

#### **3. Why `= NULL` does not work**
This is incorrect for finding missing values:
```SQL
WHERE company = NULL;
```
In SQL, comparisons with `NULL` usually evaluate to _unknown_, not true or false. A `WHERE` clause only keeps rows where its condition is true.

Use:

```SQL
WHERE company IS NULL;
```
A related professional insight: `NOT (company = 'ABC')` does not include rows with a `NULL` company value either. Missing values require deliberate handling.

**Lesson 4 - Practice questions and solutions**

**[Click here](../Practice_queries/SQL_Basics(filtering).sql)**

### **The deeper concept: SQL's three-valued logic**

SQL conditions can evaluate to `TRUE`, `FALSE` or `UNKNOWN`.

For example, when `country` is NULL.
```SQL
country <> 'Brazil'`
```
does not evaluate to TRUE. It evaluates to UNKNOWN, so the row does not pass the WHERE filter.

Thast is why this condition is necessary:
```SQL
OR country IS NULL
```
One important analytical distinction: a missing country does not prove that a customer is from somewhere other than Brazil. It means the country is unknown. Our query includes that customer because the exercise explicitly asks us to include NULL values.

### **All eight filtering concepts together**

**Test questions and solutions**

**[Click here](../Practice_queries/SQL_Basics(filtering).sql)**

### **How `NOT`, `AND` and `OR` interact when conditions are grouped**

That's a useful skill before moving into more complex SQL queries.

**[Clicke here](../Practice_queries/SQL_Basics(filtering).sql)**

#### **One thing to keep in mind**

**How `NOT`, `AND`, and `OR work together**

PostrgreSQL evaluates these logical operators in this order:
1. `NOT`
2. `AND`
3. `OR`

Parentheses can change the order.

The practical rule: **When a condition contains multiple `AND` and `OR` operators, use parentheses to make our intention clear**. Even when parentheses are not required, they can make a query easier to review.

### **Next lesson: Writing filters from business requirements**

Now let's move from predicting results to writing SQL yourself. Imagine we're analysing a music store's sales and catalogue.

**[Click here](../Practice_queries/SQL_Basics(filtering).sql)**
