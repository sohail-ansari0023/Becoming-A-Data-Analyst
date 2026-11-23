# WEEK 2 — DAY 07 PRACTICAL ASSESSMENT

## Integrated Excel Project — Retail Sales Management & Business Dashboard

**Total Marks:** 100  
**Suggested Time:** 120–150 minutes  
**Difficulty:** Intermediate  
**Assessment Type:** 100% Practical  
**Software:** Microsoft Excel

---

# GENERAL INSTRUCTIONS

1. Complete all tasks directly in Microsoft Excel.
2. Create a new workbook named `Day07_Assessment.xlsx`.
3. Use separate worksheets wherever instructed.
4. Apply appropriate formatting to make the workbook professional.
5. Use formulas wherever calculations are required.
6. Do not manually enter calculated results.
7. Save your workbook regularly.
8. Submit screenshots of important worksheets and the completed Excel workbook.

---

# SECTION A — Workbook Setup & Master Data (10 Marks)

**Q1. Create the following four worksheets:**

1. `Master_Data`
2. `Sales_Data`
3. `Analysis`
4. `Control_Panel`

**Q2. Populate the Master_Data worksheet with the following information.**

### Branch Master

| Branch ID | Branch |
|---|---|
| BR001 | Dhanbad |
| BR002 | Ranchi |
| BR003 | Bokaro |
| BR004 | Patna |
| BR005 | Jamshedpur |

### Product Master

| Product ID | Product |
|---|---|
| P001 | Laptop |
| P002 | Monitor |
| P003 | Keyboard |
| P004 | Mouse |
| P005 | Printer |
| P006 | Headphones |

### Payment Methods

- Cash
- UPI
- Debit Card
- Credit Card

### Salespersons

- Amit
- Rahul
- Priya
- Neha
- Arjun

**Requirements:**

- Enter all master data correctly.
- Apply appropriate header formatting.
- Adjust column widths.
- Apply borders and suitable alignment.
- Maintain a clean tabular structure.

**Marks: 10**

---

# SECTION B — Sales Data & Data Validation (20 Marks)

Create the following structure in `Sales_Data`.

| Column | Header |
|---|---|
| A | Order ID |
| B | Transaction Date |
| C | Branch |
| D | Product |
| E | Salesperson |
| F | Payment Method |
| G | Units Sold |
| H | Unit Price |
| I | Revenue |
| J | GST Rate |
| K | GST Amount |
| L | Total Amount |

### Q3. Enter the following transactions.

| Order ID | Date | Branch | Product | Salesperson | Payment | Units | Unit Price |
|---|---|---|---|---|---|---:|---:|
| ORD001 | 01-Nov-2026 | Dhanbad | Laptop | Amit | UPI | 2 | 45000 |
| ORD002 | 02-Nov-2026 | Ranchi | Monitor | Priya | Cash | 3 | 12000 |
| ORD003 | 03-Nov-2026 | Bokaro | Keyboard | Rahul | Debit Card | 5 | 1500 |
| ORD004 | 04-Nov-2026 | Patna | Mouse | Neha | UPI | 10 | 800 |
| ORD005 | 05-Nov-2026 | Jamshedpur | Printer | Arjun | Credit Card | 2 | 15000 |
| ORD006 | 06-Nov-2026 | Dhanbad | Headphones | Amit | Cash | 4 | 2500 |
| ORD007 | 07-Nov-2026 | Ranchi | Laptop | Priya | Debit Card | 1 | 45000 |
| ORD008 | 08-Nov-2026 | Bokaro | Monitor | Rahul | UPI | 2 | 12000 |

**Marks: 5**

### Q4. Create Named Ranges.

In `Master_Data`, create the following named ranges:

| Cell Range | Required Name |
|---|---|
| B2:B6 | BranchList |
| E2:E7 | ProductList |
| G2:G5 | PaymentList |
| I2:I6 | SalespersonList |

**Marks: 4**

### Q5. Apply Data Validation.

Configure the following restrictions in `Sales_Data`:

- Branch: Dropdown using `BranchList`.
- Product: Dropdown using `ProductList`.
- Salesperson: Dropdown using `SalespersonList`.
- Payment Method: Dropdown using `PaymentList`.
- Units Sold: Whole Number between 1 and 500.

Test the dropdowns and restrictions.

**Marks: 7**

### Q6. Apply appropriate formatting.

- Format Transaction Date as a date.
- Format Unit Price as currency.
- Format GST Rate as percentage.
- Apply suitable headers, borders and column widths.

**Marks: 4**

**SECTION B TOTAL: 20 MARKS**

---

# SECTION C — Financial Calculations & Formula Management (20 Marks)

Use the `Sales_Data` worksheet.

### Q7. Calculate Revenue.

Create a formula in the Revenue column that calculates the revenue for each transaction.

Calculate all eight transactions.

**Marks: 4**

### Q8. Calculate GST Amount.

- Store the GST rate of 18% in a suitable assumption cell.
- Use an absolute reference for the GST rate.
- Calculate GST Amount for all transactions.

**Marks: 5**

### Q9. Calculate Total Amount.

Calculate the total transaction amount, including GST.

Fill the formula down for all eight transactions.

**Marks: 3**

### Q10. Test formula recalculation.

Perform the following operations:

1. Change the GST rate from 18% to 20%.
2. Verify that GST Amount updates.
3. Verify that Total Amount updates.
4. Change one transaction's Unit Price.
5. Verify that all dependent calculations update.

Restore the original values after testing.

**Marks: 4**

### Q11. Formula consistency check.

Inspect the formulas in the Revenue, GST Amount and Total Amount columns.

Identify any inconsistent formula references or calculation errors and correct them.

**Marks: 4**

**SECTION C TOTAL: 20 MARKS**

---

# SECTION D — Conditional Formatting & Data Quality (15 Marks)

Use the `Sales_Data` worksheet.

### Q12. Highlight high-revenue transactions.

Apply Conditional Formatting to highlight transactions where Revenue exceeds ₹40,000.

**Marks: 3**

### Q13. Apply Data Bars.

Apply Data Bars to the Revenue column to visually compare transaction values.

**Marks: 2**

### Q14. Identify duplicate Order IDs.

Apply Duplicate Values Conditional Formatting to the Order ID column.

**Marks: 2**

### Q15. Detect incorrect GST calculations.

Create a formula-based Conditional Formatting rule that highlights GST Amount values that do not match the expected calculation.

Apply the rule to the GST Amount column.

**Marks: 4**

### Q16. Detect incorrect total calculations.

Create a formula-based Conditional Formatting rule that highlights Total Amount values that do not match Revenue plus GST Amount.

Apply the rule to the Total Amount column.

**Marks: 4**

**SECTION D TOTAL: 15 MARKS**

---

# SECTION E — Business Analysis (15 Marks)

Create the following reports in the `Analysis` worksheet.

### Q17. Branch-wise Performance Analysis.

Create a table containing:

| Branch | Total Revenue | Total GST | Transactions |
|---|---:|---:|---:|
| Dhanbad | | | |
| Ranchi | | | |
| Bokaro | | | |
| Patna | | | |
| Jamshedpur | | | |

Requirements:

- Calculate total revenue for each branch.
- Calculate total GST for each branch.
- Count the number of transactions per branch.
- Use appropriate Excel functions.
- Format the results professionally.

**Marks: 6**

### Q18. Product-wise Performance Analysis.

Create a table containing:

| Product | Units Sold | Total Revenue |
|---|---:|---:|
| Laptop | | |
| Monitor | | |
| Keyboard | | |
| Mouse | | |
| Printer | | |
| Headphones | | |

Requirements:

- Calculate total units sold per product.
- Calculate total revenue per product.
- Apply Data Bars to the Total Revenue column.
- Format the report professionally.

**Marks: 6**

### Q19. Business performance identification.

Using your completed analysis tables:

1. Identify the branch generating the highest revenue.
2. Identify the product generating the highest revenue.
3. Identify the branch generating the lowest revenue.

**Marks: 3**

**SECTION E TOTAL: 15 MARKS**

---

# SECTION F — Management Dashboard (10 Marks)

Create a dashboard in the `Control_Panel` worksheet.

### Q20. Create KPI Metrics.

Display the following seven metrics:

1. Total Revenue
2. Total GST
3. Total Sales Including GST
4. Total Units Sold
5. Total Transactions
6. Average Order Value
7. Highest Transaction Revenue

All values must be linked to the `Sales_Data` worksheet using formulas.

**Marks: 4**

### Q21. Create Branch Revenue Comparison Chart.

Create a suitable chart showing total revenue generated by each branch.

Requirements:

- Correct branch names.
- Correct revenue values.
- Meaningful chart title.
- Appropriate axis labels.
- Data labels.

**Marks: 3**

### Q22. Create Product Revenue Comparison Chart.

Create a suitable chart comparing the revenue generated by each product.

Requirements:

- Correct product names.
- Correct revenue values.
- Meaningful chart title.
- Appropriate axis labels.
- Data labels.

**Marks: 3**

**SECTION F TOTAL: 10 MARKS**

---

# SECTION G — Final Quality Control & Workbook Testing (10 Marks)

Perform the following tests and record the results.

### Q23. Data Validation Testing.

- Attempt to enter an invalid branch.
- Attempt to enter an invalid product.
- Attempt to enter 0 in Units Sold.

Record whether Excel accepts or rejects each entry.

**Marks: 2**

### Q24. Formula Dependency Testing.

- Change Unit Price for one transaction.
- Verify Revenue, GST Amount and Total Amount.
- Verify whether the relevant Analysis figures update.

**Marks: 2**

### Q25. Master Data Testing.

Change an existing branch name in `Master_Data`.

Check whether:

- The dropdown list reflects the changed name.
- Existing Sales_Data entries change automatically.
- The Analysis report reflects the new branch name.

Record your observations and make any necessary corrections to the report.

**Marks: 2**

### Q26. Workbook Integrity.

- Check Name Manager.
- Inspect important formulas.
- Check Conditional Formatting rules.
- Check chart data sources.
- Save, close and reopen the workbook.
- Verify that the workbook still functions correctly.

**Marks: 4**

**SECTION G TOTAL: 10 MARKS**

---

# FINAL ASSESSMENT SUMMARY

| Section | Assessment Area | Marks |
|---|---|---:|
| A | Workbook Setup & Master Data | 10 |
| B | Sales Data & Data Validation | 20 |
| C | Financial Calculations & Formula Management | 20 |
| D | Conditional Formatting & Data Quality | 15 |
| E | Business Analysis | 15 |
| F | Management Dashboard | 10 |
| G | Final Quality Control | 10 |
| **TOTAL** | **Practical Assessment** | **100** |

---

# SUBMISSION CHECKLIST

- [ ] Workbook saved as `Day07_Assessment.xlsx`
- [ ] Master_Data completed
- [ ] Sales_Data completed
- [ ] Named Ranges created
- [ ] Data Validation tested
- [ ] Financial formulas completed
- [ ] Conditional Formatting applied
- [ ] Analysis reports completed
- [ ] Dashboard completed
- [ ] Charts checked
- [ ] Quality-control tests completed
- [ ] Workbook reopened and verified

## Submission Requirements

Submit:

1. The completed Excel workbook.
2. Screenshot of `Master_Data`.
3. Screenshot of `Sales_Data`.
4. Screenshot of `Analysis`.
5. Screenshot of `Control_Panel`.
6. Results of the final quality-control tests.

## Evaluation Standards

Marks will be awarded for:

- Correct Excel operations.
- Accurate calculations.
- Proper formula references.
- Correct use of Named Ranges and Data Validation.
- Effective Conditional Formatting.
- Accurate business analysis.
- Dashboard quality and readability.
- Successful workbook testing.

**Target Score: 80/100 or above.**

**Important:** This is a practical assessment. There are no definition-based or theory-based questions. Your actual Excel workbook is the primary evidence of your work.