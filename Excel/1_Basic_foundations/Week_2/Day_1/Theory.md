# Week 2 – Day 01: Data Validation

## 1. Introduction to Data Validation

### Definition
Data Validation is an Excel feature that allows us to define rules controlling what users can enter into specific cells.

It helps maintain data consistency, accuracy and reliability by restricting unacceptable inputs.

### Why does Data Validation exist?

Consider a company collecting 10,000 sales transactions from different employees.

Without validation, the Branch column might contain:

| Branch Entered | Intended Branch |
|---|---|
| Dhanbad | Dhanbad |
| dhanbad | Dhanbad |
| DHANBAD | Dhanbad |
| Dhanbad1 | Dhanbad |
| Ranchi | Ranchi |

These inconsistencies can create problems during category-wise analysis, filtering and aggregation.

For example, using SUMIF to calculate branch-wise revenue may produce incomplete results if branch names are inconsistent.

**Fundamental idea:** Preventing incorrect data at the point of entry is generally easier than correcting thousands of records later.

---

## 2. Understanding the Data Validation Interface

**Navigation:**

1. Select the cells where restrictions are required.
2. Open the Data tab.
3. Locate the Data Tools group.
4. Click Data Validation.
5. Select Data Validation from the dropdown.

The Data Validation dialog box contains three important tabs:

| Tab | Purpose |
|---|---|
| Settings | Defines which inputs are permitted |
| Input Message | Displays instructions when a user selects a cell |
| Error Alert | Controls what happens when an invalid value is entered |

---

## 3. Types of Data Validation

### A. Whole Number

**Definition:** Restricts entries to whole numbers within specified conditions.

**Example:** A company allows employees to enter Units Sold between 1 and 500.

| Setting | Value |
|---|---|
| Allow | Whole Number |
| Data | Between |
| Minimum | 1 |
| Maximum | 500 |

Accepted values: 1, 50, 250, 500.

Rejected values: 0, -5, 12.5, 600.

**Business applications:**
- Units sold
- Inventory quantities
- Number of employees
- Order counts

### B. Decimal

**Definition:** Allows numerical values containing decimal places within specified limits.

**Example:** A company permits discounts between 0 and 50.

| Setting | Value |
|---|---|
| Allow | Decimal |
| Data | Between |
| Minimum | 0 |
| Maximum | 50 |

Accepted values: 10.5, 12.75, 49.99.

Rejected values: 55, -2.

**Business applications:**
- Discount rates
- Tax rates
- Interest rates
- Product measurements

**Important distinction:**

Whole Number restricts entries to integers, whereas Decimal allows fractional numerical values.

### C. List

**Definition:** Restricts entries to predefined options.

**Example:** A company operates three branches:

- Dhanbad
- Ranchi
- Bokaro

Configuration:

| Setting | Value |
|---|---|
| Allow | List |
| Source | Dhanbad,Ranchi,Bokaro |
| In-cell dropdown | Enabled |

Users can select a branch instead of typing it manually.

**Business applications:**
- Branch names
- Product categories
- Department names
- Payment methods
- Order statuses

**Using a separate source range:**

For larger lists, maintain permitted values in a separate worksheet.

Example:

```excel
=BranchList
```

Here, BranchList is a Named Range referring to the permitted branch names.

For a list located on another worksheet, Named Ranges are a convenient way to reference the source values.

### D. Date

**Definition:** Restricts entries to a specified date or date range.

**Example:** A company accepts transaction dates only within FY 2026–27.

| Setting | Value |
|---|---|
| Allow | Date |
| Data | Between |
| Start Date | 01-Apr-2026 |
| End Date | 31-Mar-2027 |

**Business applications:**
- Invoice dates
- Transaction dates
- Payment dates
- Financial reporting periods

### E. Time

**Definition:** Restricts entries to a specified time range.

**Example:** A company accepts delivery times between 9:00 AM and 6:00 PM.

**Business applications:**
- Delivery scheduling
- Employee attendance
- Appointment management

### F. Text Length

**Definition:** Controls the number of characters entered into a cell.

**Example:** An Order ID must contain exactly five characters.

| Setting | Value |
|---|---|
| Allow | Text Length |
| Data | Equal to |
| Length | 5 |

This checks the character count but does not verify the complete structure of an ID.

**Business applications:**
- Employee IDs
- Product codes
- Reference numbers
- Basic identification formats

### G. Custom

**Definition:** Allows users to create validation rules using Excel formulas.

**Example:** Require an email entry to contain an @ symbol.

Assuming the first input cell is A2:

```excel
=ISNUMBER(SEARCH("@",A2))
```

The formula returns TRUE if the symbol exists and FALSE otherwise.

Excel permits the entry when the formula evaluates to TRUE.

**Important:** This is only a basic check. It does not establish whether the email address actually exists or is valid.

**Business applications:**
- Custom business rules
- Duplicate prevention
- Conditional input restrictions
- Format checks

---

## 4. Understanding Validation Conditions

When selecting Whole Number, Decimal or Date, Excel provides different comparison conditions.

| Condition | Meaning |
|---|---|
| Between | Value must fall within two limits |
| Not between | Value must fall outside two limits |
| Equal to | Value must match a specified value |
| Not equal to | Value must differ from a specified value |
| Greater than | Value must exceed a limit |
| Less than | Value must be below a limit |
| Greater than or equal to | Value must meet or exceed a limit |
| Less than or equal to | Value must not exceed a limit |

**Example:**

If Units Sold must be at least 10:

- Allow: Whole Number
- Data: Greater than or equal to
- Minimum: 10

This is equivalent to the mathematical condition:

\[
Units\ Sold \geq 10
\]

---

## 5. Input Message

**Definition:** Input Message displays instructions when a user selects a cell containing Data Validation.

**Example:**

Title: Units Sold

Input Message: Enter a whole number between 1 and 500.

**Purpose:**

- Guides users before data entry.
- Explains permitted inputs.
- Reduces accidental mistakes.
- Improves consistency in shared workbooks.

**Key distinction:**

Settings defines the rules, whereas Input Message communicates those rules to the user.

---

## 6. Error Alert

**Definition:** Error Alert informs users when they attempt to enter data that violates a validation rule.

Excel provides three error alert styles.

### A. Stop

- Prevents an invalid entry from being accepted through normal input.
- Requires the user to correct the entry or cancel.
- Suitable for strict business requirements.

### B. Warning

- Warns users that their entry violates the validation rule.
- Allows them to continue if they choose.

### C. Information

- Informs users that the entry violates the validation rule.
- Allows the entry to be accepted.

**Comparison:**

| Alert Type | Purpose | Allows Invalid Entry? |
|---|---|---|
| Stop | Strict enforcement | No, through normal entry |
| Warning | Caution | Yes, if overridden |
| Information | Informational notice | Yes |

**Recommendation:** Use Stop for important fields such as branch, transaction date and quantity when invalid entries must not be accepted.

---

## 7. Practical Implementation: Controlled Sales-Entry Worksheet

Consider a wholesale company creating a sales-entry worksheet.

The company establishes these requirements:

| Column | Business Rule |
|---|---|
| Order ID | Must not be blank |
| Transaction Date | Within FY 2026–27 |
| Branch | Dhanbad, Ranchi or Bokaro |
| Category | One of four permitted categories |
| Units Sold | Whole number between 1 and 500 |
| Unit Price | Decimal greater than zero |
| Discount % | Decimal between 0 and 50 |

### Step 1: Create the worksheet

Create a worksheet named Sales Entry.

Add these column headings:

Order ID, Transaction Date, Branch, Category, Units Sold, Unit Price and Discount %.

### Step 2: Create dropdown lists

Create another worksheet named Master Data.

Maintain the permitted branch names and product categories.

Create Named Ranges:

- BranchList
- CategoryList

Apply List validation using:

```excel
=BranchList
```

```excel
=CategoryList
```

### Step 3: Apply numerical restrictions

Configure:

- Units Sold: Whole Number, Between 1 and 500.
- Unit Price: Decimal, Greater Than 0.
- Discount %: Decimal, Between 0 and 50.

### Step 4: Apply date restrictions

Configure Transaction Date:

- Allow: Date
- Data: Between
- Start: 01-Apr-2026
- End: 31-Mar-2027

### Step 5: Configure Input Messages

Provide suitable instructions for each field.

### Step 6: Configure Error Alerts

Use Stop for the numerical and categorical restrictions.

Example:

Title: Invalid Quantity

Message: Units Sold must be a whole number between 1 and 500.

### Step 7: Test the worksheet

| Field | Test Input | Expected Result |
|---|---|---|
| Branch | Dhanbad | Accept |
| Branch | Jamshedpur | Reject |
| Units Sold | 25 | Accept |
| Units Sold | 0 | Reject |
| Units Sold | 25.5 | Reject |
| Unit Price | 450.75 | Accept |
| Unit Price | -100 | Reject |
| Discount % | 35 | Accept |
| Discount % | 65 | Reject |
| Transaction Date | 15-Jun-2026 | Accept |
| Transaction Date | 15-Jun-2027 | Reject |

---

## 8. Important Concepts and Limitations

### A. Blank Cells and Ignore Blank

Data Validation generally permits blank cells unless additional rules are implemented.

For example, Whole Number between 1 and 500 does not automatically make a field mandatory.

Mandatory fields require additional completeness checks or appropriate custom rules.

### B. Dropdown Lists vs Free-Text Entry

Dropdown lists reduce spelling variations because users select from predefined choices.

However, they do not automatically guarantee that every record is complete or accurate.

### C. Data Validation vs Data Cleaning

| Data Validation | Data Cleaning |
|---|---|
| Controls or flags inputs | Identifies and corrects existing problems |
| Applied during data entry | Often applied after data collection |
| Enforces predefined rules | Improves existing data quality |

### D. Data Validation vs Conditional Formatting

These features serve different purposes.

**Data Validation:** Controls what users can enter.

**Conditional Formatting:** Changes the appearance of cells based on conditions.

Example:

- Data Validation restricts discounts to 0–50%.
- Conditional Formatting highlights discounts above 30%.

### E. Limitations of Data Validation

1. Copy-pasting and certain other operations can bypass or overwrite validation.
2. Existing invalid entries may remain after validation rules are applied.
3. Validation cannot guarantee the truthfulness of entered information.
4. A dropdown cannot ensure that the selected information is factually correct.
5. Data Validation is not a substitute for complete database controls.

Therefore, Data Validation should be combined with data-quality checks.

---

## 9. Day 01 – Key Takeaways

1. Data Validation controls the type of information users can enter into cells.
2. Excel provides seven main validation types: Whole Number, Decimal, List, Date, Time, Text Length and Custom.
3. Settings defines the rules, Input Message guides users and Error Alert handles invalid entries.
4. Stop, Warning and Information provide different levels of enforcement.
5. Data Validation improves data consistency and reduces errors at the point of entry.
6. Data Validation and Data Cleaning are complementary, not interchangeable.

**Practical business application:** A well-designed validation system helps maintain reliable sales, inventory, employee and financial datasets, ultimately improving the quality of business analysis.