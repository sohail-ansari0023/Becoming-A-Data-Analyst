# Data Cleaning Practice Datasets - Comprehensive Guide

## 📊 Overview

Three **progressive messy datasets** designed to simulate real-world data cleaning scenarios that analysts encounter daily. Each dataset increases in complexity and introduces realistic data quality issues.

---

## 📋 Dataset Specifications

| Aspect | Easy Level | Medium Level | Hard Level |
|--------|-----------|--------------|-----------|
| **Rows** | 1,827 | 1,900 | 2,000 |
| **Columns** | 15 | 15 | 15 |
| **Scenario** | E-Commerce Orders | HR Employee Records | Supply Chain Logistics |
| **Primary Issue Type** | Formatting & Basic Missing Data | Mixed Data Types & Outliers | Cross-Column Logic & Temporal Violations |
| **Difficulty** | Beginner (1-2 hrs) | Intermediate (3-5 hrs) | Advanced (6-10 hrs) |

---

## 🟢 LEVEL 1: EASY - E-Commerce Orders Dataset

### Business Context
E-commerce platform order management system with customer transaction data spanning 2023.

### Column Descriptions
1. **OrderID** - Unique order identifier (ORD000001, ORD000002, etc.)
2. **CustomerID** - Customer reference (CUST00001-CUST00500)
3. **ProductName** - Product purchased
4. **Category** - Product category (Electronics, Accessories, Peripherals)
5. **Quantity** - Units ordered (1-20)
6. **UnitPrice** - Price per unit ($10-$2000)
7. **OrderDate** - When order was placed (mixed formats)
8. **ShipDate** - When order was shipped (mixed formats)
9. **DeliveryDate** - When order was delivered
10. **Status** - Order status (Completed, Pending, Cancelled, Shipped)
11. **PaymentMethod** - Payment type
12. **TotalAmount** - Total order value (Quantity × UnitPrice)
13. **CustomerEmail** - Customer contact email
14. **PhoneNumber** - Customer contact phone
15. **Notes** - Additional comments (sparse)

### 🔍 Data Quality Issues (EASY)

#### Issue #1: Missing Values (6% of data)
- **Location**: ShipDate, DeliveryDate, CustomerEmail columns
- **Type**: NaN/NULL values
- **Real-world scenario**: Incomplete transaction records, pending orders
- **Challenge**: Decide what to do with incomplete records
- **Skills**: Identifying missing data, handling strategies (drop/fill/interpolate)

```
Example: 50 rows have NULL ShipDate (orders not yet shipped)
```

#### Issue #2: Duplicates (3% of data)
- **Location**: Complete row duplicates
- **Type**: Exact duplicate records
- **Real-world scenario**: Double-entry errors, system glitches, API retries
- **Challenge**: Identify and remove duplicates while maintaining data integrity
- **Skills**: Detecting duplicates, handling unique records

```
Example: Order ORD000150 appears twice with identical data
```

#### Issue #3: Inconsistent Date Formats (3% of data)
- **Location**: OrderDate column
- **Type**: Mixed formats (MM/DD/YYYY, DD-MMM-YYYY, datetime objects)
- **Real-world scenario**: Data from multiple sources or system migrations
- **Challenge**: Standardize to single format
- **Skills**: Date parsing, format conversion, datetime handling

```
Before: ['2023-01-15', '01/15/2023', '15-Jan-2023']
After:  ['2023-01-15', '2023-01-15', '2023-01-15']
```

#### Issue #4: Extra Whitespace (4% of data)
- **Location**: ProductName column
- **Type**: Leading/trailing spaces
- **Real-world scenario**: Manual data entry, copy-paste errors
- **Challenge**: Clean whitespace without losing data
- **Skills**: String manipulation, text cleaning

```
Before: 'Laptop  ', '  Mouse', ' Keyboard '
After:  'Laptop', 'Mouse', 'Keyboard'
```

#### Issue #5: Case Inconsistencies (4% of data)
- **Location**: Status column
- **Type**: Mixed case (lowercase, UPPERCASE)
- **Real-world scenario**: Different data entry personnel, legacy systems
- **Challenge**: Standardize categorical values
- **Skills**: Case normalization, categorical standardization

```
Before: ['completed', 'PENDING', 'Cancelled', 'SHIPPED']
After:  ['Completed', 'Pending', 'Cancelled', 'Shipped']
```

### 🎯 Key Cleaning Tasks
1. Identify and handle missing values
2. Remove duplicate rows
3. Standardize date formats
4. Strip and clean whitespace
5. Normalize case in categorical columns
6. Validate data types (ensure numeric columns are numeric)

### 💡 Estimated Time: 1-2 hours

---

## 🟡 LEVEL 2: MEDIUM - HR Employee Records Dataset

### Business Context
Human Resources database containing employee master data with performance metrics and compensation information.

### Column Descriptions
1. **EmployeeID** - Unique employee identifier (EMP00001-EMP01900)
2. **FirstName** - Employee first name
3. **LastName** - Employee surname
4. **Department** - Department assignment (Sales, IT, HR, Finance, Operations, Marketing, R&D)
5. **Position** - Job title (Manager, Senior, Junior, Intern, Analyst, Engineer, Coordinator)
6. **JoinDate** - Hire date (mixed formats)
7. **BaseSalary** - Annual salary (with outliers)
8. **Bonus** - Annual bonus (mixed NULL representations)
9. **AgeYears** - Employee age (with negative values)
10. **Gender** - Gender identity (M, F, Other, NA)
11. **PerformanceRating** - Annual rating (mixed cases and formats)
12. **YearsExperience** - Total years in field
13. **ManagerID** - Direct manager's EmployeeID
14. **Email** - Work email (with duplicates)
15. **EmploymentStatus** - Active/Inactive/On Leave

### 🔍 Data Quality Issues (MEDIUM)

#### Issue #1: Multiple NULL Representations (8% of data)
- **Location**: Bonus column
- **Type**: np.nan, 'NA', 'N/A', -999
- **Real-world scenario**: Data from multiple systems/sources with different encoding
- **Challenge**: Standardize all NULL representations
- **Skills**: Pattern recognition, data standardization, replacement strategies

```
Before: [5000.0, np.nan, 'NA', 'N/A', -999, 2500.0]
After:  [5000.0, np.nan, np.nan, np.nan, np.nan, 2500.0]
```

#### Issue #2: Inconsistent Categorical Values (5% of data)
- **Location**: Department column
- **Type**: Typos, extra whitespace, abbreviations
- **Real-world scenario**: Manual entry variations, abbreviation inconsistency
- **Challenge**: Map variants to correct values
- **Skills**: Fuzzy matching, category standardization, value mapping

```
Before: ['Sales', 'sales ', 'I.T', 'hr  ', 'Finance']
After:  ['Sales', 'Sales', 'IT', 'HR', 'Finance']
```

#### Issue #3: Impossible Values (2% of data)
- **Location**: AgeYears column
- **Type**: Negative ages (-45 years old)
- **Real-world scenario**: Data entry errors, sign reversal bugs
- **Challenge**: Identify and correct logically impossible values
- **Skills**: Business rule validation, outlier detection

```
Before: [28, -45, 32, -22, 51]
After:  [28, 45, 32, 22, 51] OR [28, NaN, 32, NaN, 51]
```

#### Issue #4: Extreme Outliers (3% of data)
- **Location**: BaseSalary column
- **Type**: Values like 999999, 1 (far outside reasonable range)
- **Real-world scenario**: Data entry typos, placeholder values, system errors
- **Challenge**: Identify legitimate extremes vs. errors
- **Skills**: Outlier detection, distribution analysis, domain knowledge application

```
Before: [45000, 120000, 999999, 85000, 1, 95000]
After:  [45000, 120000, NaN, 85000, NaN, 95000] 
        (or investigation to determine if legitimate)
```

#### Issue #5: Inconsistent Categorical Formatting (4% of data)
- **Location**: PerformanceRating column
- **Type**: Mixed cases ('EXCELLENT', 'good', 'Excellent', 'Good')
- **Real-world scenario**: Different versions of rating system, legacy data
- **Challenge**: Standardize all variations to canonical format
- **Skills**: Case normalization, value mapping

```
Before: ['Excellent', 'EXCELLENT', 'good', 'Good', 'AVERAGE']
After:  ['Excellent', 'Excellent', 'Good', 'Good', 'Average']
```

#### Issue #6: Duplicate Emails (2% of data)
- **Location**: Email column
- **Type**: Multiple employees with same email
- **Real-world scenario**: Test data mixed in, employee transfers, email system errors
- **Challenge**: Identify and investigate duplicates
- **Skills**: Finding duplicates by column, cross-reference checks

```
Before: [emp1@company.com, emp2@company.com, emp1@company.com, emp3@company.com]
After: Investigate which records are legitimate duplicates
```

#### Issue #7: Mixed Date Formats (4% of data)
- **Location**: JoinDate column
- **Type**: Multiple date representations (DD/MM/YYYY, YYYYMMDD)
- **Real-world scenario**: Data merged from multiple systems
- **Challenge**: Parse and standardize dates from different formats
- **Skills**: Advanced date parsing, format detection

```
Before: ['15/01/2020', '20200115', datetime(2020,1,15), '2020-01-15']
After:  ['2020-01-15', '2020-01-15', '2020-01-15', '2020-01-15']
```

### 🎯 Key Cleaning Tasks
1. Standardize all NULL representations
2. Fix inconsistent department/position names
3. Correct impossible age values
4. Identify and handle salary outliers
5. Standardize all categorical values (case, encoding)
6. Find and flag duplicate emails
7. Parse and convert mixed date formats
8. Validate data ranges and business rules

### 💡 Estimated Time: 3-5 hours

---

## 🔴 LEVEL 3: HARD - Supply Chain & Logistics Dataset

### Business Context
Logistics network managing shipments across multiple regions with complex hierarchical geography and multi-stage fulfillment tracking.

### Column Descriptions
1. **ShipmentID** - Unique shipment identifier (SHIP000001-SHIP002000)
2. **Region** - Geographic region (North, South, East, West, Central)
3. **District** - Sub-region within region (N1-N3, S1-S3, E1-E2, W1-W3, C1-C2)
4. **Warehouse** - Distribution warehouse code (WH_ABC, WH_DEF, etc.)
5. **SKU** - Stock keeping unit / product code
6. **ProductCategory** - Category of goods (Electronics, Textiles, Food, Furniture, Cosmetics)
7. **QuantityOrdered** - Units ordered by customer (1-1000)
8. **QuantityShipped** - Units actually shipped (0-1000)
9. **QuantityDelivered** - Units received by customer (0-1000)
10. **OrderDate** - Customer order date
11. **ShipDate** - Actual shipment date
12. **DeliveryDate** - Delivery completion date
13. **CostPerUnit** - Unit cost (mixed NULL representations)
14. **CarrierCode** - Shipping provider (FDX, UPS, DHL, USPS, TNT)
15. **DeliveryStatus** - Current status (Delivered, In Transit, Delayed, Lost, Cancelled)
16. **Notes** - Additional comments

### 🔍 Data Quality Issues (HARD)

#### Issue #1: Cross-Column Logic Violations (5% of data)
- **Location**: Quantity columns (QuantityOrdered, QuantityShipped, QuantityDelivered)
- **Type**: QuantityDelivered > QuantityOrdered (impossible), QuantityShipped > QuantityOrdered
- **Real-world scenario**: Warehouse adjustments, undisclosed refunds, system record mismatches
- **Challenge**: Identify which column has the error, investigate business rules
- **Skills**: Multi-column validation, business rule enforcement, root cause analysis

```
Before: 
  ShipmentID  QuantityOrdered  QuantityShipped  QuantityDelivered
  SHIP0001    100              90               95                ✓ Valid
  SHIP0002    100              95               150               ✗ Invalid (delivered more than ordered)
  SHIP0003    100              120              100               ✗ Invalid (shipped more than ordered)

After: Investigate, flag for review, or correct based on business logic
```

#### Issue #2: Temporal Logic Violations (4% of data)
- **Location**: Date columns (OrderDate, ShipDate, DeliveryDate)
- **Type**: DeliveryDate < ShipDate (delivered before shipped), ShipDate < OrderDate (shipped before ordered)
- **Real-world scenario**: Data entry errors, timezone issues, timestamp glitches
- **Challenge**: Identify which date is wrong, may require external validation
- **Skills**: Temporal validation, sequence analysis, timestamp debugging

```
Before:
  ShipmentID  OrderDate     ShipDate      DeliveryDate  Status
  SHIP0001    2023-01-15    2023-01-16    2023-01-20    ✓ Valid
  SHIP0002    2023-02-01    2023-02-10    2023-01-25    ✗ Invalid (delivered before shipped)
  SHIP0003    2023-03-05    2023-03-02    2023-03-10    ✗ Invalid (shipped before ordered)

After: Correct or flag for investigation
```

#### Issue #3: Hierarchical Category Mismatch (3% of data)
- **Location**: Region and District columns
- **Type**: District codes don't match assigned region (e.g., Region='North' but District='S1')
- **Real-world scenario**: Data migration errors, incomplete updates, referential integrity issues
- **Challenge**: Validate hierarchical relationships, correct or flag
- **Skills**: Referential validation, hierarchy mapping, data consistency checks

```
Valid Hierarchy:
  Region      Valid Districts
  North       N1, N2, N3
  South       S1, S2, S3
  East        E1, E2
  West        W1, W2, W3
  Central     C1, C2

Before (Invalid):
  Region='North', District='S1'  ✗ S1 belongs to South, not North
  Region='South', District='E1'  ✗ E1 belongs to East, not South

After: Correct mismatches or flag for review
```

#### Issue #4: Inconsistent Categorical Encoding (6% of data)
- **Location**: CarrierCode column
- **Type**: Multiple representations of same carrier ('FDX', 'fedex', 'Fedex Express', 'FedEX')
- **Real-world scenario**: Data from multiple sources, manual entry variations, system migrations
- **Challenge**: Identify equivalent values and map to canonical form
- **Skills**: Pattern matching, fuzzy matching, standardization

```
Before: ['FDX', 'fedex', 'Fedex Express', 'FedEX', 'UPS', 'ups', 'Ups']
After:  ['FDX', 'FDX', 'FDX', 'FDX', 'UPS', 'UPS', 'UPS']
```

#### Issue #5: Inconsistent Status Values (5% of data)
- **Location**: DeliveryStatus column
- **Type**: Multiple representations ('Delivered', 'delivered', 'DELIVERED', 'Dlvrd')
- **Real-world scenario**: Different systems, manual abbreviations, legacy data
- **Challenge**: Standardize all variants
- **Skills**: Categorical standardization, abbreviation resolution

```
Before: ['Delivered', 'delivered', 'DELIVERED', 'Dlvrd', 'In Transit', 'IN TRANSIT']
After:  ['Delivered', 'Delivered', 'Delivered', 'Delivered', 'In Transit', 'In Transit']
```

#### Issue #6: Multiple NULL Representations (7% of data)
- **Location**: CostPerUnit column
- **Type**: np.nan, 'N/A', 0, negative values
- **Real-world scenario**: Missing cost data, zero-cost items, incorrect entries
- **Challenge**: Standardize NULLs, distinguish between 0 and missing
- **Skills**: NULL standardization, handling multiple missing data encodings

```
Before: [50.5, np.nan, 'N/A', 0, -25.5, 100.0]
After:  [50.5, np.nan, np.nan, 0, np.nan, 100.0]
        (or handle differently based on business rules)
```

#### Issue #7: Negative and Invalid Values (2% of data)
- **Location**: CostPerUnit column
- **Type**: Negative costs (-50, -200)
- **Real-world scenario**: Data entry errors, refunds, system glitches
- **Challenge**: Determine if negative indicates refund or error
- **Skills**: Value validation, business rule application, context analysis

```
Before: [50.0, 75.5, -50.0, 100.0, -200.0, 25.0]
After:  [50.0, 75.5, np.nan, 100.0, np.nan, 25.0]
        (or investigate if these represent refunds/credits)
```

#### Issue #8: Decimal Precision Inconsistency (4% of data)
- **Location**: CostPerUnit column
- **Type**: Mixed decimal places (50, 50.5, 50.55, 50.5555)
- **Real-world scenario**: Different calculation systems, rounding variations
- **Challenge**: Standardize decimal precision while maintaining accuracy
- **Skills**: Numeric formatting, rounding strategies, precision handling

```
Before: [50, 50.5, 50.55, 50.5555, 75.123456]
After:  [50.00, 50.50, 50.55, 50.56, 75.12]
```

#### Issue #9: Whitespace and Case Issues (3% of data)
- **Location**: ProductCategory column
- **Type**: Extra whitespace (' Electronics '), case variation ('electronics')
- **Real-world scenario**: Manual data entry, copy-paste errors
- **Challenge**: Clean whitespace and standardize case
- **Skills**: String cleaning, case normalization

```
Before: ['Electronics', ' Electronics ', 'electronics', ' Textiles', 'FOOD']
After:  ['Electronics', 'Electronics', 'Electronics', 'Textiles', 'Food']
```

#### Issue #10: Sparse/Missing Categories (sparse)
- **Location**: ProductCategory column
- **Type**: Empty strings, missing categories
- **Real-world scenario**: Unclassified products, data entry incomplete
- **Challenge**: Decide on handling strategy (fill, remove, investigate)
- **Skills**: Handling missing categories, imputation decisions

```
Before: ['Electronics', '', 'Food', 'Furniture', '', 'Cosmetics']
After:  ['Electronics', 'Unclassified', 'Food', 'Furniture', 'Unclassified', 'Cosmetics']
        (or investigate what category '' represents)
```

### 🎯 Key Cleaning Tasks
1. Validate cross-column quantity relationships
2. Correct temporal sequence violations (Order → Ship → Delivery)
3. Validate Region-District hierarchical relationships
4. Standardize carrier codes
5. Standardize delivery status values
6. Standardize NULL representations for costs
7. Handle negative and impossible values
8. Normalize decimal precision
9. Clean whitespace and case inconsistencies
10. Handle missing/empty categories
11. Document all business rule violations
12. Create data quality report

### 💡 Estimated Time: 6-10 hours

### 🎓 Advanced Skills Required
- Multi-column validation
- Temporal logic understanding
- Hierarchical data validation
- Root cause analysis
- Data quality metrics
- SQL or Python proficiency for complex operations
- Business domain knowledge

---

## 📈 Progression Difficulty Curve

```
Difficulty
    ^
    |                           ███ HARD (Advanced)
    |                    ███░░░░░░░
    |            ███░░░░░░░░░░░░░░
    |     ███░░░░░░░░░░░░░░░░░░░░░
    |___███________________________________> Datasets
         EASY    MEDIUM    HARD
```

**Easy → Medium:**  
- Introduces mixed data types and multiple NULL representations
- Adds outlier detection and validation requirements
- Increases categorical complexity

**Medium → Hard:**  
- Moves from single-column to multi-column validation
- Introduces logical consistency checks across columns
- Adds temporal and hierarchical validation
- Requires business rule understanding
- Higher volume of complex issues

---

## 🛠️ Recommended Tools & Approaches

### Python (Recommended)
```python
import pandas as pd
import numpy as np

# Load dataset
df = pd.read_excel('data_cleaning_practice_datasets.xlsx', sheet_name='Easy_Level')

# Basic info
df.info()
df.describe()
df.isnull().sum()
df.duplicated().sum()

# Cleaning
df = df.drop_duplicates()
df = df.dropna(subset=['required_columns'])
df['column'] = df['column'].str.strip()
df['column'] = df['column'].str.lower()
```

### Excel/Spreadsheet
- Use conditional formatting to highlight issues
- Create validation rules
- Use formulas to detect inconsistencies
- Pivot tables for analysis

### SQL (If loading to database)
- Use CASE statements for categorization
- Validate referential integrity
- Generate data quality reports

### Data Quality Tools
- Great Expectations (Python library)
- Pandas Profiling
- OpenRefine (visual, web-based)

---

## 📊 Learning Outcomes

### After Completing ALL THREE Datasets, You Will Master:

**Easy Level:**
- ✓ Missing value handling strategies
- ✓ Duplicate detection and removal
- ✓ Date/time parsing and standardization
- ✓ Text cleaning (whitespace, case)
- ✓ Basic data validation

**Medium Level:**
- ✓ Multiple NULL representation standardization
- ✓ Categorical value normalization
- ✓ Outlier detection and handling
- ✓ Impossible value identification
- ✓ Email validation and duplicate detection
- ✓ Mixed data type handling

**Hard Level:**
- ✓ Cross-column validation logic
- ✓ Temporal sequence validation
- ✓ Hierarchical relationship validation
- ✓ Complex business rule application
- ✓ Data quality metrics and reporting
- ✓ Root cause analysis
- ✓ Complex pattern matching

---

## 💼 Real-World Applicability

These datasets mirror actual scenarios you'll encounter as a data analyst:

| Issue | Real-World Example |
|-------|-------------------|
| Missing values | Customer records with optional fields |
| Duplicates | CRM with merged databases |
| Date formats | Legacy system data migration |
| Whitespace | Manual data entry |
| Case inconsistency | Different data sources/regions |
| Multiple NULLs | Different encoding from APIs |
| Outliers | Fraudulent transactions or system errors |
| Logic violations | Incorrect shipment records |
| Temporal issues | Timezone or system clock problems |
| Hierarchy mismatches | Location data from multiple sources |

---

## ✅ Checklist for Each Dataset

Before considering a dataset "cleaned," verify:

- [ ] All missing values handled consistently
- [ ] Duplicates identified and dealt with
- [ ] Date columns are uniform format
- [ ] Text columns are trimmed and case-normalized
- [ ] Categorical columns have standardized values
- [ ] Numeric columns have correct data types
- [ ] All business rules validated
- [ ] Outliers reviewed and handled
- [ ] No impossible values remain
- [ ] Data completeness verified
- [ ] Cross-column relationships validated
- [ ] Results documented and reproducible

---

## 🎯 Success Criteria

**Easy Level:** Can clean the dataset in 1-2 hours  
**Medium Level:** Can clean in 3-5 hours with good documentation  
**Hard Level:** Can clean in 6-10 hours with full business rule validation

Time includes exploration, cleaning, validation, and documentation.

---

## 📝 Next Steps

1. **Start with Easy Level** - Build foundational cleaning skills
2. **Progress to Medium** - Handle more complex data issues
3. **Tackle Hard Level** - Develop advanced analytical thinking
4. **Create your own datasets** - Apply learning to real scenarios
5. **Document your process** - Build a cleaning playbook

Good luck with your data cleaning practice! 🚀
