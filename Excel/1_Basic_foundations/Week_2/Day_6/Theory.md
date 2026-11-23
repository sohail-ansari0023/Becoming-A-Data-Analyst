# Week 2 — Day 06
# Advanced Cell References, Formula Copying & Formula Auditing

## 1. Learning Objectives

By the end of this lesson, you should be able to:

1. Understand how Excel adjusts cell references when formulas are copied.
2. Apply relative, absolute and mixed references in business calculations.
3. Build two-dimensional calculation and sensitivity-analysis tables.
4. Identify incorrect formulas and diagnose formula errors.
5. Understand direct and indirect formula dependencies.
6. Use Excel's Formula Auditing tools to investigate calculations.
7. Apply logical checks to identify suspicious business data.

---

# PART A — Understanding Formula Copying

## 2. How Excel Adjusts Cell References

When a formula is copied from one cell to another, Excel may automatically adjust its cell references.

This behaviour depends on the type of reference used.

### 2.1 Relative References

**Definition:** A relative reference is a cell reference that changes its row and column positions when a formula is copied.

Example:

`=B2*C2`

Suppose this formula is entered in D2.

When copied down:

| Cell | Formula |
|---|---|
| D2 | `=B2*C2` |
| D3 | `=B3*C3` |
| D4 | `=B4*C4` |
| D5 | `=B5*C5` |

**Why does this happen?**

Excel preserves the relative positions of the referenced cells.

In D2:
- B2 is two columns to the left.
- C2 is one column to the left.

When the formula moves to D3, Excel maintains those same relative positions.

**Business application:**

Calculating revenue for multiple sales transactions:

`Revenue = Quantity × Unit Price`

Relative references make it possible to calculate hundreds or thousands of transactions by copying one formula.

### 2.2 Absolute References

**Definition:** An absolute reference is a cell reference that remains fixed when a formula is copied.

Example:

`$A$1`

The dollar signs lock both the column and the row.

Consider a business worksheet:

| Cell | Description | Value |
|---|---|---:|
| B2 | Revenue | ₹50,000 |
| F1 | GST Rate | 18% |

Formula:

`=B2*$F$1`

When copied down:

| Cell | Formula |
|---|---|
| C2 | `=B2*$F$1` |
| C3 | `=B3*$F$1` |
| C4 | `=B4*$F$1` |
| C5 | `=B5*$F$1` |

Notice:
- B2 changes to B3, B4, B5.
- `$F$1` remains fixed.

**Important:** Absolute references lock the cell address, not its value.

If the GST rate in F1 changes from 18% to 20%, all dependent formulas recalculate.

**Business applications:**
- GST rates
- Commission rates
- Discount rates
- Exchange rates
- Fixed financial assumptions

### 2.3 Mixed References

**Definition:** A mixed reference locks either the row or the column, while allowing the other part to change.

There are two types:

| Reference | Locked part | Changing part |
|---|---|---|
| `$A1` | Column A | Row |
| `A$1` | Row 1 | Column |

**Why do mixed references exist?**

Sometimes we need to copy formulas both horizontally and vertically while keeping one part of the reference fixed.

For example, a company wants to calculate employee commissions under different commission rates.

| Employee | Revenue | 3% | 5% | 7% |
|---|---:|---:|---:|---:|
| A | 20,000 | ? | ? | ? |
| B | 30,000 | ? | ? | ? |
| C | 40,000 | ? | ? | ? |
| D | 50,000 | ? | ? | ? |

Assume:
- Revenue is stored in B2:B5.
- Commission rates are stored in C1:E1.
- Results begin in C2.

Formula:

`=$B2*C$1`

Explanation:

- `$B2` locks column B because revenue values are stored vertically.
- `C$1` locks row 1 because commission rates are stored horizontally.

When copied across and down:

| Cell | Formula |
|---|---|
| C2 | `=$B2*C$1` |
| D2 | `=$B2*D$1` |
| E2 | `=$B2*E$1` |
| C3 | `=$B3*C$1` |
| E5 | `=$B5*E$1` |

Expected results:

| Employee | 3% | 5% | 7% |
|---|---:|---:|---:|
| A | 600 | 1,000 | 1,400 |
| B | 900 | 1,500 | 2,100 |
| C | 1,200 | 2,000 | 2,800 |
| D | 1,500 | 2,500 | 3,500 |

This is a two-dimensional calculation matrix.

**Business application:** Comparing commission, discount, interest or profit scenarios across multiple rates and business cases.

---

# PART B — Formula Copying in Different Directions

## 3. Understanding Reference Adjustments

Excel adjusts relative references according to the direction in which a formula is copied.

### Copying downward

Original formula:

`=B2*C2`

Copied one row down:

`=B3*C3`

### Copying horizontally

Original formula:

`=B2*C2`

Copied one column right:

`=C2*D2`

### Copying both horizontally and vertically

Original formula:

`=$B2*C$1`

Copied one column right and one row down:

`=$B3*D$1`

The column B remains locked, and row 1 remains locked.

## 4. F4 Shortcut

Excel provides the F4 key to switch between reference types while editing a formula.

Reference cycle:

1. `$A$1` — Absolute
2. `A$1` — Mixed: row locked
3. `$A1` — Mixed: column locked
4. `A1` — Relative

Pressing F4 repeatedly cycles through these reference formats.

**Important:** On some laptops, you may need to use `Fn + F4`.

---

# PART C — Business Calculation Applications

## 5. Revenue Sensitivity Analysis

**Definition:** Sensitivity analysis examines how a result changes when one or more input assumptions change.

Suppose a business wants to understand how revenue changes at different selling prices and sales quantities.

Formula:

`Revenue = Selling Price × Units Sold`

Worksheet structure:

| Units / Price | ₹450 | ₹500 | ₹550 |
|---|---:|---:|---:|
| 100 | 45,000 | 50,000 | 55,000 |
| 200 | 90,000 | 1,00,000 | 1,10,000 |
| 300 | 1,35,000 | 1,50,000 | 1,65,000 |
| 400 | 1,80,000 | 2,00,000 | 2,20,000 |

Assume:
- Prices are in B1:D1.
- Units sold are in A2:A5.
- Results begin in B2.

Formula:

`=$A2*B$1`

Why?

- `$A2` locks the column containing units sold.
- `B$1` locks the row containing selling prices.

This formula can be copied both horizontally and vertically.

**Business application:**

A company can compare potential revenue under different selling prices and sales-volume assumptions before making pricing decisions.

**Important distinction:** Sensitivity analysis shows possible outcomes under assumptions. It does not guarantee that those outcomes will occur.

---

# PART D — Formula Errors and Business Logic

## 6. Technically Valid vs Logically Correct Formulas

A formula may be mathematically valid but still produce an incorrect business result.

This is one of the most important lessons in spreadsheet analysis.

### 6.1 Syntactically Valid Formula

A syntactically valid formula follows Excel's formula rules and can be calculated.

Example:

`=B2*C2*18`

Excel can calculate this formula if the referenced cells contain numeric values.

### 6.2 Logically Correct Formula

A logically correct formula represents the intended business calculation.

Suppose:
- Quantity = 5
- Unit Price = ₹40,000
- GST Rate = 18%

The correct GST calculation is:

`=B2*C2*18%`

Or, if the GST rate is stored in H2:

`=B2*C2*$H$2`

If someone enters 18 instead of 18% in H2, Excel calculates:

`5 × 40,000 × 18 = 36,00,000`

Excel does not necessarily display an error because the calculation itself is valid.

The problem is with the meaning of the input.

**Key lesson:** Excel validates formula structure, but it does not automatically understand every business assumption.

## 7. Separate Financial Calculations

Consider a sales worksheet:

| Column | Information |
|---|---|
| B | Quantity |
| C | Unit Price |
| D | Revenue Before GST |
| E | GST Amount |
| F | Total Amount |
| H2 | GST Rate |

### Revenue Before GST

`=B2*C2`

### GST Amount

`=D2*$H$2`

### Total Amount

`=SUM(D2,E2)`

Example:

| Description | Amount |
|---|---:|
| Quantity | 5 |
| Unit Price | ₹40,000 |
| Revenue Before GST | ₹2,00,000 |
| GST at 18% | ₹36,000 |
| Total Including GST | ₹2,36,000 |

**Why separate the calculations?**

- Easier to audit.
- Easier to identify mistakes.
- Easier to understand individual components.
- Easier to maintain financial models.
- Easier to reuse calculations in reports.

The example assumes the entire unit price is taxable and ignores other tax adjustments.

---

# PART E — Formula Auditing

## 8. What Is Formula Auditing?

**Definition:** Formula Auditing is the process of examining formulas, their references and their relationships to other cells to verify that calculations are working correctly.

It is useful when working with complex worksheets containing many interconnected formulas.

### 8.1 Trace Precedents

Trace Precedents identifies the cells that provide inputs to a selected formula.

Example:

Cell E2 contains:

`=D2*$H$2`

Its precedents are:
- D2
- H2

To use:

1. Select E2.
2. Open the Formulas tab.
3. Select Trace Precedents.
4. Observe the arrows pointing toward E2.

### 8.2 Trace Dependents

Trace Dependents identifies the cells that rely on the selected cell.

Example:

| Cell | Formula |
|---|---|
| D2 | `=B2*C2` |
| E2 | `=D2*$H$2` |
| F2 | `=D2+E2` |

If D2 is selected and Trace Dependents is used:

- E2 is a direct dependent.
- F2 is also a direct dependent.

F2 also has an indirect dependency through E2.

### 8.3 Direct vs Indirect Dependencies

**Direct dependency:** One cell directly references another cell.

Example:

`=D2*$H$2`

E2 directly depends on D2 and H2.

**Indirect dependency:** A cell depends on another cell through an intermediate calculation.

For example:

- F2 depends on E2.
- E2 depends on H2.
- Therefore, F2 indirectly depends on H2.

Understanding these relationships is essential when auditing large financial models.

---

# PART F — Detecting Suspicious Business Data

## 9. Conditional Formatting for Anomaly Detection

Conditional Formatting can help identify suspicious values in a worksheet.

Suppose:
- Column A contains Revenue Before GST.
- Column B contains GST Amount.

Normally, under the example's assumptions, GST should not exceed the taxable revenue if the applicable rate is below 100%.

A formula-based Conditional Formatting rule could be:

`=$B2>$A2`

This highlights records where GST exceeds the revenue amount.

### Steps

1. Select the data range, such as A2:B1001.
2. Open Home → Conditional Formatting.
3. Select New Rule.
4. Choose Use a formula to determine which cells to format.
5. Enter `=$B2>$A2`.
6. Select a formatting style.
7. Apply the rule.

### Important limitation

This is only a suspicious-record check.

It does not prove that a transaction is incorrect. A proper investigation must examine the applicable tax rate, taxable value and other business conditions.

## 10. Common Ways to Prevent Spreadsheet Errors

| Control | Purpose |
|---|---|
| Data Validation | Restricts or guides input values |
| Conditional Formatting | Highlights suspicious values |
| Formula Auditing | Examines formula relationships |
| Absolute References | Keeps fixed assumptions from shifting |
| Separate Calculation Columns | Makes financial calculations easier to inspect |
| Reasonableness Checks | Identifies results that appear inconsistent with business expectations |

**Important:** Number formatting does not automatically correct incorrect input values. For example, formatting the number 18 as a percentage may display 1800%, not 18%.

---

# PART G — Common Mistakes and Misunderstandings

1. **Forgetting absolute references:** A fixed GST or commission rate shifts when the formula is copied.

2. **Using absolute references everywhere:** This can prevent formulas from adjusting when they should.

3. **Misunderstanding mixed references:** `$A1` and `A$1` lock different parts of a reference.

4. **Assuming every calculated result is correct:** Excel can calculate a technically valid but logically incorrect formula.

5. **Confusing direct and indirect dependencies:** A cell may depend on another cell through multiple intermediate calculations.

6. **Using Conditional Formatting as proof of an error:** Highlighting identifies records for investigation; it does not establish the cause.

7. **Combining all calculations into one complicated formula:** Separate calculation columns often improve transparency and auditability.

---

# PART H — Quick Revision

| Concept | Meaning | Example |
|---|---|---|
| Relative Reference | Row and column can change | `A1` |
| Absolute Reference | Row and column remain fixed | `$A$1` |
| Mixed Reference | Only one part remains fixed | `$A1`, `A$1` |
| Sensitivity Analysis | Examines changes in outcomes when assumptions change | Revenue at different prices |
| Formula Auditing | Examines formulas and their relationships | Trace Precedents |
| Direct Dependency | Directly references another cell | `=D2*H2` |
| Indirect Dependency | Depends through another calculation | F2 depends on H2 through E2 |
| Business Logic | The intended meaning of a calculation | Correct GST calculation |

## Final Summary

Day 06 connects cell references with real business calculations.

Relative references make formulas reusable. Absolute references protect fixed assumptions. Mixed references support two-dimensional calculations.

Formula Auditing helps investigate relationships between cells, while business-logic checks help identify results that are technically valid but commercially incorrect.

**The central lesson:** A good Excel analyst doesn't simply write formulas. They understand, validate and audit the calculations those formulas represent.