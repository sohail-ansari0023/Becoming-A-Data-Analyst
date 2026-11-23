# WEEK 2 — DAY 06 ASSESSMENT
## Advanced Cell References, Formula Copying & Formula Auditing

**Total Marks:** 100  
**Suggested Time:** 75–90 minutes  
**Difficulty:** Intermediate  
**Assessment Type:** Theory + Practical + Business Analysis

### General Instructions

1. Attempt every question.
2. Write Excel formulas exactly as you would enter them in a worksheet.
3. Show calculations wherever required.
4. For practical questions, create the specified worksheets in Excel.
5. Explain your reasoning instead of providing only final answers.
6. Do not use the study notes while attempting the assessment.

---

# SECTION A — Conceptual Understanding (20 Marks)

**Q1. Explain the difference between relative, absolute and mixed cell references. Give one Excel example of each.** (6 marks)

**Q2. What is the purpose of using the dollar sign ($) in Excel cell references? Explain the difference between `$A1`, `A$1` and `$A$1`.** (4 marks)

**Q3. Explain the difference between Trace Precedents and Trace Dependents. Give a practical example of each.** (4 marks)

**Q4. A formula produces a numerical result without displaying an Excel error. Does this guarantee that the calculation is logically correct? Explain with a business example.** (6 marks)

---

# SECTION B — Formula Prediction and Reference Adjustment (25 Marks)

**Q5.** The following formula is entered in D2:

`=B2*C2`

Predict the formula when copied to:

a. D3  
b. E2  
c. E3  

(3 marks)

**Q6.** The following formula is entered in C2:

`=$A2*B$1`

Predict the formula when copied to:

a. D2  
b. C3  
c. D3  
d. E5  

(4 marks)

**Q7.** A company stores:

- Revenue in A2:A6.
- Commission rates in B1:D1.
- Calculation results beginning in B2.

Write the formula that should be entered in B2 so it can be copied horizontally and vertically without breaking the references.

Explain why you selected each reference type. (4 marks)

**Q8.** GST Rate is stored in H2, and transaction revenue is stored in D2.

An employee enters:

`=D2*H2`

After copying the formula downward, the GST reference changes.

a. Identify the problem.  
b. Write the corrected formula.  
c. Explain what happens when the GST rate changes in H2.  

(5 marks)

**Q9.** A formula is entered in B2:

`=$A2*B$1`

The formula is copied two columns right and three rows down.

Identify the resulting formula and explain how each reference changes. (4 marks)

**Q10.** Explain why absolute references should not be used indiscriminately in every formula. Provide a practical example. (5 marks)

---

# SECTION C — Practical Excel Operations (35 Marks)

Create a workbook named:

`Day06_Assessment.xlsx`

Create the following worksheets.

## Worksheet 1 — Commission Analysis

Enter the following data:

| Employee | Revenue |
|---|---:|
| Employee A | 25,000 |
| Employee B | 35,000 |
| Employee C | 45,000 |
| Employee D | 55,000 |
| Employee E | 65,000 |

Place commission rates horizontally:

| Commission Rate | 3% | 5% | 8% |
|---|---:|---:|---:|

**Q11.** Build a commission matrix using mixed references.

Requirements:

a. Calculate commission for every employee at all three rates. (5 marks)

b. Use one formula that can be copied horizontally and vertically. (3 marks)

c. Explain why the revenue reference and commission-rate reference require different locking behaviour. (2 marks)

**Total: 10 marks**

## Worksheet 2 — Revenue Sensitivity

A company wants to estimate revenue under different selling prices and quantities.

Selling prices:

₹400, ₹450, ₹500, ₹550

Units sold:

100, 200, 300, 400, 500

**Q12.**

a. Create a two-dimensional revenue sensitivity table. (4 marks)

b. Use mixed references to calculate all possible combinations. (3 marks)

c. Identify the highest and lowest possible revenue. (2 marks)

d. Explain how this table can support business pricing decisions. (1 mark)

**Total: 10 marks**

## Worksheet 3 — GST Financial Model

Enter the following transactions:

| Product | Quantity | Unit Price |
|---|---:|---:|
| Laptop | 3 | 45,000 |
| Monitor | 5 | 12,000 |
| Keyboard | 10 | 1,500 |
| Mouse | 20 | 800 |
| Printer | 4 | 15,000 |

Store the GST rate in H2 as 18%.

**Q13.**

Create the following calculated columns:

- Revenue Before GST
- GST Amount
- Total Amount Including GST

Requirements:

a. Write the formula for Revenue Before GST. (2 marks)

b. Write the formula for GST Amount using an absolute reference. (2 marks)

c. Write the formula for Total Amount. (2 marks)

d. Copy all formulas down to the remaining transactions. (2 marks)

e. Change GST from 18% to 20% and verify that dependent calculations update. (2 marks)

**Total: 10 marks**

## Worksheet 4 — Formula Auditing

Use the GST Financial Model from Worksheet 3.

**Q14.**

a. Use Trace Precedents on the GST Amount formula. Identify its input cells. (2 marks)

b. Use Trace Dependents on Revenue Before GST. Identify its dependent cells. (2 marks)

c. Explain one direct and one indirect dependency in this worksheet. (1 mark)

**Total: 5 marks**

---

# SECTION D — Business Logic and Analytical Thinking (20 Marks)

**Q15. Formula Diagnosis (5 marks)**

A company stores the GST rate in H2 as 18%.

An employee enters:

`=B2*C2*H2`

The quantity is 5 and the unit price is ₹40,000.

The formula returns ₹36,00,000.

Answer:

a. Why does Excel calculate a result instead of displaying a formula error? (2 marks)

b. What business assumption or input problem could explain the incorrect result? (1 mark)

c. Write the correct formula if the intended calculation is GST amount. (2 marks)

**Q16. Detecting Suspicious Transactions (5 marks)**

A worksheet contains:

| Column | Information |
|---|---|
| A | Revenue Before GST |
| B | GST Amount |

The company wants to highlight transactions where GST exceeds the revenue before GST.

a. Write a formula-based Conditional Formatting rule, assuming data starts in row 2. (2 marks)

b. Explain why the row reference is not locked. (1 mark)

c. Does highlighting a transaction prove that it is incorrect? Explain. (2 marks)

**Q17. Formula Dependencies (5 marks)**

Consider the following formulas:

- D2 = `=B2*C2`
- E2 = `=D2*$H$2`
- F2 = `=D2+E2`

Answer:

a. Which cells directly depend on D2? (2 marks)

b. Does F2 indirectly depend on H2? Explain. (2 marks)

c. If the quantity in B2 changes, which calculated cells should update? (1 mark)

**Q18. Spreadsheet Quality Control (5 marks)**

You are reviewing a financial worksheet containing 1,000 transactions.

You discover that some transactions have an incorrect GST rate, while other formulas contain incorrect cell references.

Recommend four Excel techniques or controls that could help detect or prevent these problems.

Explain the purpose of each technique.

---

# ASSESSMENT COMPLETION CHECKLIST

- [ ] Section A — Conceptual Understanding
- [ ] Section B — Formula Prediction
- [ ] Section C — Practical Excel Operations
- [ ] Section D — Business Logic and Analytical Thinking
- [ ] All formulas checked
- [ ] Workbook saved as `Day06_Assessment.xlsx`

## Submission Instructions

Submit your answers in the following order:

1. Section A answers.
2. Section B formula predictions.
3. Section C practical results and screenshots where useful.
4. Section D explanations.
5. Excel workbook, if available.

## Evaluation Criteria

| Area | Marks |
|---|---:|
| Conceptual understanding | 20 |
| Formula prediction and references | 25 |
| Practical Excel operations | 35 |
| Business logic and analytical thinking | 20 |
| **Total** | **100** |

**Important:** Marks will be awarded for both correctness and reasoning. A correct formula with an incorrect explanation may receive partial credit.

**Target:** 80/100 or above.


## **SOLUTIONS**

#### **SECTION A — Conceptual Understanding (20 Marks)**

- **Q1 Ans:** Relative cell reference means the cell reference will relatively change inside the calculations when we move across different cells (e.g.: While calculating revenue we Use =B1*C1 for D1 the formulat becomes =B2*C2 as we move to the cell D2 and so on). Absolute Cell refernces means the referenced cell will remains constant inside the calculation while moving across different cells (e.g: Calculating GST Rates =A1*$B$1 No matter to which cell we move the $B$1 would remains unchanged). Mixed references means cell refernce in which we can keep either the row and column absolute or relative (e.g: =$B1 and = B$1 absolute column with reltive row and relative column with absolute row respectively good for calculating tax matrices or commission matrices).

- **Q2 Ans:** Dollar sign are used to make rows or column absolute, $A1, A$1, and $A$1 means Absolute column with relative row, relative column with absolute row and an absolute cell refernce both column and row would remains constant respectively.

- **Q3 Ans:** Trace Precendents shows those cells by which the value of the particular cell has been calculated. Trace dependents means which cells are dependent with the particular cell, e.g: revenue is dependent on Unit Price and Quantity Trace precedent on revenue would shows Unit price and quantity whereas GST amount and total Amount are dependent on revenue Trace dependents would shows total amount and GST amount.

- **Q4 Ans:** Absolutely not the correctness of formulas dependes entirely on business logic not by the numerical result it produce, the formula could be valid but the result would not according to the business requirements e.g: If the the GST rate is 18% and while calculating the GST Amount we use Revenue * 18% logically and numerically correct , but if we use Revenue * 25% would numerically correct only the formula is valid but for logically correctness we gotta look on to the business requirements.

#### **SECTION B — Formula Prediction and Reference Adjustment (25 Marks)**

- **Q5 Ans:** D3=B3*C3, E2=C2*D2, E3=C3*D3

- **Q6 Ans:** D2= $A2*C$1, C3=$A3*B$1, D3=$A3*C$1, E5=$A5*D$1

- **Q7 Ans:** B2=$A2*B$1 Since the revenue column should be same for each commission rates but row should be relative as per the commission rows so I chose ($A2) and Now Commission rate are on B1:D1 so the column should be relative and row should be absolute so I chose (B$1)

- **Q8 Ans:** it's becuase he used a relative reference of cell H2 insead of absolute reference $H$2, the correct formula = D2*$H$2, if the GST rate changes in H2 all of the columns that directly or indirectly depends on H2 will be adjusted as per the GST rate calculation.

= **Q9 Ans:** I'm not gonna explain the same thing again, just take the answer as Q7.

= **Q10 Ans:** Formulas which required relative reference or mixed references using absolute reference would provide wrong results, like calculating revenue of each product with unit price * quantity and caculating commission rate matrices.

#### **SECTION C — Practical Excel Operations (35 Marks)**

**Q11 Ans**

- **a**
| 3% | 5% | 8% | 
|----|----|----|
| 750  | 1250 | 2000
| 1050 |1750 | 2800 |
| 1350 | 2250 | 3600 |
| 1650 | 2750 | 4400 |
| 1950 | 3250 | 5200 |

- **b** = $B2*C$1
- Revenue needs to be locked vertically and that's why the column is locked and commission rate needs to be locked horizontally and that's why the row is locked.

**Q12 Ans**

- **a** provided the screenshot
- **b** =$A2*B$1
- **C** we can analyse the revenue having different prices of any product with sold in different quantities.

**Q13 Ans**

- **a** =B2*C2
- **b** =$D2*$H$2
- **c** =SUM(D2,E2)
- **d** Done it
- **e** GST Amount and total Amount affected via changing GST Rate from 18% to 20%.
 
**Q14 Ans**

- **a** Input cells are D2 and H2 for GST Amount.
- **b** dependent cells E2 and F2 for revenue before GST.
- **c** Direct GST Amount via GST rate in H2 and indirect is Total amount via GST Amount.

#### **SECTION D — Business Logic and Analytical Thinking**

**Q15 Ans**

- **a** The formula is completely valid so the excel calculates a value instead of formula error.

- **b** The formula calculates the 18% value of the whole revenue before GST.

- **c** =C2*$H$2

**Q16 Ans**

- **a** = B2 > A2

- **b** Since we gotta use the relative cell refernce since we're moving towards multiple cells.

- **c** At this particular business logic inside data , yes it would prove it's incorrect.

**Q17 Ans**

- **a** E2 and F2
- **b** Yess since E2 is dependent on H2
- **c** All of them D2, E2, and F2 since D2 is directly dependent on B2 and E2 , F2 is directly dependent on D2.

**Q18 Ans** 
1. Data validation to prevent inserting wrong values.
2. Conditional formatting to highlight those incorrect GST Rate transactions.
3. use Formula Auditing,
4. Trace precedents and Trace dependents for wrong cell references inside formulas.