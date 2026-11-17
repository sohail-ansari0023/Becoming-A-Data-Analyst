# Day 08 – Excel Tables and Basic Operations

**Week 2 | Day 1**

## 1. What is an Excel Table?

**Definition:** An Excel Table is a structured collection of related data that Excel manages as a single object.

An ordinary data range is simply a collection of cells. An Excel Table provides additional features to organise, manage, calculate and analyse that data.

### Why do Excel Tables exist?

When businesses maintain large datasets, they face several problems:

- New records need to be included in existing datasets.
- Formulas need to be extended to new records.
- Data needs to be sorted and filtered.
- Calculations need to be performed on specific columns.
- Datasets need to remain organised and consistent.

Excel Tables help solve these problems.

**Business example:** A retail company maintains thousands of sales transactions. Instead of manually managing every cell range, it can convert the data into an Excel Table and use built-in features to analyse its sales.

---

## 2. Understanding the Structure of an Excel Table

Consider this sales dataset:

| Order ID | Product | Units Sold | Unit Price |
|---|---|---:|---:|
| O001 | Laptop | 5 | 45000 |
| O002 | Mouse | 20 | 500 |
| O003 | Keyboard | 10 | 1500 |
| O004 | Monitor | 8 | 12000 |
| O005 | Printer | 3 | 18000 |

A structured dataset contains:

| Component | Meaning |
|---|---|
| Header row | Contains column names |
| Data rows | Contain individual records |
| Columns | Represent attributes or variables |
| Table body | Contains the actual business records |

**Important concept:**

- Each row represents one record or observation.
- Each column represents one variable or characteristic.

This structure is also used in SQL databases, Python pandas DataFrames and Power BI.

---

## 3. Creating an Excel Table

There are two common methods.

### Method 1 – Keyboard shortcut

1. Enter your dataset into Excel.
2. Click any cell inside the dataset.
3. Press `Ctrl + T`.
4. Excel identifies the data range.
5. Enable the option **My table has headers**.
6. Click OK.

### Method 2 – Ribbon

1. Select the dataset.
2. Open the Insert tab.
3. Click Table.
4. Confirm the selected range.
5. Enable My table has headers.
6. Click OK.

Your ordinary data range is now an Excel Table.

---

## 4. Understanding the Table Design Tab

When you click inside an Excel Table, an additional contextual tab appears, usually named **Table Design**.

Important features:

| Feature | Purpose |
|---|---|
| Table Name | Gives the Table a meaningful name |
| Table Styles | Changes the Table's appearance |
| Header Row | Shows or hides column headings |
| Total Row | Adds a summary row |
| Banded Rows | Alternates row formatting |
| Filter Button | Shows or hides filter dropdowns |
| Resize Table | Changes the Table's data range |

### Renaming an Excel Table

Excel initially assigns names such as `Table1`.

Professional analysts should use meaningful names.

Steps:

1. Click inside the Table.
2. Open Table Design.
3. Find the Table Name field.
4. Replace `Table1` with `SalesData`.
5. Press Enter.

Compare:

```excel
=SUM(Table1[Revenue])
```

```excel
=SUM(SalesData[Revenue])
```

The second formula is more meaningful because the Table name communicates the dataset's purpose.

---

## 5. Sorting and Filtering

These are two important data-management operations.

### A. Sorting

**Definition:** Sorting means arranging records according to a particular order.

Examples:

- Product names from A to Z.
- Revenue from largest to smallest.
- Dates from oldest to newest.
- Units sold from smallest to largest.

Steps:

1. Click the dropdown arrow beside the required column heading.
2. Select the appropriate sorting option.
3. Excel rearranges the records.

**Business application:** A sales manager can sort revenue from largest to smallest to identify high-value transactions.

### B. Filtering

**Definition:** Filtering means displaying only records that satisfy selected conditions.

Example: Display only Laptop transactions.

Steps:

1. Click the dropdown arrow beside Product.
2. Uncheck Select All.
3. Select Laptop.
4. Click OK.

Excel temporarily hides the records that do not match the selected condition.

**Important:** Filtering does not delete records. It only hides unmatched records from the current view.

Examples of business filtering:

- Display transactions from Dhanbad.
- Display sales above ₹50,000.
- Display Electronics transactions.
- Display orders from a particular month.

### Difference between Sorting and Filtering

| Sorting | Filtering |
|---|---|
| Rearranges records | Displays selected records |
| Changes the order | Hides unmatched records |
| Usually displays all records | Displays only matching records |

---

## 6. Total Row

Excel Tables provide a built-in Total Row feature.

It can calculate:

- Sum
- Average
- Count
- Maximum
- Minimum

### How to enable Total Row

1. Click inside the Table.
2. Open Table Design.
3. Find Table Style Options.
4. Enable Total Row.
5. Select the required total cell.
6. Click its dropdown arrow.
7. Choose the desired calculation, such as Sum.

**Business application:** A company can quickly calculate total sales, total units sold or average transaction value.

---

## 7. Structured References

This is one of the most important concepts in Excel Tables.

**Definition:** Structured references allow us to refer to Table columns using their column names instead of ordinary cell coordinates.

### A. Ordinary cell references

Suppose:

- C2 = Units Sold
- D2 = Unit Price

To calculate Revenue:

```excel
=C2*D2
```

### B. Structured references

Inside an Excel Table, we can write:

```excel
=[@[Units Sold]]*[@[Unit Price]]
```

Understanding the formula:

- `[@[Units Sold]]` refers to Units Sold in the current row.
- `[@[Unit Price]]` refers to Unit Price in the current row.
- `*` performs multiplication.

Example:

\[
5 \times 45,000 = ₹2,25,000
\]

### C. Referring to an entire Table column

Suppose the Table is named `SalesData`.

```excel
=SUM(SalesData[Revenue])
```

This calculates the total of the Revenue column.

### Ordinary References vs Structured References

| Ordinary reference | Structured reference |
|---|---|
| `=C2*D2` | `=[@[Units Sold]]*[@[Unit Price]]` |
| `=SUM(E2:E6)` | `=SUM(SalesData[Revenue])` |

**Why are structured references useful?**

1. Formulas become easier to understand.
2. Column names communicate the purpose of calculations.
3. Formulas can adjust as the Table changes.
4. They are useful when working with large business datasets.

---

## 8. Calculated Columns

A calculated column is a Table column in which a formula is automatically applied to the other rows.

Example:

```excel
=[@[Units Sold]]*[@[Unit Price]]
```

When entered into the Revenue column, Excel generally fills the formula throughout the calculated column.

This reduces repetitive manual work.

**Business application:** An online retailer can calculate the revenue of thousands of transactions without manually entering a formula into every row.

---

## 9. Automatic Table Expansion

Excel Tables can automatically expand when new records are entered directly below them.

Suppose a Table contains five transactions.

You add:

| Order ID | Product | Units Sold | Unit Price |
|---|---|---:|---:|
| O006 | Headphones | 15 | 2000 |

Excel will generally recognise the adjacent new record and include it in the Table.

Calculated column formulas can also extend to the new row.

**Why is this useful?**

A company receives new transactions every day. Automatic expansion reduces the need to manually adjust data ranges and formulas.

---

## 10. Rules for Creating Professional Excel Tables

Follow these principles:

1. Every column must have a meaningful header.
2. Avoid blank header cells.
3. Use unique column names.
4. Each row should represent one record.
5. Each column should represent one variable.
6. Avoid completely blank rows or columns inside the dataset.
7. Avoid merged cells inside the data area.
8. Maintain consistent data types within columns.

A properly structured dataset is easier to analyse using Excel, SQL, Python and Power BI.

---

# 11. Practical Assignment – SalesData

### Business scenario

A retail company wants to organise its sales transactions and analyse its revenue performance.

### Dataset

| Order ID | Product | Category | Units Sold | Unit Price |
|---|---|---|---:|---:|
| O001 | Laptop | Electronics | 5 | 45000 |
| O002 | Mouse | Accessories | 20 | 500 |
| O003 | Keyboard | Accessories | 10 | 1500 |
| O004 | Monitor | Electronics | 8 | 12000 |
| O005 | Printer | Electronics | 3 | 18000 |
| O006 | Headphones | Accessories | 15 | 2000 |
| O007 | Laptop | Electronics | 2 | 45000 |
| O008 | Mouse | Accessories | 30 | 500 |

### Part A – Table Creation

1. Convert the dataset into an Excel Table.
2. Rename it `SalesData`.
3. Apply a suitable Table Style.
4. Add a column named Revenue.
5. Calculate Revenue using a structured reference.

Formula:

```excel
=[@[Units Sold]]*[@[Unit Price]]
```

### Part B – Basic Operations

1. Sort Product from A to Z.
2. Filter Category to show only Electronics.
3. Clear the filter.
4. Enable the Total Row.
5. Calculate total Units Sold.

### Part C – Business Calculations

Calculate:

1. Total Revenue.
2. Total Units Sold.
3. Average transaction revenue.
4. Electronics revenue.
5. Furniture revenue.
6. Number of Electronics transactions.

### Part D – Business Analysis

Answer:

1. Which category generated the highest revenue?
2. Which product category generated the lowest revenue?
3. What was the total number of units sold?
4. What was the total revenue?
5. Why are Excel Tables more convenient than ordinary data ranges?

---

# 12. Advanced Practical Challenge – OrderData

A second dataset was provided to test whether you could independently apply the concepts.

### Dataset structure

| Column | Variable |
|---|---|
| A | Order ID |
| B | Product |
| C | Category |
| D | Region |
| E | Units Sold |
| F | Unit Price |
| G | Revenue |

The Table was named `OrderData`.

### Important formulas

**1. Total Revenue**

```excel
=SUM(OrderData[Revenue])
```

**2. Total Units Sold**

```excel
=SUM(OrderData[Units Sold])
```

**3. Average Transaction Revenue**

```excel
=AVERAGE(OrderData[Revenue])
```

**4. Electronics Revenue**

```excel
=SUMIF(OrderData[Category],"Electronics",OrderData[Revenue])
```

**5. Furniture Revenue**

```excel
=SUMIF(OrderData[Category],"Furniture",OrderData[Revenue])
```

**6. Number of Electronics Transactions**

```excel
=COUNTIF(OrderData[Category],"Electronics")
```

### Verified results

| Metric | Result |
|---|---:|
| Total units sold | 92 |
| Total revenue | ₹5,92,000 |
| Average transaction revenue | ₹59,200 |
| Electronics revenue | ₹4,35,000 |
| Furniture revenue | ₹98,000 |
| Electronics transactions | 4 |

---

# 13. Business Analysis – Understanding Sales Performance

A data analyst must do more than calculate totals. The analyst must interpret what those numbers communicate.

### A. Revenue Contribution

Formula:

\[
\text{Revenue Contribution}=
\frac{\text{Category Revenue}}{\text{Total Revenue}}\times100
\]

Verified results:

| Category | Revenue | Contribution |
|---|---:|---:|
| Electronics | ₹4,35,000 | 73.48% |
| Furniture | ₹98,000 | 16.55% |
| Accessories | ₹59,000 | 9.97% |
| Total | ₹5,92,000 | 100% |

Electronics generates the highest revenue contribution.

### B. Regional Revenue

| Region | Revenue | Contribution |
|---|---:|---:|
| Dhanbad | ₹2,85,500 | 48.23% |
| Bokaro | ₹1,63,000 | 27.53% |
| Ranchi | ₹1,43,500 | 24.24% |
| Total | ₹5,92,000 | 100% |

Dhanbad generates the highest revenue among the three regions.

### C. Product Revenue

| Product | Revenue |
|---|---:|
| Laptop | ₹3,15,000 |
| Monitor | ₹1,20,000 |
| Chair | ₹63,000 |
| Desk | ₹35,000 |
| Headphones | ₹24,000 |
| Keyboard | ₹22,500 |
| Mouse | ₹12,500 |

Laptop generates the highest revenue.

### D. Sales Volume vs Revenue

| Category | Units sold | Revenue |
|---|---:|---:|
| Electronics | 17 | ₹4,35,000 |
| Furniture | 23 | ₹98,000 |
| Accessories | 52 | ₹59,000 |
| Total | 92 | ₹5,92,000 |

This reveals an important business relationship:

- Accessories have the highest sales volume.
- Electronics have the highest revenue.
- Higher sales volume does not necessarily mean higher revenue.

### E. Average Revenue per Unit

Formula:

\[
\text{Average Revenue per Unit}=
\frac{\text{Total Revenue}}{\text{Total Units Sold}}
\]

| Category | Average revenue per unit |
|---|---:|
| Electronics | ₹25,588.24 |
| Furniture | ₹4,260.87 |
| Accessories | ₹1,134.62 |

Electronics generates much more revenue per unit than the other categories.

---

## 14. Important Business Distinctions

### Revenue is not Profit

Revenue represents money generated through sales.

Profit represents what remains after deducting relevant costs.

\[
\text{Gross Profit}=\text{Revenue}-\text{Cost of Goods Sold}
\]

A product with high revenue may still have a low profit margin.

### Sales Volume is not Revenue

Sales volume measures the quantity sold.

Revenue measures the monetary value of those sales.

### Revenue Contribution is not Market Share

Revenue contribution measures a category's share of the company's total revenue.

Market share measures a company's sales relative to the total market.

These concepts should not be confused.

### Revenue Concentration

Electronics contributes 73.48% of revenue but only 18.48% of units sold.

The difference is:

\[
73.48\%-18.48\%=55\text{ percentage points}
\]

This indicates a strong concentration of revenue in Electronics relative to its sales volume.

However, it does not establish that Electronics should automatically receive the highest investment or inventory priority.

A business should also investigate:

- Profit margins.
- Inventory turnover.
- Customer demand.
- Operating expenses.
- Product availability.

---

# 15. Common Mistakes and Misunderstandings

| Mistake | Correct understanding |
|---|---|
| An Excel Table is just a coloured range | It is a structured data object |
| Sorting and filtering are identical | Sorting rearranges; filtering hides unmatched records |
| Filtering deletes unwanted records | Filtering temporarily hides records |
| COUNTIF counts units sold | COUNTIF counts matching cells or records |
| Structured references use ordinary cell coordinates | They refer to Table columns by name |
| High revenue means high profit | Profit depends on costs |
| High sales volume means high revenue | Revenue also depends on selling prices |
| Revenue contribution is market share | They measure different things |

---

# 16. Day 08 – Quick Revision

| Concept | Key takeaway |
|---|---|
| Excel Table | Structured collection of related data |
| Table Name | Meaningful identifier for a Table |
| Sorting | Arranging records in an order |
| Filtering | Displaying records matching conditions |
| Total Row | Summarising Table data |
| Structured References | Referring to columns by name |
| Calculated Column | Formula applied throughout a Table column |
| Automatic Expansion | Table can include adjacent new records |
| Revenue | Monetary value generated through sales |
| Sales Volume | Quantity of products sold |
| Revenue Contribution | Percentage of total company revenue |

## Final Learning Outcome

By completing Day 08, you have learned how to:

1. Create and manage Excel Tables.
2. Organise datasets professionally.
3. Sort and filter business records.
4. Use Total Row calculations.
5. Write structured-reference formulas.
6. Calculate category-wise and regional revenue.
7. Interpret sales volume and revenue relationships.
8. Distinguish revenue from profitability.

**The central lesson of Day 08:**

Excel Tables help us move from managing individual cells to managing structured business data.

That is an important foundation for more advanced analysis using Excel, SQL, Python and Power BI.