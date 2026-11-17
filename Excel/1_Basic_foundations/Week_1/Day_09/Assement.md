# Day 09 – Integrated Weekly Assessment

**Excel Training | Week 1**

**Total Marks: 100**

**Suggested Duration: 1 Hour 55 Minutes**

---

## Section A – Conceptual Understanding (15 Marks)

**Q1.** Explain the difference between a workbook, worksheet, cell and range. Give an example of how they relate to one another. (3 marks)

**Q2.** What is the difference between a cell's stored value and its displayed format? Explain using a numerical example. (3 marks)

**Q3.** Explain the difference between relative, absolute and mixed cell references. Include one example of each. (3 marks)

**Q4.** Why is an Excel Table generally more useful than an ordinary data range when managing growing business datasets? Give three reasons. (3 marks)

**Q5.** Explain the difference between sorting and filtering. Does filtering permanently delete unmatched records? (3 marks)

---

## Section B – Formulas and Logical Reasoning (20 Marks)

Consider the following employee performance dataset:

| Employee | Sales | Target | Attendance |
|---|---:|---:|---:|
| Rahul | 85000 | 75000 | 95% |
| Priya | 68000 | 75000 | 92% |
| Amit | 92000 | 80000 | 88% |
| Neha | 76000 | 75000 | 96% |
| Rohan | 55000 | 70000 | 85% |

Assume the data starts in A1, with the first employee in Row 2.

**Q6.** Write an Excel formula to calculate total sales. (2 marks)

**Q7.** Calculate the average sales using an Excel function. (2 marks)

**Q8.** Write an IF formula that displays:
- "Achieved" if Sales are greater than or equal to Target.
- "Not Achieved" otherwise. (3 marks)

**Q9.** Write a formula that displays "Bonus Eligible" when an employee has:
- Sales of at least ₹75,000.
- Attendance of at least 90%.

Otherwise display "Not Eligible". (4 marks)

**Q10.** Write a formula using OR that displays "Special Review" if either:
- Sales are at least ₹90,000.
- Attendance is below 85%.

Otherwise display "Normal". (4 marks)

**Q11.** Write a formula to count how many employees achieved their sales target. (3 marks)

---

## Section C – Text Functions and Data Cleaning (15 Marks)

A company receives customer information from different sources.

| Customer ID | Raw Name | Raw City | Product Code |
|---|---|---|---|
| C001 | `  rahul sharma ` | `dhanbad` | ELEC-2026-001 |
| C002 | `PRIYA KUMARI` | `DHANBAD` | FURN-2025-002 |
| C003 | ` Amit Kumar  ` | `bokaro` | ELEC-2026-003 |
| C004 | `NEHA SINGH` | `BOKARO` | CLOTH-2024-004 |

Assume the columns are A, B, C and D respectively.

**Q12.** Write a formula to clean customer names by removing unnecessary spaces and applying proper case. (2 marks)

**Q13.** Write a formula to clean city names. (2 marks)

**Q14.** Extract the product category from the Product Code. For example, `ELEC-2026-001` should return `ELEC`. (3 marks)

**Q15.** Extract the manufacturing year from the Product Code. (3 marks)

**Q16.** Extract the final three-digit serial number from the Product Code. (2 marks)

**Q17.** Explain why preserving raw data is important before applying cleaning operations. (3 marks)

---

## Section D – Practical Spreadsheet Project (35 Marks)

### Business Scenario: Retail Sales Management

You're working as a junior data analyst for a retail company.

The company has provided transaction records and wants you to prepare a structured sales report.

### Dataset

| Order ID | Customer | Product | Category | Units | Unit Price |
|---|---|---|---|---:|---:|
| S001 | Rahul | Laptop | Electronics | 3 | 45000 |
| S002 | Priya | Mouse | Accessories | 20 | 500 |
| S003 | Amit | Chair | Furniture | 5 | 3500 |
| S004 | Neha | Monitor | Electronics | 4 | 12000 |
| S005 | Rohan | Keyboard | Accessories | 12 | 1500 |
| S006 | Sneha | Desk | Furniture | 3 | 7000 |
| S007 | Arjun | Laptop | Electronics | 2 | 45000 |
| S008 | Ananya | Headphones | Accessories | 10 | 2000 |
| S009 | Rahul | Monitor | Electronics | 3 | 12000 |
| S010 | Priya | Chair | Furniture | 4 | 3500 |

### Part A – Data Organisation (5 Marks)

1. Enter the dataset with appropriate headers.
2. Convert it into an Excel Table.
3. Rename the Table `FinalSales`.
4. Apply a professional Table Style.

### Part B – Formula Application (10 Marks)

Add the following columns:

- Revenue
- Performance

Calculate Revenue using a structured reference.

For Performance, apply the following conditions:

- Revenue greater than or equal to ₹50,000: "High"
- Revenue below ₹50,000: "Normal"

### Part C – Formatting (5 Marks)

Apply appropriate formatting:

1. Currency formatting to Unit Price and Revenue.
2. Bold and contrasting background for headers.
3. Suitable alignment.
4. Borders and appropriate column widths.
5. A clear report title.

### Part D – Table Operations (5 Marks)

1. Sort Revenue from largest to smallest.
2. Filter Category to show only Electronics.
3. Clear the filter.
4. Enable the Total Row.
5. Calculate total Units and Revenue.

### Part E – Data Management (10 Marks)

Answer using Excel formulas:

1. Calculate total revenue.
2. Calculate total units sold.
3. Calculate average transaction revenue.
4. Calculate Electronics revenue.
5. Count the number of Furniture transactions.

---

## Section E – Business Analysis (15 Marks)

Using your completed spreadsheet, answer the following questions.

**Q18.** Which product category generates the highest revenue? (3 marks)

**Q19.** Which individual product generates the highest total revenue? Remember that a product may appear in multiple transactions. (3 marks)

**Q20.** What percentage of total revenue comes from Electronics? (3 marks)

**Q21.** Does the category with the highest sales volume necessarily generate the highest revenue? Explain using your dataset. (3 marks)

**Q22.** Can management decide which category deserves the highest investment using revenue alone? Explain what additional information is needed. (3 marks)

---

## Assessment Rules

1. Complete the practical in Excel.
2. Use formulas wherever calculations are required.
3. Do not manually enter calculated results.
4. Preserve the original dataset.
5. Apply appropriate spreadsheet formatting.
6. Explain business conclusions using your calculated results.

## Mark Distribution

| Section | Maximum Marks |
|---|---:|
| A – Conceptual Understanding | 15 |
| B – Formulas and Logic | 20 |
| C – Data Cleaning | 15 |
| D – Practical Project | 35 |
| E – Business Analysis | 15 |
| **Total** | **100** |

**End of Assessment**