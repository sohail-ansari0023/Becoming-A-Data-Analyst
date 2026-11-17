# Excel Training — Day 4
## Formulas, Functions & Basic Calculations

### 1. What is an Excel Formula?

**Definition:** A formula is an expression that performs a calculation using numbers, cell references, operators, or functions.

Every Excel formula begins with an equal sign (`=`).

**Example:**

```excel
=B2*C2
```

If B2 contains 10 and C2 contains 500, the result is 5,000.

**Why do formulas exist?**

Formulas automate calculations. Instead of calculating values manually, Excel calculates them and updates the results when the input data changes.

**Business application:** A retail business can calculate revenue using:

Revenue = Quantity Sold × Selling Price

```excel
=B2*C2
```

---

### 2. Excel Operators

Operators tell Excel what mathematical operation to perform.

| Operator | Meaning | Example |
|---|---|---|
| `+` | Addition | `=10+5` |
| `-` | Subtraction | `=10-5` |
| `*` | Multiplication | `=10*5` |
| `/` | Division | `=10/5` |
| `^` | Power | `=2^3` |
| `%` | Percentage | `=20%` |

#### Order of Operations

Excel follows mathematical precedence.

For example:

```excel
=10+5*2
```

Result: 20, not 30.

Why?

1. Multiplication happens first: 5 × 2 = 10.
2. Addition happens next: 10 + 10 = 20.

Use parentheses when you want to control the calculation order.

```excel
=(10+5)*2
```

Result: 30.

**Professional habit:** Use parentheses in complicated financial formulas to make the intended calculation clear.

---

### 3. What is an Excel Function?

**Definition:** A function is a predefined formula built into Excel to perform a specific calculation or operation.

General syntax:

```excel
=FUNCTION_NAME(argument1, argument2, ...)
```

An **argument** is the input a function needs to perform its task.

Example:

```excel
=SUM(B2:B10)
```

Here:

- `SUM` is the function name.
- `B2:B10` is the argument.
- The function adds all numeric values in that range.

**Formula vs Function**

| Formula | Function |
|---|---|
| A calculation created using Excel expressions and operators | A predefined calculation built into Excel |
| `=B2+C2` | `=SUM(B2:C2)` |
| Can be simple or complex | Performs a specific predefined task |

Remember: A function is also used inside a formula. Every function-based calculation is a formula, but not every formula needs a function.

---

### 4. Essential Excel Functions

#### A. SUM()

**Purpose:** Adds numeric values in a range.

```excel
=SUM(B2:B10)
```

Business application: Calculate total monthly sales.

#### B. AVERAGE()

**Purpose:** Calculates the arithmetic mean of numeric values.

Formula:

Average = Sum of Values / Number of Values

```excel
=AVERAGE(B2:B10)
```

Business application: Calculate average monthly revenue.

#### C. MIN()

**Purpose:** Returns the smallest numeric value.

```excel
=MIN(B2:B10)
```

Business application: Identify the lowest monthly sales figure.

#### D. MAX()

**Purpose:** Returns the largest numeric value.

```excel
=MAX(B2:B10)
```

Business application: Identify the month with the highest revenue.

#### E. COUNT()

**Purpose:** Counts cells containing numeric values.

```excel
=COUNT(B2:B10)
```

Business application: Count how many numeric sales records are available.

#### F. COUNTA()

**Purpose:** Counts non-empty cells.

```excel
=COUNTA(B2:B10)
```

It counts cells containing numbers, text, dates, and other content.

Important: A cell containing a formula that returns an empty string (`""`) is still counted by COUNTA because it contains a formula.

#### G. COUNTBLANK()

**Purpose:** Counts blank cells in a range.

```excel
=COUNTBLANK(B2:B10)
```

Business application: Identify missing salary entries in an employee dataset.

**Understanding the difference**

| Function | What it counts |
|---|---|
| COUNT | Numeric cells |
| COUNTA | Non-empty cells |
| COUNTBLANK | Blank cells |

Example:

Suppose a range contains:

| Cell | Value |
|---|---|
| B2 | 100 |
| B3 | Sohail |
| B4 | 250 |
| B5 | Blank |
| B6 | 400 |

Results:

- `=COUNT(B2:B6)` → 3
- `=COUNTA(B2:B6)` → 4
- `=COUNTBLANK(B2:B6)` → 1

---

### 5. AutoSum in Excel

AutoSum helps you insert the SUM function quickly.

**Shortcut:**

```text
Alt + =
```

Example:

If sales figures are stored in B2:B9:

1. Select the cell where you want the total.
2. Press `Alt + =`.
3. Excel suggests a range.
4. Check whether the suggested range is correct.
5. Press Enter.

**Important:** AutoSum is convenient, but it can select an incorrect range. Always verify the suggested cell references.

---

### 6. Understanding Common Excel Errors

Errors are not just problems. They are signals that something needs investigation.

| Error | Meaning | Common reason |
|---|---|---|
| `#DIV/0!` | Division by zero | Denominator is zero or blank |
| `#VALUE!` | Invalid value type | Text used where a number is expected |
| `#NAME?` | Excel does not recognise a name | Misspelled function |
| `#REF!` | Invalid cell reference | Referenced cell was deleted |
| `#N/A` | Value not available | A lookup cannot find a match |

Examples:

```excel
=100/0
```

Produces `#DIV/0!`.

```excel
=SUMM(B2:B10)
```

Produces `#NAME?` because `SUMM` is not a recognised Excel function.

**Debugging approach:**

1. Read the error message.
2. Check the formula syntax.
3. Check the cell references.
4. Check the data types.
5. Verify the input values.
6. Correct the underlying problem.

Do not immediately hide errors. First understand why they occurred.

---

### 7. Practical Business Example — Monthly Sales Analysis

Imagine a retail business tracking its monthly sales and expenses.

| Month | Sales (₹) | Expenses (₹) |
|---|---:|---:|
| January | 45,000 | 30,000 |
| February | 52,000 | 34,000 |
| March | 48,000 | 31,000 |
| April | 65,000 | 42,000 |
| May | 70,000 | 45,000 |
| June | 60,000 | 38,000 |
| July | 75,000 | 48,000 |
| August | 68,000 | 44,000 |

Assume:

- Column A = Month
- Column B = Sales
- Column C = Expenses
- Column D = Profit

#### Calculate Profit

Business formula:

Profit = Sales − Expenses

In D2:

```excel
=B2-C2
```

Copy the formula down to D9.

#### Calculate Total Sales

```excel
=SUM(B2:B9)
```

#### Calculate Average Sales

```excel
=AVERAGE(B2:B9)
```

#### Identify Highest Sales

```excel
=MAX(B2:B9)
```

#### Identify Lowest Sales

```excel
=MIN(B2:B9)
```

#### Count Numeric Sales Records

```excel
=COUNT(B2:B9)
```

#### Calculate Total Profit

```excel
=SUM(D2:D9)
```

This is how Excel functions convert raw business records into useful information.

---

### 8. Think Like a Data Analyst

A data analyst does not use functions randomly.

The analyst starts with a business question.

| Business question | Excel calculation |
|---|---|
| How much did we sell in total? | SUM |
| What was our average monthly sales? | AVERAGE |
| Which month had the highest sales? | MAX |
| Which month had the lowest sales? | MIN |
| How many numeric sales records exist? | COUNT |
| How many records are missing? | COUNTBLANK |

The correct sequence is:

**Business Question → Identify Required Data → Select Calculation → Apply Excel Function → Interpret Result**

This approach is more important than simply memorising functions.

---

### 9. Common Mistakes to Avoid

1. Forgetting the equal sign (`=`) at the beginning of a formula.
2. Using the wrong cell range.
3. Confusing COUNT with COUNTA.
4. Assuming a formula and a function are completely different things.
5. Ignoring parentheses and calculation order.
6. Accepting AutoSum's suggested range without checking.
7. Hiding an error without investigating its cause.
8. Treating missing values as zero without considering their business meaning.

---

### 10. Professional Habits

- Use meaningful worksheet and column names.
- Keep raw data separate from calculations when possible.
- Check formula ranges before relying on results.
- Use consistent number and currency formats.
- Investigate errors instead of hiding them.
- Verify totals using an independent calculation when accuracy matters.

---

## Day 4 — Quick Revision

- A **formula** performs a calculation in Excel.
- A **function** is a predefined formula that performs a particular task.
- `SUM` adds values.
- `AVERAGE` calculates the mean.
- `MIN` and `MAX` identify the smallest and largest values.
- `COUNT`, `COUNTA`, and `COUNTBLANK` measure different aspects of data completeness.
- AutoSum speeds up calculations, but its selected range must be checked.
- Excel errors help identify problems in formulas, references, and data.

**The main lesson:** Excel is not simply a calculator. It is a tool for converting business data into meaningful information and supporting better decisions.