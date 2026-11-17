# Excel Training — Day 5
## Conditional Logic and Decision-Making

### 1. What Is Conditional Logic?

**Definition:** Conditional logic allows Excel to evaluate a condition and return a result depending on whether that condition is TRUE or FALSE.

In simple terms, we teach Excel to make decisions.

**Why does it exist?**

Businesses often need to classify and evaluate records automatically.

Examples:

- Identify employees who achieved sales targets.
- Determine which customers qualify for discounts.
- Classify business performance.
- Identify transactions that need attention.

Without conditional logic, these decisions would have to be made manually.

**Business example:**

A company sets a monthly sales target of ₹50,000.

If sales are at least ₹50,000, the employee achieves the target. Otherwise, the target is not achieved.

---

### 2. Comparison Operators

Comparison operators allow Excel to compare two values.

| Operator | Meaning | Example |
|---|---|---|
| `=` | Equal to | `=A2=100` |
| `>` | Greater than | `=A2>100` |
| `<` | Less than | `=A2<100` |
| `>=` | Greater than or equal to | `=A2>=100` |
| `<=` | Less than or equal to | `=A2<=100` |
| `<>` | Not equal to | `=A2<>100` |

Comparison formulas return one of two logical results:

- TRUE
- FALSE

Example:

If A2 contains 75:

```excel
=A2>=50
```

Result: TRUE.

```excel
=A2<50
```

Result: FALSE.

**Hinglish:** Excel condition check karta hai. Condition sahi hai toh TRUE, warna FALSE.

---

### 3. The IF Function

**Definition:** IF checks a condition and returns one result if the condition is TRUE and another result if it is FALSE.

Syntax:

```excel
=IF(logical_test,value_if_true,value_if_false)
```

The three arguments:

1. `logical_test`: The condition Excel must evaluate.
2. `value_if_true`: The result when the condition is TRUE.
3. `value_if_false`: The result when the condition is FALSE.

**Example:**

A company sets a sales target of ₹50,000.

Sales are stored in B2.

```excel
=IF(B2>=50000,"Target Achieved","Target Not Achieved")
```

If B2 = ₹65,000, Excel returns:

`Target Achieved`

If B2 = ₹35,000, Excel returns:

`Target Not Achieved`

Text results must be enclosed in quotation marks.

**Important:** IF can return text, numbers, cell references, or results of other calculations.

---

### 4. IF With Numerical Calculations

IF can perform different calculations depending on a condition.

**Example:**

A store gives a 10% discount when an order value is at least ₹5,000.

Order value is in B2.

```excel
=IF(B2>=5000,B2*10%,0)
```

If B2 = ₹8,000:

Discount = ₹800.

If B2 = ₹3,000:

Discount = ₹0.

This allows Excel to apply business rules automatically.

---

### 5. The AND Function

**Definition:** AND returns TRUE only when all specified conditions are TRUE.

Syntax:

```excel
=AND(condition1,condition2,...)
```

**Example:**

An employee receives a bonus only when:

- Sales are at least ₹50,000.
- Customer satisfaction is at least 90%.

```excel
=AND(B2>=50000,C2>=90%)
```

| Sales | Satisfaction | Result |
|---:|---:|---|
| ₹60,000 | 95% | TRUE |
| ₹60,000 | 85% | FALSE |
| ₹40,000 | 95% | FALSE |

Combine AND with IF:

```excel
=IF(AND(B2>=50000,C2>=90%),"Bonus Eligible","Not Eligible")
```

Both conditions must be satisfied.

**Business application:** Employee performance evaluation, loan eligibility rules, quality checks, and compliance conditions.

---

### 6. The OR Function

**Definition:** OR returns TRUE when at least one specified condition is TRUE.

Syntax:

```excel
=OR(condition1,condition2,...)
```

**Example:**

A customer receives free delivery if:

- Order value is at least ₹5,000, OR
- The customer has premium membership.

```excel
=IF(OR(B2>=5000,C2="Premium"),"Free Delivery","Delivery Charge")
```

Only one condition needs to be satisfied.

**AND vs OR**

| AND | OR |
|---|---|
| Every condition must be TRUE | At least one condition must be TRUE |
| Used when all requirements are compulsory | Used when alternative requirements are accepted |

---

### 7. Nested IF

**Definition:** Nested IF means placing one IF function inside another IF function.

It is useful when a business needs more than two classifications.

**Example:**

A company classifies monthly sales:

| Sales | Classification |
|---|---|
| ₹75,000 or above | Excellent |
| ₹50,000 or above | Good |
| Below ₹50,000 | Needs Improvement |

Formula:

```excel
=IF(B2>=75000,"Excellent",IF(B2>=50000,"Good","Needs Improvement"))
```

**How Excel evaluates it:**

1. Check whether sales are at least ₹75,000.
2. If TRUE, return Excellent.
3. If FALSE, check whether sales are at least ₹50,000.
4. If TRUE, return Good.
5. Otherwise, return Needs Improvement.

**Important:** Arrange conditions carefully.

If you check `B2>=50000` first, an employee with sales of ₹80,000 will be classified as Good. Excel will not reach the Excellent condition.

Check higher thresholds first in this example.

For more complex classification, the `IFS` function can sometimes make formulas easier to read.

---

### 8. COUNTIF Function

**Definition:** COUNTIF counts cells that satisfy a specified condition.

Syntax:

```excel
=COUNTIF(range,criteria)
```

**Example:**

| Employee | Sales |
|---|---:|
| A | 65,000 |
| B | 42,000 |
| C | 75,000 |
| D | 35,000 |
| E | 80,000 |

Question: How many employees achieved sales of at least ₹50,000?

```excel
=COUNTIF(B2:B6,">=50000")
```

Result: 3 employees.

**Business applications:**

- Count employees achieving targets.
- Count orders above a particular value.
- Count products with low inventory.
- Count transactions belonging to a category.

---

### 9. SUMIF Function

**Definition:** SUMIF adds values only when a specified condition is satisfied.

Syntax:

```excel
=SUMIF(range,criteria,sum_range)
```

Example:

| Product | Category | Revenue |
|---|---|---:|
| Laptop | Electronics | 60,000 |
| Chair | Furniture | 8,000 |
| Mobile | Electronics | 25,000 |
| Table | Furniture | 15,000 |
| Monitor | Electronics | 12,000 |

Question: What is the total revenue from Electronics?

```excel
=SUMIF(B2:B6,"Electronics",C2:C6)
```

Result: ₹97,000.

Understand the arguments:

- `B2:B6`: Where Excel checks the category.
- `"Electronics"`: The condition.
- `C2:C6`: Which values Excel adds.

**Business application:** Calculate revenue by product category, department, region, or sales representative.

---

### 10. AVERAGEIF Function

**Definition:** AVERAGEIF calculates the average of values that satisfy a specified condition.

Syntax:

```excel
=AVERAGEIF(range,criteria,average_range)
```

Using the previous example:

```excel
=AVERAGEIF(B2:B6,"Electronics",C2:C6)
```

Result: ₹32,333.33 approximately.

It calculates the average revenue of products belonging to the Electronics category.

**Business application:** Compare average sales by region, average salary by department, or average order value by customer category.

---

### 11. Comparison of Conditional Functions

| Function | Purpose | Business question |
|---|---|---|
| COUNTIF | Count matching records | How many employees achieved their target? |
| SUMIF | Add matching values | What is total Electronics revenue? |
| AVERAGEIF | Average matching values | What is average Electronics revenue? |

The important difference:

- COUNTIF measures frequency.
- SUMIF measures total value.
- AVERAGEIF measures the average value.

---

### 12. Absolute and Relative References in Conditional Formulas

Suppose a company's sales target is stored in F1.

| Employee | Sales |
|---|---:|
| A | 65,000 |
| B | 42,000 |
| C | 75,000 |

Formula in C2:

```excel
=IF(B2>=$F$1,"Achieved","Not Achieved")
```

When copied down:

- B2 changes to B3, B4, and so on.
- `$F$1` remains fixed.

Why?

`$F$1` is an absolute reference. It locks both the column and row.

This is useful when the same business target must be applied to hundreds of records.

---

### 13. Combining Multiple Business Conditions

Consider a revised company bonus policy.

An employee qualifies if:

**Rule A:**
- Sales are at least ₹75,000.
- Satisfaction is at least 90%.

OR

**Rule B:**
- Sales are at least ₹90,000, regardless of satisfaction.

Formula:

```excel
=IF(OR(AND(B2>=75000,C2>=90%),B2>=90000),"Eligible","Not Eligible")
```

**Understand the structure:**

1. AND checks whether both requirements in Rule A are satisfied.
2. OR checks whether Rule A or Rule B is satisfied.
3. IF returns the final eligibility decision.

This is an example of combining multiple levels of business logic in one formula.

---

### 14. Practical Business Application — Employee Performance Analysis

Dataset:

| Employee | Sales | Satisfaction |
|---|---:|---:|
| Aarav | 85,000 | 95% |
| Riya | 62,000 | 88% |
| Kabir | 45,000 | 92% |
| Neha | 78,000 | 96% |
| Arjun | 38,000 | 80% |
| Meera | 55,000 | 91% |
| Dev | 92,000 | 85% |
| Ananya | 48,000 | 94% |

Assume:

- Column A = Employee
- Column B = Sales
- Column C = Satisfaction

#### Task A — Performance classification

```excel
=IF(B2>=75000,"Excellent",IF(B2>=50000,"Good","Needs Improvement"))
```

#### Task B — Bonus eligibility

```excel
=IF(AND(B2>=50000,C2>=90%),"Eligible","Not Eligible")
```

#### Task C — Free delivery logic

```excel
=IF(OR(B2>=75000,C2>=95%),"Applied","Not Applied")
```

#### Task D — Conditional calculations

Count employees with sales of at least ₹50,000:

```excel
=COUNTIF(B2:B9,">=50000")
```

Total qualifying sales:

```excel
=SUMIF(B2:B9,">=50000",B2:B9)
```

Average qualifying sales:

```excel
=AVERAGEIF(B2:B9,">=50000",B2:B9)
```

#### Results

- Employees with sales of at least ₹50,000: 5
- Bonus-eligible employees: 3
- Total qualifying sales: ₹3,72,000
- Average qualifying sales: ₹74,400

#### Business interpretation

Sales performance and customer satisfaction are different performance dimensions.

For example, Dev generated the highest sales of ₹92,000, but his satisfaction score was 85%.

Management should consider both measures when evaluating employee performance.

High sales do not automatically mean excellent customer experience.

---

### 15. Common Mistakes

1. Confusing AND with OR.
2. Placing nested IF conditions in the wrong order.
3. Forgetting quotation marks around text results.
4. Forgetting quotation marks around criteria such as `">=50000"`.
5. Using relative references when a fixed target is required.
6. Comparing percentages stored as ordinary numbers with percentage-formatted values.
7. Assuming that a high sales figure always indicates strong overall performance.
8. Writing complex formulas without checking the individual conditions.

---

### 16. Professional Analyst Thinking

A data analyst should follow this sequence:

**Business Question → Identify Required Data → Define Business Rule → Select Function → Apply Formula → Validate Result → Interpret Result**

For example:

Business question: How many employees achieved their sales target?

1. Identify the sales column.
2. Define the target as ₹50,000.
3. Select COUNTIF.
4. Apply the formula.
5. Verify the result.
6. Explain what the result means for management.

The objective is not simply to produce a number. It is to produce a reliable answer to a business question.

---

## Day 5 — Quick Revision

- Comparison operators evaluate conditions.
- IF makes decisions based on TRUE or FALSE.
- AND requires every condition to be TRUE.
- OR requires at least one condition to be TRUE.
- Nested IF supports multiple classifications.
- COUNTIF counts records meeting a condition.
- SUMIF adds values meeting a condition.
- AVERAGEIF calculates the average of qualifying values.
- Absolute references keep important assumptions fixed when formulas are copied.

**Main lesson:** Conditional logic turns Excel from a calculation tool into a decision-making tool. It helps businesses apply rules consistently, analyse performance, and evaluate records at scale.