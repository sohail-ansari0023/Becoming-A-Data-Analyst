# Week 2 — Day 04 Assessment
## Cell References: Relative, Absolute and Mixed

**Total Marks:** 100  
**Suggested Time:** 60–75 minutes  
**Difficulty:** Beginner to Intermediate  
**Assessment Type:** Theory + Formula Application + Business Analysis

---

## Section A — Conceptual Understanding (20 Marks)

**Q1. (5 Marks)** Explain the difference between Relative, Absolute and Mixed Cell References. Give one practical business example of each.

**Q2. (5 Marks)** Why does Excel automatically adjust relative references when a formula is copied? Explain using the concept of relative position.

**Q3. (5 Marks)** Explain the difference between `$A1` and `A$1`. When would each reference type be useful?

**Q4. (5 Marks)** Does an absolute reference lock the value stored in a cell or the cell's reference position? Explain your answer.

---

## Section B — Formula Prediction (25 Marks)

Suppose cell C2 contains the following formula:

`=A2*$B$1`

Predict the formula after copying it to the following destinations.

**Q5. (5 Marks)** Copy the formula from C2 to C3.

**Q6. (5 Marks)** Copy the formula from C2 to D2.

**Q7. (5 Marks)** Copy the formula from C2 to D3.

**Q8. (5 Marks)** Copy the formula from C2 to B2.

**Q9. (5 Marks)** Suppose cell C2 contains:

`=$A2+B$1`

What will the formula become when copied to D3?

---

## Section C — Practical Business Calculations (35 Marks)

### Business Scenario: Retail Sales Company

A retail company wants to calculate revenue, GST, commission and discounts for its transactions.

The company provides the following dataset:

| Product | Quantity | Unit Price |
|---|---:|---:|
| Laptop | 3 | 40000 |
| Monitor | 5 | 12000 |
| Mouse | 10 | 500 |
| Keyboard | 6 | 1500 |
| Printer | 2 | 18000 |

The company's calculation parameters are:

- GST Rate: 18%
- Commission Rate: 4%
- Discount Rate: 5%

**Q10. (5 Marks)** Write an Excel formula using relative references to calculate Revenue.

**Q11. (5 Marks)** The GST rate is stored in cell H1. Write a formula to calculate GST Amount using an absolute reference.

**Q12. (5 Marks)** The commission rate is stored in cell H2. Write a formula to calculate Commission using an absolute reference.

**Q13. (5 Marks)** The company changes its commission rate from 4% to 6%.

Explain how the existing commission calculations will respond if they reference cell H2 using an absolute reference.

**Q14. (5 Marks)** The discount rate is stored in cell H3. Write a formula to calculate the Discount Amount using an absolute reference.

**Q15. (10 Marks)** Create a two-dimensional commission calculation matrix.

Requirements:

- Revenue values are placed vertically in A10:A13.
- Commission rates are placed horizontally in B9:D9.
- Commission rates are 3%, 5% and 7%.

Write the formula for cell B10 using mixed references so that it can be copied horizontally and vertically.

---

## Section D — Analytical Thinking and Error Diagnosis (20 Marks)

**Q16. (5 Marks)** A student enters the following formula:

`=A2*B2`

The formula is copied down across multiple sales transactions.

Explain why relative references are appropriate for this calculation.

**Q17. (5 Marks)** A finance analyst enters:

`=B2*F1`

Cell F1 contains a fixed tax rate.

After dragging the formula down, the results become incorrect.

Identify the problem and provide the corrected formula.

**Q18. (5 Marks)** A student uses `$A$1` in every formula, even when the referenced cells should change according to the formula's position.

Explain why this is a poor approach.

**Q19. (5 Marks)** A business has 500 products and wants to calculate prices under three different discount rates.

Explain why Mixed Cell References can be useful for this task.

---

## Assessment Submission Guidelines

1. Attempt every question.
2. Provide actual Excel formulas wherever required.
3. Explain your reasoning instead of simply writing definitions.
4. For formula-prediction questions, show the complete adjusted formula.
5. For business scenarios, explain why the selected reference type is appropriate.

## Evaluation Criteria

| Evaluation Area | Marks |
|---|---:|
| Conceptual Understanding | 20 |
| Formula Prediction | 25 |
| Practical Business Calculations | 35 |
| Analytical Thinking | 20 |
| **Total** | **100** |

**Performance Benchmark:**

- 90–100: Excellent understanding.
- 85–89: Strong understanding; minor refinements needed.
- 70–84: Good foundation; revisit weaker concepts.
- 60–69: Developing understanding.
- Below 60: Revisit the relevant theory and practical exercises.

**End of Day 04 Assessment**