## Section A — Conceptual understanding (15 marks)

1. Ans: Workbook is the entire excel file having extension of ".xlsx", that may contains multiple worksheets. Worksheets are the actual space where the data should be inserted, cell is the intersection of rows and columns of the worksheet which contains the actual data value e.g. A1, B2 i.e. Column A row 1, Column B row 2, And range is the set of multiple cells along both Columns and rows e.g. A1:A4 (4 set of 4 cells in column A), A1:D1 (4 set of cells in row 1).

2. Ans: cell's stored valued are the actual values where operations performed, Whereas the displayed format are just the type of diplaying those value. understand it with example: 45000 is the actual cell value which is numeric in type, we can format it as currency and it will display as ₹45,000.

3. Relative cell refrences are those refrences that could change with every cell inside the formula (e.g: B2*C2 -> B3*C3 and so on). absolute cell refrences, reference to those cell which would be absolute inside the operation on each cell(example: a particular target for every employee) put on a cell D1 used as $D$1 in operations, Mixed cell reference means we can use fixed row along with relative column and relative column along with fixed rows e.g($A1, B$1).

4. one: Excel table gives a better and cleaned format with proper header columns can be used inside the operations. two: growing business means adding new rows continously excel table have features to automatically add that new row into the table and perform the operations as per the rest of the rows. three: helps on sorting and filtering data as per the requirements.

5. Sorting is basically arranging the data as per the required arrengement , Ascending or Descending. Whereas filtering the data means showing only the required information fullfilling the given conditions, and No filtering doesn't permanently delete unmatched records it's just hide it from the view.

## Section B — Formulas and logical reasoning (20 marks)

6. Ans: =SUM(B2:B6)
7. Ans: =AVERAGE(B2:B6)
8. Ans: =IF(B2>=C2,"Achieved", "Not Achieved")
9. Ans: =IF(AND(B2>=75000,D2>=90%),"Bonus Eligible", "Not Eligible")
10. Ans: =IF(OR(B2>=90000,D2<85%),"Special Review", "Normal")
11. Ans: =COUNTIF(E2:E6,"Achieved")

## Section C — Text functions and data cleaning

12. Ans: =PROPER(TRIM(B2))
13. Ans: =PROPER(TRIM(C2))
14. Ans: =LEFT(D2,FIND("-",D2)-1)
15. Ans: =MID(D2,FIND("-",D2)+1,4)
16. Ans: =RIGHT(D2,3)
17. Ans: Preserving the raw data is important because it will help us verify the operations we have performed on those records. Without them we might decrease the data integrity.

## Section D — Practical spreadsheet project


Part A — This contains the original screenshot for the dataset table.

Part B — Formula Applications
- =[@Units]*[@[Unit Price]]
- =IF([@Revenue]>=50000, "High", "Normal")

Part C — also the screenshot.

Part D — Screenshot

Part E — Data management
- I use the table design total for it, but we can calculate it via the formula =SUM(FinalSales[Revenue])
- Again the total design, formula =SUM(FinalSales[Units])
- =AVERAGE(FinalSales[Revenue])
- =SUMIF(FinalSales[Category],"Electronics",FinalSales[Revenue])
- =COUNTIF(FinalSales[Category],"Furniture")

## Section E — Bisiness analysis

18. Ans: Electronics are the one which generated the highest revenue i.e. ₹3,09,000
19. Ans: Laptop is the product which generated the highest revenue i.e ₹2,25,000.
20. Ans: 75.46%
21. Ans: It is not necessory that the highest sales volume generate highest revenue. In our dataset, the highest sales volume are from Accessories product category that is of 42 units but as for the revenue it generate ₹48,000, which is only 11.72% of total revenue.
22. No it would not be an appropriate decision of investment by seeing revenue alones, we gottan need informations of Expenses, Profitablity, and the volume itself which basically states the customer footfall.


# Day 09 – Integrated Weekly Assessment

**Excel Training | Week 1 | Day 09**

<badge>Assessment completed</badge>

**Final Score: 98.5 / 100**

## 1. Assessment Overview

The purpose of this assessment was to evaluate whether the concepts learned during Days 1–8 could be applied independently.

The assessment covered five major areas:

| Section | Topic | Maximum Marks |
|---|---|---:|
| A | Conceptual Understanding | 15 |
| B | Formulas and Logical Reasoning | 20 |
| C | Text Functions and Data Cleaning | 15 |
| D | Practical Spreadsheet Project | 35 |
| E | Business Analysis | 15 |
| **Total** | | **100** |

Suggested assessment duration: 1 hour 55 minutes.

Actual completion time: **1 hour 8 minutes**.

---

# Section A – Conceptual Understanding

**Marks obtained: 14.5 / 15**

## Q1. Explain the difference between a workbook, worksheet, cell and range.

### 1. Workbook

A workbook is the entire Excel file.

It can contain multiple worksheets.

Example: `Sales_Report.xlsx`

### 2. Worksheet

A worksheet is an individual spreadsheet inside a workbook where data is entered and analysed.

A workbook may contain worksheets such as:
- Sales
- Expenses
- Employees
- Inventory

### 3. Cell

A cell is the intersection of a row and a column.

Examples:
- A1 = Column A, Row 1
- B2 = Column B, Row 2

A cell can contain text, numbers, dates or formulas.

### 4. Range

A range is a collection of one or more cells.

Examples:

`A1:A4` – Four cells in Column A.

`A1:D1` – Four cells in Row 1.

`A1:D5` – A rectangular range containing 20 cells.

**Relationship:**

Workbook → Worksheets → Cells → Ranges

## Q2. Difference between stored value and displayed format

**Stored value:** The actual underlying value held by a cell.

**Displayed format:** The way Excel presents that value to the user.

Example:

Underlying numeric value:

`45000`

After applying currency formatting:

`₹45,000.00`

The underlying value remains 45000.

This distinction is important because Excel can perform mathematical operations using the underlying numeric value regardless of how it is displayed.

### Important lesson

Formatting generally changes presentation, not the stored numerical value.

## Q3. Relative, absolute and mixed cell references

### A. Relative reference

A relative reference changes when a formula is copied to another cell.

Example:

```excel
=B2*C2
```

When copied down one row:

```excel
=B3*C3
```

**Business application:** Calculating revenue for every employee or product using different row values.

### B. Absolute reference

An absolute reference remains fixed when copied.

Example:

```excel
=$D$1
```

Both the column and row are locked.

**Business application:** Applying one fixed tax rate, commission rate or target value to multiple records.

### C. Mixed reference

A mixed reference locks either the row or the column.

| Reference | Meaning |
|---|---|
| `$A1` | Column A fixed, row relative |
| `B$1` | Row 1 fixed, column relative |

**Important:** Use the F4 key while editing a cell reference to cycle through reference types in Excel.

## Q4. Why are Excel Tables useful?

Excel Tables provide several advantages:

1. Structured organisation with meaningful column headers.
2. Automatic expansion when new records are added.
3. Automatic propagation of calculated column formulas.
4. Built-in sorting and filtering.
5. Structured references using column names.
6. Convenient Total Row calculations.

**Important correction:** An Excel Table organises data professionally, but it does not automatically clean inaccurate or inconsistent records.

For example:

- `Dhanbad`
- `dhanbad`
- `Dhanbad `

These inconsistencies may still exist inside a Table.

Data cleaning requires separate operations.

## Q5. Difference between sorting and filtering

### Sorting

Sorting rearranges records according to a selected order.

Examples:
- Revenue: Largest to Smallest
- Product: A to Z
- Date: Oldest to Newest

### Filtering

Filtering displays only records satisfying selected conditions.

Examples:
- Display only Electronics.
- Display only Dhanbad transactions.
- Display sales above ₹50,000.

Filtering does not permanently delete unmatched records. It temporarily hides them from the current view.

| Sorting | Filtering |
|---|---|
| Rearranges records | Displays selected records |
| Changes order | Hides unmatched records |
| Usually displays all records | Displays matching records |

---

# Section B – Formulas and Logical Reasoning

**Marks obtained: 20 / 20**

## Employee Performance Dataset

| Employee | Sales | Target | Attendance |
|---|---:|---:|---:|
| Rahul | 85000 | 75000 | 95% |
| Priya | 68000 | 75000 | 92% |
| Amit | 92000 | 80000 | 88% |
| Neha | 76000 | 75000 | 96% |
| Rohan | 55000 | 70000 | 85% |

Assumed cell arrangement:

- A = Employee
- B = Sales
- C = Target
- D = Attendance

First employee is in Row 2.

## Q6. Calculate total sales

```excel
=SUM(B2:B6)
```

Expected result:

₹3,76,000

## Q7. Calculate average sales

```excel
=AVERAGE(B2:B6)
```

Expected result:

₹75,200

## Q8. Determine whether employees achieved their targets

```excel
=IF(B2>=C2,"Achieved","Not Achieved")
```

Explanation:

- `IF` evaluates a condition.
- `B2>=C2` checks whether sales meet or exceed the target.
- `"Achieved"` appears when the condition is TRUE.
- `"Not Achieved"` appears when the condition is FALSE.

## Q9. Determine bonus eligibility

Condition:
- Sales at least ₹75,000.
- Attendance at least 90%.

Both conditions must be satisfied.

```excel
=IF(AND(B2>=75000,D2>=90%),"Bonus Eligible","Not Eligible")
```

### Understanding AND

`AND()` returns TRUE only when all specified conditions are TRUE.

## Q10. Identify employees requiring special review

Condition:
- Sales at least ₹90,000 OR
- Attendance below 85%.

```excel
=IF(OR(B2>=90000,D2<85%),"Special Review","Normal")
```

### Understanding OR

`OR()` returns TRUE when at least one specified condition is TRUE.

## Q11. Count employees who achieved their targets

Assuming the performance results are stored in Column E:

```excel
=COUNTIF(E2:E6,"Achieved")
```

Expected result: **3 employees**.

### Important distinction

- `COUNTIF` counts matching cells.
- `SUMIF` adds numerical values associated with a condition.
- `AVERAGEIF` calculates the average of values associated with a condition.

---

# Section C – Text Functions and Data Cleaning

**Marks obtained: 15 / 15**

## Customer Dataset

| Customer ID | Raw Name | Raw City | Product Code |
|---|---|---|---|
| C001 | `  rahul sharma ` | `dhanbad` | ELEC-2026-001 |
| C002 | `PRIYA KUMARI` | `DHANBAD` | FURN-2025-002 |
| C003 | ` Amit Kumar  ` | `bokaro` | ELEC-2026-003 |
| C004 | `NEHA SINGH` | `BOKARO` | CLOTH-2024-004 |

Assumed columns:

- A = Customer ID
- B = Raw Name
- C = Raw City
- D = Product Code

## Q12. Clean customer names

```excel
=PROPER(TRIM(B2))
```

Functions used:

- `TRIM()` removes unnecessary spaces.
- `PROPER()` capitalises the first letter of each word.

Example:

`  rahul sharma ` → `Rahul Sharma`

## Q13. Clean city names

```excel
=PROPER(TRIM(C2))
```

Example:

`dhanbad` → `Dhanbad`

## Q14. Extract product category

```excel
=LEFT(D2,FIND("-",D2)-1)
```

For:

`ELEC-2026-001`

Result:

`ELEC`

Explanation:

1. `FIND("-",D2)` locates the first hyphen.
2. Subtracting 1 excludes the hyphen.
3. `LEFT()` extracts the characters from the beginning.

## Q15. Extract manufacturing year

```excel
=MID(D2,FIND("-",D2)+1,4)
```

Result:

`2026`

Explanation:

1. FIND locates the first hyphen.
2. Adding 1 moves to the first year digit.
3. MID extracts four characters.

## Q16. Extract serial number

```excel
=RIGHT(D2,3)
```

Result:

`001`

This extracts the final three characters.

## Q17. Why preserve raw data?

Original data should be preserved before cleaning because:

1. It allows verification of transformations.
2. It helps identify errors introduced during cleaning.
3. It protects the original information.
4. It improves data traceability and integrity.

### Professional data-cleaning workflow

1. Preserve raw data.
2. Create separate cleaned columns.
3. Apply cleaning transformations.
4. Validate the results.
5. Use the validated data for analysis.

**Important concept:** Never overwrite original source data unnecessarily.

---

# Section D – Practical Spreadsheet Project

**Marks obtained: 35 / 35**

## Business Scenario

A retail company wants to prepare a structured sales report.

The task is to convert raw transaction records into a professional Excel report.

## 1. Dataset Structure

| Column | Variable |
|---|---|
| A | Order ID |
| B | Customer |
| C | Product |
| D | Category |
| E | Units |
| F | Unit Price |
| G | Revenue |
| H | Performance |

The Excel Table was named:

`FinalSales`

## 2. Creating the Excel Table

Steps:

1. Enter the transaction dataset.
2. Select any cell inside the dataset.
3. Press `Ctrl + T`.
4. Confirm the data range.
5. Enable My table has headers.
6. Click OK.
7. Open Table Design.
8. Rename the Table to `FinalSales`.

## 3. Revenue Calculation

Formula:

```excel
=[@Units]*[@[Unit Price]]
```

Explanation:

- `[@Units]` refers to Units in the current row.
- `[@[Unit Price]]` refers to Unit Price in the current row.
- Multiplication produces the transaction's revenue.

Example:

\[
3\times₹45,000=₹1,35,000
\]

## 4. Performance Classification

Business condition:

- Revenue greater than or equal to ₹50,000 → High.
- Revenue below ₹50,000 → Normal.

Formula:

```excel
=IF([@Revenue]>=50000,"High","Normal")
```

This classifies each transaction according to its revenue.

## 5. Formatting Requirements

The following formatting was applied:

- Report title: FINAL SALES REPORT.
- Bold and contrasting Table headers.
- Currency format for Unit Price and Revenue.
- Appropriate column alignment.
- Suitable column widths.
- Table styling and banded rows.

### Why formatting matters

Formatting improves readability and communication.

However, formatting should not change the underlying business data or introduce incorrect calculations.

## 6. Sorting and Filtering

Operations performed:

1. Sort Revenue from largest to smallest.
2. Filter Category to show Electronics.
3. Clear the filter.
4. Enable the Total Row.
5. Calculate total Units and Revenue.

## 7. Final Verified Results

| Metric | Result |
|---|---:|
| Total units sold | 66 |
| Total revenue | ₹4,09,500 |
| Average transaction revenue | ₹40,950 |
| Electronics revenue | ₹3,09,000 |
| Furniture transactions | 3 |

### Important formulas

**Total Revenue**

```excel
=SUM(FinalSales[Revenue])
```

**Total Units**

```excel
=SUM(FinalSales[Units])
```

**Average Transaction Revenue**

```excel
=AVERAGE(FinalSales[Revenue])
```

**Electronics Revenue**

```excel
=SUMIF(FinalSales[Category],"Electronics",FinalSales[Revenue])
```

**Furniture Transaction Count**

```excel
=COUNTIF(FinalSales[Category],"Furniture")
```

### Understanding the distinction

`COUNTIF()` counts matching records, whereas `SUMIF()` adds numerical values corresponding to matching records.

For example:

- COUNTIF can count the number of Furniture transactions.
- SUMIF can calculate the total revenue generated by Furniture.

---

# Section E – Business Analysis

**Marks obtained: 14 / 15**

This section evaluates the ability to interpret business information.

## Q18. Which category generated the highest revenue?

| Category | Revenue |
|---|---:|
| Electronics | ₹3,09,000 |
| Furniture | ₹52,500 |
| Accessories | ₹48,000 |
| **Total** | **₹4,09,500** |

**Conclusion:** Electronics generated the highest revenue.

## Q19. Which product generated the highest revenue?

| Product | Total Revenue |
|---|---:|
| Laptop | ₹2,25,000 |
| Monitor | ₹84,000 |
| Desk | ₹21,000 |
| Headphones | ₹20,000 |
| Keyboard | ₹18,000 |
| Chair | ₹31,500 |
| Mouse | ₹10,000 |

**Conclusion:** Laptop generated the highest revenue.

Important: When a product appears in multiple transactions, combine the revenue across all its records.

## Q20. Calculate Electronics revenue contribution

Formula:

\[
\text{Revenue Contribution}=
\frac{\text{Category Revenue}}{\text{Total Revenue}}\times100
\]

For Electronics:

\[
\frac{309000}{409500}\times100
=75.46\%
\]

**Conclusion:** Electronics contributes approximately 75.46% of total revenue.

## Q21. Does the highest sales volume necessarily generate the highest revenue?

No.

Consider the following:

| Category | Units Sold | Revenue |
|---|---:|---:|
| Electronics | 12 | ₹3,09,000 |
| Furniture | 12 | ₹52,500 |
| Accessories | 42 | ₹48,000 |
| **Total** | **66** | **₹4,09,500** |

Accessories have the highest sales volume, but Electronics generates the highest revenue.

Accessories contribute:

\[
\frac{48000}{409500}\times100
=11.72\%
\]

This demonstrates that sales volume and revenue measure different aspects of business performance.

## Q22. Can management decide investment priorities using revenue alone?

No.

Revenue alone does not provide sufficient information for investment decisions.

Management should also investigate:

1. Cost of Goods Sold.
2. Gross Profit.
3. Gross Profit Margin.
4. Operating Expenses.
5. Sales Volume.
6. Customer Demand.
7. Inventory Turnover.
8. Return on Investment.

### Important business formulas

**Gross Profit**

\[
\text{Gross Profit}=\text{Revenue}-\text{Cost of Goods Sold}
\]

**Gross Profit Margin**

\[
\text{Gross Profit Margin}=
\frac{\text{Gross Profit}}{\text{Revenue}}\times100
\]

**Inventory Turnover**

\[
\text{Inventory Turnover}=
\frac{\text{Cost of Goods Sold}}{\text{Average Inventory}}
\]

### Three important distinctions

**Revenue vs Profit**

Revenue is generated through sales. Profit is what remains after deducting relevant costs.

**Sales Volume vs Customer Footfall**

Sales volume measures the number of units sold. Customer footfall measures the number of visitors entering a store.

**Revenue Contribution vs Market Share**

Revenue contribution measures a category's share of company revenue. Market share measures a company's sales relative to the total market.

---

# 2. Final Assessment Results

| Section | Marks Obtained | Maximum Marks |
|---|---:|---:|
| A – Conceptual Understanding | 14.5 | 15 |
| B – Formulas and Logic | 20 | 20 |
| C – Data Cleaning | 15 | 15 |
| D – Practical Project | 35 | 35 |
| E – Business Analysis | 14 | 15 |
| **Total** | **98.5** | **100** |

**Final Score: 98.5%**

Assessment duration: 1 hour 8 minutes.

## 3. Areas of Strength

1. Understanding Excel's basic architecture.
2. Using relative, absolute and mixed references.
3. Applying IF, AND and OR.
4. Applying SUM, AVERAGE, SUMIF and COUNTIF.
5. Cleaning text using Excel functions.
6. Creating and managing Excel Tables.
7. Using structured references.
8. Performing sales analysis.
9. Interpreting revenue contribution and sales volume.

## 4. Areas for Further Development

The main area to develop is business interpretation.

A strong analyst should move through three stages:

**Stage 1 – What happened?**

Example: Electronics generated ₹3,09,000.

**Stage 2 – Why might it have happened?**

Example: Electronics products have higher selling prices than Accessories products.

**Stage 3 – What should management investigate?**

Example: Compare gross profit, demand, costs and inventory turnover before deciding investment priorities.

This is the progression from calculating figures to making evidence-based business recommendations.

---

# 5. Week 1 – Final Learning Summary

| Day | Learning Area |
|---|---|
| Day 01 | Excel Interface and Architecture |
| Day 02 | Workbook and Worksheet Management |
| Day 03 | Cells, Ranges and Cell References |
| Day 04 | Data Types and Data Entry |
| Day 05 | Formatting and Number Formats |
| Day 06 | Excel Tables and Basic Operations |
| Day 07–08 | Additional practical learning and consolidation |
| Day 09 | Integrated Weekly Assessment |

**Note:** This is the consolidated learning record, including the additional lessons completed during the week.

## Final Takeaway

Excel is not merely a tool for entering numbers and performing calculations.

It is a system for organising information, applying logic, identifying patterns and supporting business decisions.

Your Week 1 foundation now connects several important areas:

- Spreadsheet management.
- Data structure.
- Formula logic.
- Data cleaning.
- Business calculations.
- Analytical interpretation.

**Week 1 is complete.**

The next stage will build on this foundation by developing more advanced formula skills and increasingly realistic business analysis.