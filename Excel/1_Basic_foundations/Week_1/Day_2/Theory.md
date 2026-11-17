# Excel Training — Day 2
## Workbook Management, Worksheet Operations, Navigation & Selection

**Learning level:** Beginner  
**Track:** Commerce + Data Analysis  
**Status:** Theory complete | Practical assignment and assessment pending

---

## 1. Workbook Management

### 1.1 What is workbook management?

Workbook management means creating, opening, saving, organising, and maintaining Excel files.

It exists because business data changes regularly. Analysts must manage different versions of files without accidentally losing previous work.

For example, imagine you prepare a January sales report. Next month, you receive February sales data.

You may want to preserve the January report and create a separate February report. Workbook management helps you do this safely.

### 1.2 Important workbook commands

| Command | Shortcut | Purpose |
|---|---|---|
| New Workbook | Ctrl + N | Create a new workbook |
| Open Workbook | Ctrl + O | Open an existing workbook |
| Save | Ctrl + S | Save changes to the current file |
| Save As | F12 (Windows desktop) | Save a separate copy or use a different name/location |

**Save vs Save As**

- Save updates the existing workbook.
- Save As creates a new file or saves the workbook under a different name or location.

Example:

You have `January_Sales.xlsx`.

After making changes:

- Pressing Ctrl + S updates `January_Sales.xlsx`.
- Using Save As to create `February_Sales.xlsx` gives you a separate file.

**Professional habit:** Use clear file names and preserve important original datasets before making substantial changes.

### 1.3 Common Excel file formats

| Format | Meaning | Common use |
|---|---|---|
| `.xlsx` | Standard Excel workbook | Regular spreadsheets |
| `.xlsm` | Macro-enabled workbook | Workbooks containing VBA macros |
| `.xls` | Older Excel workbook format | Compatibility with older Excel versions |
| `.csv` | Comma-Separated Values | Data exchange between applications |
| `.xltx` | Excel template | Reusable workbook structure |
| `.pdf` | Portable Document Format | Sharing reports in a fixed layout |

**Important: XLSX vs CSV**

An XLSX workbook can preserve multiple worksheets, formulas, formatting, charts, and other Excel features.

A CSV file primarily stores tabular text data. It does not preserve Excel formatting, formulas as working formulas, charts, or multiple worksheets.

Example:

Suppose your workbook contains:

- Sheet 1: Sales
- Sheet 2: Expenses
- Sheet 3: Profit Analysis

Saving the workbook as CSV will not preserve all three worksheets in one CSV file. CSV is designed for a single tabular data sheet.

**Business application:** CSV files are commonly used to transfer data between Excel, accounting software, databases, and analytics tools.

---

## 2. Worksheet Management

### 2.1 What is worksheet management?

Worksheet management means creating, renaming, deleting, hiding, moving, copying, and organising worksheets inside a workbook.

Think of a workbook as a physical file folder.

Each worksheet is like a separate section inside that folder.

For example:

`Company_Financial_Report.xlsx`

- Sales_Data
- Expense_Data
- Employee_Data
- Profit_Analysis

Each worksheet has a distinct purpose.

### 2.2 Important worksheet operations

**A. Insert a worksheet**

You can create a new worksheet using:

- The plus (+) button beside the worksheet tabs.
- Shift + F11.

Why is it useful?

When a company receives new data for a new month, you may need another worksheet to organise that data.

**B. Rename a worksheet**

Double-click the worksheet tab and enter a meaningful name.

Examples:

- Sheet1 → Sales_Data
- Sheet2 → Expense_Data
- Sheet3 → Customer_Records

Why does this matter?

Meaningful names improve readability and reduce confusion when a workbook contains many worksheets.

**C. Delete a worksheet**

Right-click the worksheet tab and select Delete.

Deleting a worksheet removes that worksheet and its contents.

Be careful: this operation can cause permanent data loss if you do not have another copy.

**D. Hide and unhide a worksheet**

Right-click the worksheet tab and select Hide.

To bring it back:

Right-click another visible worksheet tab and select Unhide.

Remember:

- Hide makes a worksheet temporarily invisible.
- Unhide makes it visible again.
- Delete removes the worksheet.

**Important:** Hiding a worksheet does not protect confidential information. It is an organisational feature, not a security feature.

**E. Move or copy a worksheet**

You can move a worksheet to another position or copy it.

Example:

Suppose your workbook contains:

1. Sales_Data
2. Expense_Data
3. Profit_Analysis

You may want Profit_Analysis to appear first because it contains the final business results.

You can move it to the beginning.

Copying is useful when you want to reuse a worksheet's structure without rebuilding it.

**F. Change worksheet tab colour**

Right-click the worksheet tab and select Tab Color.

Example:

- Sales_Data: Blue
- Expense_Data: Orange
- Profit_Analysis: Green

This can help users visually distinguish different sections.

Do not depend on colours alone. Meaningful worksheet names are more important.

---

## 3. Navigation in Excel

### 3.1 What is navigation?

Navigation means moving between cells, rows, columns, worksheets, and different parts of a workbook.

Why does it exist?

A worksheet can contain more than one million rows. Moving through a large dataset manually would be inefficient.

An analyst needs to move quickly and accurately.

### 3.2 Important navigation shortcuts

| Shortcut | Action |
|---|---|
| Arrow Keys | Move one cell in the selected direction |
| Enter | Move one cell down by default |
| Tab | Move one cell to the right |
| Shift + Tab | Move one cell to the left |
| Home | Move to the beginning of the current row |
| Ctrl + Home | Move to cell A1 |
| Ctrl + End | Move to the last used cell in the worksheet |
| Ctrl + Arrow | Move to the edge of a data region or cell boundary |
| Ctrl + Page Down | Move to the next worksheet |
| Ctrl + Page Up | Move to the previous worksheet |
| Ctrl + G | Open the Go To dialogue box |
| F5 | Also opens Go To |

### 3.3 Understanding Ctrl + Arrow

This shortcut is particularly useful for data analysts.

Imagine a dataset:

| Product_ID | Product | Quantity |
|---|---|---:|
| P101 | Keyboard | 20 |
| P102 | Mouse | 35 |
| P103 | Monitor | 12 |
| P104 | Printer | 8 |
| P105 | Laptop | 15 |

Suppose your active cell is A1.

Pressing Ctrl + Down moves through the continuous data region towards its lower edge.

This is useful when you need to:

- Find the end of a dataset.
- Check how many records are present.
- Navigate large worksheets.
- Move between data regions.

**Important:** Ctrl + Arrow does not always move to the last row of the entire worksheet. Blank cells and gaps can change its behaviour.

### 3.4 Go To

Press Ctrl + G.

A dialogue box appears.

Enter a cell reference, such as:

`D100`

Excel will take you directly to cell D100.

This is especially useful when working with large worksheets.

You can also enter a range such as:

`A1:C20`

Excel will select that range.

---

## 4. Selection in Excel

### 4.1 What is selection?

Selection means choosing one or more cells so that you can perform an operation on them.

You can select a single cell, a range, a complete row, a complete column, or multiple separate areas.

### 4.2 Types of selection

**A. Single-cell selection**

Example: `A1`

Only one cell is selected.

You can enter data, edit its contents, copy it, or apply formatting.

**B. Range selection**

Example: `A1:A5`

This selects five cells in column A.

Another example:

`A1:C5`

This selects a rectangular area containing 15 cells.

Why is it useful?

You can apply formatting, borders, number formats, and other operations to multiple cells together.

**C. Complete row selection**

Shortcut:

`Shift + Space`

This selects the entire row containing the active cell.

**D. Complete column selection**

Shortcut:

`Ctrl + Space`

This selects the entire column containing the active cell.

**E. Entire worksheet selection**

Use the Select All button at the intersection of the row and column headings.

Ctrl + A can also select data regions or the worksheet, depending on the current selection and context.

**F. Non-contiguous selection**

Hold Ctrl while selecting separate cells or ranges.

Example:

Select A1:A5, then hold Ctrl and select C1:C5.

Both ranges remain selected even though column B lies between them.

This is useful when you need to format or inspect separate areas together.

---

## 5. Practical Business Scenario

Imagine you work as a junior data analyst at a retail company.

You receive a workbook called:

`Retail_Company_Report.xlsx`

It contains three worksheets:

- Sales_Data
- Expense_Data
- Customer_Data

Your manager asks you to prepare a separate monthly report without disturbing the original workbook.

A professional workflow would be:

1. Open the original workbook.
2. Use Save As to create a separate working copy.
3. Rename worksheets if their names are unclear.
4. Arrange worksheets in a logical order.
5. Hide worksheets that are not currently needed for presentation.
6. Use navigation shortcuts to move through large datasets.
7. Select relevant ranges for formatting and analysis.
8. Save your changes.

This is not just Excel knowledge. It is basic file and data-management discipline.

---

## 6. Common Mistakes

| Mistake | Why it is a problem | Better practice |
|---|---|---|
| Using Save instead of Save As when creating a separate copy | May overwrite the original working file | Use Save As |
| Deleting a worksheet instead of hiding it | Can remove important data | Hide it if you only want it out of sight |
| Using unclear worksheet names | Makes navigation difficult | Use descriptive names |
| Assuming CSV preserves everything | CSV cannot preserve full Excel workbook features | Use XLSX for full workbook functionality |
| Assuming Ctrl + Arrow always finds the final dataset row | Blank cells can change navigation behaviour | Check the data region |
| Selecting cells individually for large operations | Wastes time | Select a range where appropriate |

---

## 7. Professional Habits

A good analyst does more than know shortcuts.

A good analyst also maintains organised and reliable workbooks.

Follow these habits:

1. Use meaningful workbook and worksheet names.
2. Preserve original datasets before making major changes.
3. Use Save regularly.
4. Use Save As when creating separate versions.
5. Avoid deleting worksheets unless you are certain they are no longer required.
6. Learn navigation shortcuts.
7. Keep related data organised.
8. Use CSV only when its limitations are acceptable.

---

## 8. Quick Revision

| Concept | Remember |
|---|---|
| Workbook | The Excel file |
| Worksheet | A sheet inside the workbook |
| Save | Updates the current file |
| Save As | Creates a separate copy or saves under another name/location |
| Hide | Makes a worksheet temporarily invisible |
| Delete | Removes a worksheet |
| Ctrl + Home | Goes to A1 |
| Ctrl + End | Goes to the last used cell |
| Ctrl + Arrow | Navigates to a data-region edge or cell boundary |
| Ctrl + Space | Selects an entire column |
| Shift + Space | Selects an entire row |
| Range | A group of selected cells |
| Ctrl + G | Opens Go To |

---

## 9. Day 2 Learning Outcomes

After completing the practical assignment and assessment, you should be able to:

- Manage Excel workbooks.
- Understand common Excel file formats.
- Insert, rename, move, copy, hide, unhide, and delete worksheets.
- Navigate large worksheets using keyboard shortcuts.
- Select cells, ranges, rows, and columns.
- Organise a workbook using professional naming conventions.

**Day 2 theory: Complete.**

**Next topic — Day 3: Cell References and Data Entry Fundamentals**

We will study:
- Text, numbers, and dates.
- How Excel interprets entered values.
- Relative references.
- Absolute references.
- Mixed references.
- Common data-entry problems.
- Why cell references are essential for formulas and business analysis.