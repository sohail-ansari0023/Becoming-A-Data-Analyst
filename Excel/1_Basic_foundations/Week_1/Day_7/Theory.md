# Day 07 – Formatting and Number Formats in Excel

## 1. What is Formatting in Excel?

**Definition:** Formatting is the process of changing how information appears in an Excel cell without necessarily changing the actual value stored in that cell.

For example, suppose cell C2 contains:

`45000`

We can display the same value in different ways:

| Format | Display |
|---|---:|
| General | 45000 |
| Number | 45,000.00 |
| Currency | ₹45,000.00 |
| Custom | ₹45,000 |

The underlying value remains `45000`.

### Why does formatting exist?

Excel is not just a calculation tool; it is also a reporting and communication tool.

Businesses use formatting to:
- Make financial reports easier to understand.
- Distinguish different types of information.
- Highlight important figures.
- Improve readability.
- Present information professionally.

**Business example:** A finance department may work with thousands of revenue, expense and profit figures. Appropriate formatting helps managers understand these figures quickly.

---

## 2. Two Major Types of Formatting

### A. Visual Formatting

Visual formatting changes the appearance of cells.

Examples:

| Feature | Purpose |
|---|---|
| Font | Changes text appearance |
| Font Size | Changes text size |
| Bold | Emphasises information |
| Font Colour | Changes text colour |
| Fill Colour | Changes cell background |
| Borders | Separates cells visually |
| Alignment | Positions content |
| Wrap Text | Displays long text on multiple lines |
| Merge & Center | Combines cells and centres their content |

### B. Number Formatting

Number formatting changes how Excel displays numeric values.

Examples:

- Number: `45000` → `45,000.00`
- Currency: `45000` → `₹45,000.00`
- Percentage: `0.15` → `15%`
- Date: A date serial → `15-Nov-2026`

**Important distinction:** Number formatting generally changes the display, not the underlying numeric value.

---

## 3. Understanding Number Formats

### A. General Format

General is Excel's default number format.

It displays values according to Excel's general display rules.

Example:

`45000` → `45000`

### B. Number Format

Displays numerical values with options such as:
- Decimal places
- Thousands separators
- Negative number styles

Example:

`1250000` → `1,250,000.00`

**Business application:** Presenting sales figures, expenses, quantities and other numerical information.

### C. Currency Format

Displays a currency symbol alongside a numerical value.

Example:

`125000` → `₹1,25,000.00`

**Business application:** Revenue reports, expense statements, purchase records and financial analysis.

### D. Accounting Format

Accounting format also displays currency symbols, but aligns currency symbols and decimal places consistently within a column.

**Difference between Currency and Accounting:**

- Currency: The symbol is displayed close to the value.
- Accounting: The symbol and values are aligned consistently.

Both formats are useful in financial reporting.

### E. Percentage Format

Percentage formatting displays a decimal value as a percentage.

**Formula:**

Percentage display = Stored value × 100

Examples:

| Stored value | Percentage display |
|---:|---:|
| 0.15 | 15% |
| 0.25 | 25% |
| 0.50 | 50% |
| 1 | 100% |
| 2 | 200% |
| 45000 | 4,500,000% |

**Important:** Excel does not calculate a growth rate when you apply percentage formatting. It simply changes the display.

To calculate a growth rate, use:

\[
\text{Growth Rate}=
\frac{\text{New Value}-\text{Old Value}}
{\text{Old Value}}\times100
\]

### F. Date Format

Excel stores dates internally as serial numbers and displays them according to the selected date format.

The same date can be displayed in different ways:

| Date format | Display |
|---|---|
| DD/MM/YYYY | 15/11/2026 |
| DD-MMM-YYYY | 15-Nov-2026 |
| MMMM DD, YYYY | November 15, 2026 |

The date itself remains the same when only its display format changes.

**Business application:** Invoice dates, transaction dates, salary periods, monthly sales and financial-year reporting.

---

## 4. Stored Value vs Displayed Value

This is one of the most important concepts in Excel.

A cell has an underlying value and a display format.

Consider cell C2 containing `45000`.

| Formatting applied | Displayed value | Stored value |
|---|---:|---:|
| General | 45000 | 45000 |
| Currency | ₹45,000.00 | 45000 |
| Number | 45,000.00 | 45000 |
| Percentage | 4,500,000% | 45000 |

When we change the format back to General, Excel displays `45000` again.

**Why?**

Because Excel has not changed the underlying number. It has only changed the way that number is presented.

Think of it as displaying the same amount of money in different styles. The presentation changes, but the amount remains the same.

---

## 5. How to Apply Formatting in Excel

Most formatting tools are available in the **Home tab**.

### A. Formatting Column Headings

Steps:

1. Select the required header cells, such as `A1:E1`.
2. Open the Home tab.
3. In the Font section, click Bold.
4. Select Fill Color to apply a background colour.
5. Select Font Color if necessary.
6. Go to Alignment and click Center.

### B. Applying Currency Formatting

Steps:

1. Select the Unit Price range, such as `C2:C6`.
2. Open Home → Number.
3. Open the Number Format dropdown.
4. Select Currency.
5. Choose the appropriate currency symbol, such as ₹.
6. Set the required decimal places.
7. Repeat for the Revenue column.

### C. Applying Percentage Formatting

Steps:

1. Select the Growth range, such as `E2:E6`.
2. Open Home → Number.
3. Click the Percentage (%) button.
4. Use Increase Decimal or Decrease Decimal to adjust decimal places.

**Remember:** If the stored value is `0.15`, percentage formatting displays `15%`.

### D. Applying Alignment

Steps:

1. Select the required cells.
2. Open Home → Alignment.
3. Choose Left, Center or Right alignment.
4. Use Middle Align if vertical positioning is required.

You can select multiple non-adjacent ranges by holding Ctrl while selecting them.

### E. Applying Borders

Steps:

1. Select the dataset, such as `A1:E6`.
2. Open Home → Font.
3. Find the Borders dropdown.
4. Select All Borders.

This creates visible boundaries between cells.

### F. Adjusting Column Width

**Method 1: AutoFit**

1. Select the required columns.
2. Move the cursor to the boundary between two column headings.
3. Double-click the boundary.

Excel automatically adjusts the column width to fit the contents.

**Method 2: Manual adjustment**

1. Move the cursor between two column headings.
2. Hold the mouse button.
3. Drag left or right to adjust the width.

### G. Adding a Report Title

Steps:

1. Insert a new row above the column headings.
2. Enter the report title in A1.
3. Select `A1:E1`.
4. Open Home → Alignment.
5. Select Merge & Center.
6. Apply Bold and increase the font size.

**Important:** Merging cells is acceptable for report titles, but avoid merging cells within the actual data table because it can interfere with sorting, filtering and analysis.

---

## 6. Practical Project – Monthly Sales Report

### Dataset

| Product | Units Sold | Unit Price | Revenue | Growth |
|---|---:|---:|---:|---:|
| Laptop | 10 | 45000 | 450000 | 15% |
| Mouse | 50 | 500 | 25000 | 8% |
| Keyboard | 30 | 1500 | 45000 | -5% |
| Monitor | 12 | 12000 | 144000 | 12% |
| Printer | 5 | 18000 | 90000 | 10% |

### Formatting requirements

1. Add the title `MONTHLY SALES REPORT`.
2. Make the title bold and centred.
3. Apply a background colour to the column headings.
4. Make the column headings bold.
5. Apply currency formatting to Unit Price and Revenue.
6. Apply percentage formatting to Growth.
7. Centre-align Units Sold and Growth.
8. Apply All Borders to the dataset.
9. Adjust column widths using AutoFit.

### Expected result

The final spreadsheet should have:
- A clear report title.
- Distinct column headings.
- Consistent currency formatting.
- Correct percentage displays.
- Readable column widths.
- Clearly separated rows and columns.

**Professional principle:** Formatting should improve readability, not distract the reader.

---

## 7. Professional Formatting Principles

### A. Consistency

Use consistent formatting for similar types of information.

For example:
- All revenue values should use the same currency format.
- All growth values should use the same percentage format.
- All column headings should follow the same style.

### B. Readability

A spreadsheet should be understandable without requiring someone to inspect every cell individually.

### C. Simplicity

Avoid:
- Too many colours.
- Excessive borders.
- Unnecessary merged cells.
- Different fonts in every row.
- Excessive decimal places.

### D. Accuracy

Formatting must not create a misleading impression.

For example, displaying `0.1567` as `16%` is acceptable when rounding to zero decimal places is appropriate, but it is important to understand that the underlying value is still `0.1567`.

---

## 8. Common Mistakes and Misunderstandings

| Mistake | Correct understanding |
|---|---|
| Formatting changes the actual value | Formatting generally changes the display |
| 15 and 0.15 both display as 15% | 15 displays as 1500%; 0.15 displays as 15% |
| Percentage formatting calculates growth | It only displays a value as a percentage |
| Currency and Accounting are identical | Their symbol and number alignment differ |
| More formatting means a better report | Consistency and readability matter more |
| Merging cells is always useful | It can interfere with data operations |

---

## 9. Day 07 – Knowledge Revision

| Concept | Key takeaway |
|---|---|
| Formatting | Changes how information appears |
| Visual formatting | Changes the appearance of cells |
| Number formatting | Changes how numeric values are displayed |
| General | Excel's default format |
| Number | Displays numerical values |
| Currency | Displays currency symbols |
| Accounting | Aligns currency symbols and values |
| Percentage | Displays decimal proportions as percentages |
| Date | Displays date serials in readable formats |
| AutoFit | Adjusts column width automatically |
| Wrap Text | Displays long content on multiple lines |
| Merge & Center | Combines cells and centres content |

### Final takeaway

Excel formatting is about communicating information clearly and consistently.

The most important concept from Day 07 is the difference between the **underlying stored value** and its **display format**.

You should be able to explain not only how to format a cell, but also why Excel displays a particular result after formatting it.

**Day 07 practical outcome:** Successfully created and formatted a Monthly Sales Report using professional spreadsheet formatting techniques.