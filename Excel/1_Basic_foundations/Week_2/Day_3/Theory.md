# Week 2 — Day 03: Conditional Formatting

## 1. Meaning of Conditional Formatting

Conditional Formatting is an Excel feature that automatically changes the appearance of cells based on specified conditions or rules.

It can change:
- Cell background colour
- Font colour
- Font style
- Data bars
- Colour scales
- Icons

**Example:** In a sales dataset, we can highlight all transactions where revenue exceeds ₹50,000.

The important point is that Conditional Formatting changes the visual appearance of cells, not their actual underlying values.

## 2. Purpose of Conditional Formatting

Conditional Formatting helps users identify important information, patterns, exceptions, and unusual values without manually examining every record.

Its major purposes include:

1. Identifying high- and low-performing values.
2. Detecting duplicate records.
3. Highlighting important business transactions.
4. Comparing numerical values visually.
5. Identifying trends and patterns.
6. Improving the readability of large datasets.
7. Supporting faster business decision-making.

**Business Example:**

A retail company has 10,000 sales transactions. Instead of manually checking every transaction, the sales manager can highlight transactions exceeding ₹50,000.

This makes important records easier to identify.

## 3. Types of Conditional Formatting

### A. Highlight Cells Rules

These rules highlight cells that satisfy a specified condition.

Available options:

- Greater Than
- Less Than
- Between
- Equal To
- Text That Contains
- A Date Occurring
- Duplicate Values

**Example:**

Suppose the company wants to highlight sales transactions exceeding ₹50,000.

Rule:

Revenue > 50000

Excel highlights every cell satisfying this condition.

**Important:** The condition applies to individual cell values within the selected range.

### B. Top/Bottom Rules

These rules identify values according to their relative ranking within a selected range.

Available options:

- Top 10 Items
- Top 10%
- Bottom 10 Items
- Bottom 10%
- Above Average
- Below Average

**Example:**

A company wants to identify its three highest-revenue transactions.

Instead of specifying an absolute condition such as Revenue > ₹50,000, we can use Top 3 Items.

**Difference:**

- Greater Than ₹50,000 identifies every value exceeding ₹50,000.
- Top 3 Items identifies only the three highest values in the selected range.

The first is an absolute condition, whereas the second is a relative ranking.

### C. Data Bars

Data Bars represent numerical values through horizontal bars displayed inside cells.

The length of each bar represents the relative magnitude of its corresponding value.

**Example:**

| Revenue | Relative bar length |
|---:|---|
| ₹72,000 | 100% |
| ₹48,000 | 66.7% |
| ₹32,000 | 44.4% |
| ₹12,000 | 16.7% |

Formula for understanding relative bar length:

Relative Length = (Cell Value / Maximum Value) × 100

*These percentages assume zero as the minimum baseline.*

**Purpose:**

- Comparing numerical values visually.
- Identifying higher- and lower-value transactions.
- Understanding the relative magnitude of values without reading every number.

**Important:** Data Bars do not change the underlying numerical values.

### D. Colour Scales

Colour Scales represent numerical values using colour gradients.

Commonly, a three-colour scale uses:

- Green: Higher values.
- Yellow: Middle values.
- Red: Lower values.

**Example:**

In a sales dataset, higher revenue values may appear green, middle values yellow, and lower values red.

**Purpose:**

- Identifying high- and low-value observations.
- Recognising patterns across a dataset.
- Comparing numerical values through colour intensity.

**Important:** Colour Scales represent relative numerical magnitude, not necessarily business performance.

For example, higher revenue may indicate stronger sales, but higher expenses may indicate increased operating costs.

### E. Icon Sets

Icon Sets assign visual indicators to cells according to specified thresholds.

Common examples include:

- Traffic lights.
- Directional arrows.
- Flags.
- Symbols.
- Ratings.

**Example:**

A company can use traffic-light indicators to classify sales performance.

- Green: Higher relative values.
- Yellow: Middle relative values.
- Red: Lower relative values.

**Purpose:**

- Quickly communicating information.
- Making management reports easier to interpret.
- Identifying different levels of numerical performance.

**Important:** An icon does not automatically indicate whether business performance is good or bad. Meaningful thresholds must be established according to business requirements.

## 4. Formula-Based Conditional Formatting

Formula-based Conditional Formatting allows users to create customised conditions using Excel formulas.

It is particularly useful when built-in Conditional Formatting rules are insufficient.

**Example: Highlighting an entire transaction row when revenue exceeds ₹50,000.**

Suppose the dataset contains:

| Order ID | Product | Revenue |
|---|---|---:|
| ORD001 | Laptop | 65000 |
| ORD002 | Mouse | 1200 |
| ORD003 | Monitor | 18000 |
| ORD004 | Keyboard | 55000 |

**Procedure:**

1. Select the entire dataset range, such as A2:C5.
2. Navigate to Home → Conditional Formatting → New Rule.
3. Select Use a formula to determine which cells to format.
4. Enter the formula:

`=$C2>50000`

5. Choose the desired formatting.
6. Click OK.

**Understanding the formula:**

- `$C` locks the Revenue column.
- `2` is a relative row reference.
- `>50000` specifies the condition.

Excel checks the Revenue column for each row. If the condition is TRUE, it formats the corresponding selected row.

**Another example: Highlighting transactions where the product is Laptop.**

Formula:

`=$B2="Laptop"`

If the Applies To range is A2:C5, Excel checks column B but formats all three columns of qualifying rows.

### Condition Range vs Formatting Range

These are two different concepts:

- Condition range: The cells Excel checks to evaluate the formula.
- Formatting range: The cells whose appearance changes when the condition is TRUE.

For example:

Formula: `=$C2>50000`

Applies To: `$A$2:$C$9`

Excel checks column C and formats the corresponding cells across columns A, B, and C.

## 5. Managing Conditional Formatting Rules

Excel provides a Rules Manager to manage multiple Conditional Formatting rules.

Navigation:

Home → Conditional Formatting → Manage Rules

Important features:

**Edit Rule:** Modify an existing condition or formatting.

**Delete Rule:** Remove an existing Conditional Formatting rule.

**Applies To:** Specify or modify the range where a rule operates.

**Move Up / Move Down:** Change the priority of rules.

**Stop If True:** When enabled, Excel stops evaluating lower-priority rules for a cell once that rule evaluates to TRUE.

### Why Rule Priority Matters

A cell can satisfy multiple Conditional Formatting rules simultaneously.

For example:

1. Revenue > ₹50,000 → Red fill.
2. Product = Laptop → Yellow fill.
3. Top 3 Revenue → Green fill.

A transaction might satisfy all three conditions.

When multiple rules affect the same cells, their priority and formatting interactions become important.

## 6. Conditional Formatting vs Data Validation

| Basis | Data Validation | Conditional Formatting |
|---|---|---|
| Purpose | Controls or restricts data entry | Highlights existing data |
| Function | Checks whether an entry satisfies a rule | Checks whether a cell satisfies a condition |
| Main use | Preventing invalid entries | Identifying patterns and exceptions |
| Example | Allow only positive quantities | Highlight quantities below 10 |
| Effect on appearance | Can show input messages and error alerts | Changes cell appearance according to rules |

**Remember:**

Data Validation controls what users can enter.

Conditional Formatting visually identifies information according to specified conditions.

## 7. Important Limitations and Common Mistakes

### A. Conditional Formatting does not change actual values

It changes only the appearance of cells.

A highlighted value remains unchanged in the underlying dataset.

### B. Colour does not automatically indicate business performance

A higher value is not always better.

For example:

- Higher revenue may be desirable.
- Higher expenses may be undesirable.

Business context determines whether a value represents good or poor performance.

### C. Incorrect Applies To range

If the selected range is incorrect, Conditional Formatting may not cover all required records.

For example, applying a rule only to C2:C9 will highlight Revenue cells rather than entire transaction rows.

### D. Overlapping rules

Multiple rules may apply to the same cell.

Incorrect priority or formatting choices can create confusing visual results.

### E. Excessive formatting

Using too many colours, icons, and visual indicators can make a worksheet difficult to interpret.

Formatting should communicate meaningful information rather than create unnecessary decoration.

### F. Relative and absolute references

Incorrect use of `$` in formula-based Conditional Formatting can cause Excel to evaluate the wrong cells.

For example:

- `$C2`: Locks the column but allows the row to change.
- `$C$2`: Locks both the column and row.

## 8. Practical Business Applications

Conditional Formatting is useful in many business departments.

**Sales Analysis**
- Highlight high-revenue transactions.
- Identify low-performing sales.
- Compare transaction values.

**Inventory Management**
- Highlight products with low stock.
- Identify items requiring replenishment.
- Detect unusual inventory levels.

**Accounting and Finance**
- Identify overdue payments.
- Highlight unusual expenses.
- Identify duplicate transaction references.

**Human Resource Management**
- Highlight employee performance ratings.
- Identify attendance irregularities.
- Compare departmental performance.

**Financial Reporting**
- Highlight budget overruns.
- Identify unfavourable financial variances.
- Display financial performance using traffic-light indicators.

## 9. Quick Revision

| Feature | Main purpose |
|---|---|
| Highlight Cells Rules | Identify values satisfying specified conditions |
| Top/Bottom Rules | Identify relatively highest or lowest values |
| Data Bars | Compare magnitude using bar length |
| Colour Scales | Compare magnitude using colour gradients |
| Icon Sets | Communicate numerical categories through symbols |
| Formula-Based Rules | Create customised conditions |
| Manage Rules | Edit, delete, prioritise and manage rules |

**Final Conceptual Understanding:**

Conditional Formatting is a visual analysis tool. It helps users identify important information, compare values, and recognise patterns within datasets.

However, it does not clean data, correct errors, or determine business performance automatically. Those decisions require appropriate business rules and analytical judgement.