# Excel Training — Day 3
## Cell References and Data Entry Fundamentals

**Learning level:** Beginner  
**Track:** Commerce + Data Analysis  
**Study status:** Theory notes

---

# 1. Understanding Data Entry in Excel

## 1.1 What is data entry?

Data entry means entering information into Excel cells so that it can be stored, organised, calculated, and analysed.

Excel works with different kinds of information.

| Data type | Example | Business application |
|---|---|---|
| Text | Product A | Product names |
| Number | 250 | Quantity, revenue |
| Date | 14-Nov-2026 | Transaction dates |
| Percentage | 18% | Tax rates, growth rates |
| Currency | ₹5,000 | Sales, expenses |

## 1.2 Why does Excel distinguish between data types?

Excel needs to understand what kind of information is stored in a cell.

Consider two values:

- `500`
- `Sales`

Excel can perform mathematical calculations with 500. However, it cannot treat the word Sales as an ordinary numeric value.

Excel must distinguish between:

- Information used for calculations.
- Information used to describe something.
- Information representing dates and time.

**Hinglish:** Excel sirf data store nahi karta. Woh data ko interpret bhi karta hai, taaki uske according calculations aur analysis kar sake.

## 1.3 Business example

Consider this retail dataset:

| Product | Quantity | Unit Price |
|---|---:|---:|
| Keyboard | 10 | 750 |
| Mouse | 15 | 400 |
| Monitor | 5 | 8,000 |
| Printer | 3 | 12,000 |

Column A contains text.

Columns B and C contain numbers.

Why?

Because we may want to calculate total quantity, revenue, average price, and other business metrics.

For example:

**Revenue = Quantity × Unit Price**

For Keyboard:

10 × 750 = ₹7,500

Excel can calculate this because both inputs are numeric.

## 1.4 Numbers stored as text

Sometimes a value looks like a number but Excel interprets it as text.

For example, a cell may contain `'500` with a leading apostrophe.

This can create problems during calculations.

Common causes:

- Data imported from another system.
- Unintended leading apostrophes.
- Extra spaces.
- Inconsistent formatting.
- Incorrect CSV imports.

**Professional habit:** Never assume that data is correctly interpreted just because it looks correct. Check the underlying data before analysis.

---

# 2. Understanding Cell References

## 2.1 What is a cell reference?

A cell reference is the address used to identify a particular cell in Excel.

Examples:

- A1
- B5
- C10

A1 means column A and row 1.

## 2.2 Why do cell references exist?

Formulas need to know where the input values are stored.

Consider this dataset:

| Product | Quantity | Price |
|---|---:|---:|
| Keyboard | 10 | 750 |

To calculate revenue, write:

`=B2*C2`

Excel interprets this as:

Multiply the value in B2 by the value in C2.

Result:

10 × 750 = ₹7,500

Why is this better than writing `=10*750`?

Because if the quantity or price changes, the formula using cell references can automatically calculate the updated result.

**Hinglish:** Cell reference ek address ki tarah hai. Jaise kisi ghar ka address hota hai, waise hi Excel mein cell ka address hota hai.

---

# 3. Three Types of Cell References

Excel has three important reference types:

1. Relative reference
2. Absolute reference
3. Mixed reference

These references determine how formulas behave when copied to other cells.

## 3.1 Relative Reference

### Definition

A relative reference changes when you copy a formula to another cell.

It is the default reference type in Excel.

### Example

| Product | Quantity | Price | Revenue |
|---|---:|---:|---:|
| Keyboard | 10 | 750 | |
| Mouse | 15 | 400 | |
| Monitor | 5 | 8,000 | |

In D2, enter:

`=B2*C2`

The result is ₹7,500.

Now copy the formula from D2 to D3.

Excel automatically adjusts it to:

`=B3*C3`

### Why does this happen?

Excel preserves the relative position of the referenced cells.

- B2 is two columns to the left of D2.
- C2 is one column to the left of D2.

When the formula moves down one row, both references move down one row.

| Formula location | Formula |
|---|---|
| D2 | `=B2*C2` |
| D3 | `=B3*C3` |
| D4 | `=B4*C4` |

### Where is it used?

- Calculating revenue for every product.
- Calculating profit for every transaction.
- Calculating total marks for every student.
- Calculating monthly expenses.

**Hinglish:** Relative reference mein formula copy karne par cell references automatically adjust ho jaate hain.

---

## 3.2 Absolute Reference

### Definition

An absolute reference remains fixed when you copy a formula to another cell.

It uses the `$` symbol.

### Example: Fixed GST rate

Suppose a simplified calculation exercise uses an 18% GST assumption.

| Product | Amount | GST Rate | GST Amount |
|---|---:|---:|---:|
| Keyboard | 750 | 18% | |
| Mouse | 400 | 18% | |
| Monitor | 8,000 | 18% | |

Instead of entering the GST rate repeatedly, store it in F1.

In D2, enter:

`=B2*$F$1`

Copy the formula down.

The formulas become:

- D2: `=B2*$F$1`
- D3: `=B3*$F$1`
- D4: `=B4*$F$1`

Notice:

- B2 changes to B3 and B4.
- `$F$1` remains fixed.

### Why does this happen?

The `$` symbol locks both the column and row of the reference.

The formula can therefore use a different amount for each product while referring to the same fixed rate.

### Business applications

- Fixed tax assumptions.
- Commission rates.
- Discount rates.
- Exchange-rate assumptions.
- Financial model assumptions.

**Hinglish:** Absolute reference mein hum kisi cell ke row aur column dono ko lock kar dete hain, taaki formula copy karne par reference change na ho.

---

## 3.3 Mixed Reference

### Definition

A mixed reference fixes either the column or the row, but not both.

There are two forms:

| Reference | What stays fixed? |
|---|---|
| `$A1` | Column A |
| `A$1` | Row 1 |

### Example: Two-dimensional calculation table

Suppose quantities are stored in A2:A4 and prices are stored in B1:D1.

| Quantity / Price | ₹10 | ₹20 | ₹30 |
|---|---:|---:|---:|
| Quantity 1 | | | |
| Quantity 2 | | | |
| Quantity 3 | | | |

In B2, enter:

`=$A2*B$1`

Now copy the formula horizontally and vertically.

### How does the formula behave?

`$A2`

- Column A is fixed.
- Row number can change.

`B$1`

- Column letter can change.
- Row 1 is fixed.

This allows each cell to multiply the correct quantity by the correct price.

### Business applications

- Product pricing matrices.
- Budget calculations.
- Scenario analysis.
- Commission tables.
- Financial sensitivity analysis.

**Hinglish:** Mixed reference mein hum ek direction ko lock karte hain. Ya toh column fixed rahega, ya row fixed rahegi.

---

# 4. Understanding the `$` Symbol

The `$` symbol locks the part immediately following it.

| Reference | Column | Row | Type |
|---|---|---|---|
| A1 | Changes | Changes | Relative |
| `$A$1` | Fixed | Fixed | Absolute |
| `$A1` | Fixed | Changes | Mixed |
| `A$1` | Changes | Fixed | Mixed |

Remember:

- `$A` locks column A.
- `$1` locks row 1.
- `$A$1` locks both.

## 4.1 F4 Shortcut

When editing a formula and the cursor is positioned on a cell reference, press F4 to cycle through reference types.

Starting with `A1`:

`A1` → `$A$1` → `A$1` → `$A1` → `A1`

On some laptops, you may need to press `Fn + F4`.

---

# 5. Dates and Numbers in Excel

## 5.1 How does Excel store dates?

Excel stores genuine dates as serial numbers internally.

This allows Excel to perform date calculations.

For example:

- A2 = 01-Nov-2026
- B2 = 14-Nov-2026

Formula:

`=B2-A2`

Result:

`13`

Excel subtracts the underlying date serial values and returns the number of elapsed days.

## 5.2 Common date-entry problems

1. Different regional date formats can create confusion.
2. A date may be stored as text instead of a genuine Excel date.
3. A number may display as a date because of cell formatting.
4. Imported data may contain inconsistent date formats.

**Professional habit:** Keep date formats consistent and verify that Excel recognises the values as genuine dates.

---

# 6. Practical Business Example

Imagine you work as a junior data analyst at a retail company.

Your manager provides a sales dataset.

You need to calculate revenue and GST for every product.

| Product | Quantity | Unit Price |
|---|---:|---:|
| Keyboard | 10 | 750 |
| Mouse | 15 | 400 |
| Monitor | 5 | 8,000 |
| Printer | 3 | 12,000 |
| Laptop | 2 | 55,000 |

### Step 1: Calculate revenue

Formula in D2:

`=B2*C2`

Copy it down.

### Step 2: Store a fixed GST assumption

Enter `18%` in F1.

### Step 3: Calculate GST amount

Formula in E2:

`=D2*$F$1`

Copy it down.

### Step 4: Understand the difference

The revenue formula uses relative references because each product has a different quantity and price.

The GST formula uses an absolute reference for the fixed rate because the same assumption applies to all products in this exercise.

This demonstrates how reference types solve different business problems.

**Note:** This is an Excel learning example, not a determination of the applicable GST rate or tax treatment for any actual product.

---

# 7. Common Mistakes

| Mistake | Why it is a problem | Better practice |
|---|---|---|
| Assuming every number-looking value is numeric | It may actually be text | Verify data types |
| Using relative references for a fixed assumption | The reference may shift when copied | Use an absolute reference |
| Locking both row and column unnecessarily | Formula may not adjust as intended | Choose the correct reference type |
| Confusing `$A1` and `A$1` | They lock different parts | Identify whether row or column must remain fixed |
| Assuming every date-looking value is a real date | It may be stored as text | Check and validate dates |
| Hardcoding values inside formulas | Updating assumptions becomes difficult | Store inputs in separate cells |

---

# 8. Professional Excel Habits

A good analyst does more than write formulas.

A good analyst builds spreadsheets that are reliable and easy to maintain.

Follow these habits:

1. Keep raw data separate from calculations where practical.
2. Use meaningful column headings.
3. Store important assumptions in clearly labelled cells.
4. Use absolute references for fixed assumptions.
5. Use relative references for repeated row-by-row calculations.
6. Use mixed references for two-dimensional calculations.
7. Keep date formats consistent.
8. Check whether imported values are stored as the correct data type.
9. Avoid unnecessary hardcoding in formulas.
10. Verify calculations before using them in reports.

---

# 9. Quick Revision

| Concept | Key idea |
|---|---|
| Data entry | Entering information into Excel cells |
| Text | Descriptive information |
| Number | Numeric information used in calculations |
| Date | Date value stored internally as a serial number |
| Cell reference | Address of a cell |
| Relative reference | Row and column can change |
| Absolute reference | Row and column remain fixed |
| Mixed reference | Only row or column remains fixed |
| `$A$1` | Locks column A and row 1 |
| `$A1` | Locks column A |
| `A$1` | Locks row 1 |
| F4 | Cycles through reference types when editing a reference |

---

# 10. Day 3 Learning Outcomes

After completing the practical assignment and assessment, you should be able to:

- Distinguish text, numbers, percentages, currency, and dates.
- Explain why cell references are used.
- Apply relative references in copied formulas.
- Use absolute references for fixed assumptions.
- Apply mixed references in two-dimensional tables.
- Understand the role of the `$` symbol.
- Recognise common data-entry problems.

**Day 3 theory: Complete.**

**Next topic — Day 4: Basic Excel Formulas and Functions**

We will explore:
- What formulas and functions actually mean.
- Formula structure and syntax.
- SUM, AVERAGE, MIN, MAX, and COUNT.
- COUNTA and COUNTBLANK.
- AutoSum.
- Practical sales and financial calculations.
- Common formula errors and debugging.