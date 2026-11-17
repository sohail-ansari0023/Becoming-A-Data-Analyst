# Day 06 – Text Functions & Data Cleaning in Excel

## 1. Understanding Text Data

Text data refers to information stored as characters rather than numerical values used directly in calculations.

Examples:
- Customer names
- Product codes
- City names
- Employee IDs
- Email addresses
- Invoice numbers

**Why does text data need cleaning?**

Imagine a company has customer records containing:

- `rahul sharma`
- ` RAHUL SHARMA `
- `Rahul Sharma`

Humans can recognise that these may represent the same person. However, inconsistent formatting can create problems when matching, grouping, filtering, or analysing records.

Data cleaning helps make the information consistent and usable.

---

## 2. Important Excel Text Functions

### A. LEN()

**Purpose:** Counts the number of characters in a text value, including spaces.

**Syntax:**
```excel
=LEN(text)
```

**Example:**
```excel
=LEN("Rahul")
```
Result: `5`

```excel
=LEN("Rahul Sharma")
```
Result: `12`

**Business application:** Checking the length of customer IDs, product codes, or phone-number entries.

### B. TRIM()

**Purpose:** Removes unnecessary spaces from text, leaving single spaces between words.

**Syntax:**
```excel
=TRIM(text)
```

**Example:**
```excel
=TRIM("  Rahul   Sharma  ")
```
Result: `Rahul Sharma`

**Important:** TRIM mainly handles ordinary spaces (ASCII 32). It does not remove every possible invisible character.

### C. UPPER()

Converts all letters to uppercase.

```excel
=UPPER("rahul sharma")
```
Result: `RAHUL SHARMA`

### D. LOWER()

Converts all letters to lowercase.

```excel
=LOWER("RAHUL SHARMA")
```
Result: `rahul sharma`

### E. PROPER()

Capitalises the first letter of each word.

```excel
=PROPER("rahul sharma")
```
Result: `Rahul Sharma`

**Important limitation:** PROPER does not understand brand-specific or personal-name conventions. For example, `iPhone` may become `Iphone`.

### F. LEFT()

Extracts characters from the beginning of a text string.

**Syntax:**
```excel
=LEFT(text, [num_chars])
```

**Example:**
```excel
=LEFT("ELEC-2026-001",4)
```
Result: `ELEC`

**Business application:** Extracting a product category from a product code.

### G. RIGHT()

Extracts characters from the end of a text string.

```excel
=RIGHT("ELEC-2026-001",3)
```
Result: `001`

**Business application:** Extracting a serial number or final identifier.

### H. MID()

Extracts characters from the middle of a text string.

**Syntax:**
```excel
=MID(text, start_num, num_chars)
```

**Example:**
```excel
=MID("ELEC-2026-001",6,4)
```
Result: `2026`

Here:
- Start position = 6
- Number of characters = 4

**Business application:** Extracting manufacturing years, transaction periods, or product identifiers.

### I. FIND()

Finds the position of one text string inside another.

**Syntax:**
```excel
=FIND(find_text, within_text, [start_num])
```

**Example:**
```excel
=FIND("-","ELEC-2026-001")
```
Result: `5`

The hyphen is the fifth character.

**Important:** FIND is case-sensitive.

### J. SEARCH()

Works similarly to FIND but is not case-sensitive.

```excel
=SEARCH("elec","ELEC-2026-001")
```
Result: `1`

**Difference:**
- FIND: Case-sensitive.
- SEARCH: Not case-sensitive.

SEARCH also supports wildcard characters such as `*` and `?`.

### K. SUBSTITUTE()

Replaces specific text within a string.

**Syntax:**
```excel
=SUBSTITUTE(text, old_text, new_text, [instance_num])
```

**Example:**
```excel
=SUBSTITUTE("ELEC-2026-001","-","/")
```
Result: `ELEC/2026/001`

You can also replace a particular occurrence:

```excel
=SUBSTITUTE("A-B-C","-","/",2)
```
Result: `A-B/C`

### L. CONCAT()

Joins text values together.

```excel
=CONCAT("Rahul"," ","Sharma")
```
Result: `Rahul Sharma`

### M. TEXTJOIN()

Joins multiple text values using a specified delimiter.

**Syntax:**
```excel
=TEXTJOIN(delimiter, ignore_empty, text1, ...)
```

**Example:**
```excel
=TEXTJOIN(", ",TRUE,"Rahul","Dhanbad")
```
Result: `Rahul, Dhanbad`

The `TRUE` argument tells Excel to ignore empty cells.

**Business application:** Combining customer names and locations, creating labels, or preparing readable reports.

### N. CLEAN()

Removes many non-printing characters from text.

```excel
=CLEAN(A2)
```

**Why it matters:** Data imported from external systems may contain invisible control characters that interfere with processing.

CLEAN does not remove every type of invisible Unicode character or ordinary extra spaces. Combining it with TRIM can help:

```excel
=TRIM(CLEAN(A2))
```

### O. VALUE()

Converts a number stored as text into a numeric value.

```excel
=VALUE("1500")
```
Result: `1500` as a number.

**Business application:** Converting imported sales figures into values that Excel can calculate.

### P. TEXT()

Converts a value into text using a specified format.

**Syntax:**
```excel
=TEXT(value, format_text)
```

**Example:**
```excel
=TEXT(1500,"₹#,##0")
```
Result: `₹1,500`

Another example:

```excel
=TEXT(DATE(2026,11,15),"dd-mmm-yyyy")
```
Result: `15-Nov-2026`

**Important:** TEXT returns text, not a numeric value. Avoid converting numbers into text if you still need to perform calculations on them.

---

## 3. Combining Functions – The Real Power of Excel

Individual functions solve small problems. Combining them allows us to automate complete cleaning tasks.

### Example 1: Cleaning customer names

Original value in B2:

`  rahul sharma  `

Formula:

```excel
=PROPER(TRIM(B2))
```

Result:

`Rahul Sharma`

How it works:
1. TRIM removes unnecessary spaces.
2. PROPER capitalises each word.
3. Excel returns a cleaner name.

### Example 2: Extracting product information

Suppose D2 contains:

`ELEC-2026-001`

**Extract category:**
```excel
=LEFT(D2,FIND("-",D2)-1)
```
Result: `ELEC`

**Extract manufacturing year:**
```excel
=MID(D2,FIND("-",D2)+1,4)
```
Result: `2026`

**Extract serial number:**
```excel
=RIGHT(D2,3)
```
Result: `001`

This is an example of breaking one combined field into multiple meaningful columns.

---

## 4. Data Cleaning – Professional Approach

Data cleaning is the process of identifying and correcting or managing inaccurate, inconsistent, incomplete, or improperly formatted data.

### Why does it exist?

Raw data is rarely ready for analysis.

A business may collect information from:
- Customer registration forms
- Sales software
- Excel files
- Online orders
- Different departments
- External databases

Each source may follow different formatting rules.

If we analyse inconsistent data without checking it, our conclusions may become unreliable.

### Recommended cleaning workflow

1. Preserve the original data.
2. Inspect the dataset and identify problems.
3. Standardise text formatting.
4. Remove unwanted spaces and characters.
5. Convert values into appropriate data types.
6. Extract useful information where required.
7. Validate the cleaned output.
8. Keep a record of important transformations.

### Raw data vs cleaned data

| Raw data | Cleaned data |
|---|---|
| `  rahul sharma ` | `Rahul Sharma` |
| `dhanbad` | `Dhanbad` |
| `PRIYA KUMARI` | `Priya Kumari` |
| `  ananya das` | `Ananya Das` |

**Professional principle:** Never overwrite your original data during the initial cleaning process. Keep raw and cleaned columns separate.

---

## 5. Practical Dataset – Customer Data Cleaning

Use the following dataset in Excel.

| Customer ID | Raw Name | Raw City | Product Code |
|---|---|---|---|
| C001 | `  rahul sharma ` | `dhanbad` | ELEC-2026-001 |
| C002 | `PRIYA KUMARI` | `DHANBAD` | FURN-2025-002 |
| C003 | ` Amit Kumar  ` | `bokaro` | ELEC-2026-003 |
| C004 | `NEHA SINGH` | `BOKARO` | CLOTH-2024-004 |
| C005 | `  ananya das` | `ranchi` | FURN-2025-005 |
| C006 | `ROHAN VERMA ` | `RANCHI` | ELEC-2026-006 |
| C007 | `sneha roy` | `dhanbad` | CLOTH-2024-007 |
| C008 | `  ARJUN KUMAR ` | `bokaro` | ELEC-2026-008 |

### Column structure

| Column | Field |
|---|---|
| A | Customer ID |
| B | Raw Name |
| C | Raw City |
| D | Product Code |
| E | Clean Name |
| F | Clean City |
| G | Product Category |
| H | Manufacturing Year |
| I | Serial Number |

### Required formulas

**E2 – Clean Name**
```excel
=PROPER(TRIM(B2))
```

**F2 – Clean City**
```excel
=PROPER(TRIM(C2))
```

**G2 – Product Category**
```excel
=LEFT(D2,FIND("-",D2)-1)
```

**H2 – Manufacturing Year**
```excel
=MID(D2,FIND("-",D2)+1,4)
```

**I2 – Serial Number**
```excel
=RIGHT(D2,3)
```

Enter the formulas in row 2 and fill them down to row 9.

### Additional analysis

**1. Count the characters in a product code:**
```excel
=LEN(D2)
```

**2. Find the position of the first hyphen:**
```excel
=FIND("-",D2)
```

**3. Convert customer IDs into lowercase:**
```excel
=LOWER(A2)
```

**4. Combine cleaned customer name and city:**
```excel
=TEXTJOIN(", ",TRUE,E2,F2)
```

---

## 6. Important Data Quality Lessons

### A. Why preserve raw data?

Because every transformation makes a change to the original information. If the transformation is incorrect, the original data allows us to investigate and correct the issue.

### B. Why standardise text?

Computers process data according to defined rules. Two values that look similar to a person may not always be treated identically by every software system.

For example:
- `Dhanbad`
- `dhanbad`
- ` DHANBAD `

Consistent formatting makes analysis and integration easier.

### C. Why isn't PROPER always enough?

Because language, personal names, and brand names have exceptions. Automated formatting should be validated rather than blindly trusted.

### D. Why should we avoid blind replacements?

Replacing every occurrence of a word or character may change information that should remain untouched. Always inspect the context before applying transformations.

---

## 7. Common Mistakes

1. Using the wrong source column in a formula.
2. Forgetting that LEFT and RIGHT count characters, not words.
3. Confusing FIND with SEARCH.
4. Assuming TRIM removes every invisible character.
5. Using PROPER without checking special names and brands.
6. Converting numeric values to text when calculations are still required.
7. Overwriting raw data instead of preserving it.
8. Assuming that a formula returning a result necessarily means the result is correct.

**Analyst habit:** Always check both the formula and the column it references. A perfectly written formula can still produce the wrong result when it references the wrong column.

---

## 8. Day 06 – Quick Revision

| Function | Main purpose |
|---|---|
| LEN | Count characters |
| TRIM | Remove extra ordinary spaces |
| UPPER | Convert to uppercase |
| LOWER | Convert to lowercase |
| PROPER | Capitalise each word |
| LEFT | Extract from the beginning |
| RIGHT | Extract from the end |
| MID | Extract from the middle |
| FIND | Find text position, case-sensitive |
| SEARCH | Find text position, case-insensitive |
| SUBSTITUTE | Replace specific text |
| CONCAT | Join text |
| TEXTJOIN | Join text using a delimiter |
| CLEAN | Remove many non-printing characters |
| VALUE | Convert numeric text to a number |
| TEXT | Format a value as text |

**Final takeaway:** Text functions are not merely formatting tools. They help transform raw, inconsistent information into structured data that can be analysed reliably. In professional data analysis, clean data is the foundation of trustworthy results.