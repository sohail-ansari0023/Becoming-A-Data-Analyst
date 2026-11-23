# Excel Week 2 — Day 02 Assessment
## Advanced Data Entry

**Total Marks:** 100  
**Suggested Time:** 75–90 Minutes

### Section A — Conceptual Understanding (20 Marks)

**Q1. AutoFill vs Fill Series (4 marks)**

Explain the difference between AutoFill and Fill Series.

Give one practical example of each from a business environment.

**Q2. Relative References (4 marks)**

A company calculates revenue using:

`=B2*C2`

The formula is entered in D2 and extended to D5 using AutoFill.

Explain what happens to the cell references and why.

**Q3. Linear vs Growth Series (4 marks)**

Differentiate between Linear Series and Growth Series.

Give one numerical example of each and explain how Excel generates the next value.

**Q4. Flash Fill vs Formula (4 marks)**

A customer database contains full names in one column.

Explain the difference between extracting first names using Flash Fill and using a formula such as `TEXTBEFORE()`.

Which approach would you prefer for a regularly updated database? Justify your answer.

**Q5. Paste Special (4 marks)**

Explain the purpose of the following Paste Special options:

a. Values  
b. Formulas  
c. Formats  
d. Transpose

---

### Section B — Practical Excel Operations (50 Marks)

#### Practical Dataset

Create a new workbook named:

`Day02_Assessment.xlsx`

Rename the first worksheet to `Retail_Sales`.

Enter the following data starting from A1.

| Invoice ID | Date | Customer | Branch | Quantity | Unit Price |
|---|---|---|---|---:|---:|
| RT-001 | 01-Nov-2026 | Rahul Kumar | Dhanbad | 4 | 500 |
| RT-002 | 02-Nov-2026 | Priya Sharma | Ranchi | 3 | 800 |
| RT-003 | 03-Nov-2026 | Amit Verma | Bokaro | 5 | 450 |
| RT-004 | 04-Nov-2026 | Neha Singh | Dhanbad | 2 | 1200 |
| RT-005 | 05-Nov-2026 | Arjun Das | Ranchi | 6 | 350 |
| RT-006 | 06-Nov-2026 | Sneha Gupta | Bokaro | 3 | 950 |
| RT-007 | 07-Nov-2026 | Rohit Mehta | Dhanbad | 7 | 400 |
| RT-008 | 08-Nov-2026 | Ananya Roy | Ranchi | 2 | 1500 |

Add these additional column headings:

- G1: Revenue
- H1: First Name
- I1: Last Name

#### Task 1 — AutoFill (10 Marks)

1. Enter a revenue formula in G2.
2. Use AutoFill to calculate revenue for all eight transactions.
3. Verify that the formula references adjust correctly in each row.
4. Explain why AutoFill is useful when working with large transaction datasets.

#### Task 2 — Fill Series (10 Marks)

**A. Numerical sequence**

Generate the following sequence using Fill Series:

`100, 200, 300, 400 ... 1000`

**B. Growth sequence**

Generate:

`3, 6, 12, 24, 48, 96`

Use the Growth Series option.

**C. Date sequence**

Generate the first day of every month from January 2027 to December 2027.

**D. Invoice sequence**

Generate invoice IDs from RT-009 to RT-028 using AutoFill or another appropriate Excel technique.

#### Task 3 — Flash Fill (10 Marks)

1. Extract all first names from the Customer column into column H.
2. Extract all surnames into column I.
3. Create a separate worksheet named `Name_Formatting`.
4. Enter at least five first names and five surnames in separate columns.
5. Use Flash Fill to combine them into full names.

Explain how Flash Fill identifies the pattern.

#### Task 4 — Paste Special (10 Marks)

1. Copy the calculated revenue results from G2:G9.
2. Paste only the values into K2:K9.
3. Paste the formulas into M2:M9.
4. Apply the formatting from G2:G9 to M2:M9 without replacing the formulas.
5. Copy a horizontal list of four months and use Transpose to arrange them vertically.

#### Task 5 — Mathematical Operations (10 Marks)

The company decides to increase the unit prices of all products by 12%.

1. Create a separate copy of the original unit-price column.
2. Enter the multiplier `1.12` in an empty cell.
3. Use Paste Special → Multiply to increase all copied prices.
4. Verify the updated prices manually for at least two products.
5. Explain why the multiplier is 1.12 rather than 0.12.

---

### Section C — Efficient Data Entry (15 Marks)

Perform the following operations in a separate worksheet named `Shortcut_Practice`.

**Q1. Ctrl + Enter (3 marks)**

Select five cells and enter the same department name into all five cells using Ctrl + Enter.

**Q2. Alt + Enter (3 marks)**

Enter a company name and its address on separate lines within the same cell.

**Q3. Fill Down and Fill Right (3 marks)**

Demonstrate Ctrl + D and Ctrl + R using suitable examples.

**Q4. Date and Time (3 marks)**

Insert the current date and current time using their respective keyboard shortcuts.

**Q5. Navigation (3 marks)**

Demonstrate how Tab and Enter can be used to enter a transaction without repeatedly selecting cells using the mouse.

---

### Section D — Business Application and Decision-Making (15 Marks)

**Q1. Feature Selection (5 marks)**

For each business requirement, identify the most appropriate Excel feature and justify your choice.

a. A company needs to extract first names from 10,000 customer records.

b. An accountant wants to convert formula results into fixed values.

c. A sales manager needs invoice numbers from 001 to 500.

d. A company wants to increase every product price by 8%.

e. An analyst needs to extend a revenue formula across 5,000 records.

**Q2. Accuracy and Limitations (5 marks)**

Explain any five possible mistakes or limitations associated with advanced data-entry features.

**Q3. Practical Business Scenario (5 marks)**

A wholesale company receives a customer dataset containing:

- Full names in one column.
- Repeated department names.
- Transaction amounts calculated through formulas.
- Missing invoice sequences.
- Dates that need to follow a monthly reporting pattern.

Explain how you would use at least four of the features studied today to prepare this dataset efficiently.

---

## Submission Instructions

1. Complete the practical operations in Excel.
2. Save your workbook as `Day02_Assessment.xlsx`.
3. Keep your theoretical answers in a separate document or provide them in your assessment submission.
4. Include screenshots of important practical operations where possible.
5. Do not skip explanations just because the Excel operation worked.

**Important:** The assessment evaluates both your ability to operate Excel and your understanding of why a particular feature is appropriate for a business problem.

**End of Assessment — 100 Marks**