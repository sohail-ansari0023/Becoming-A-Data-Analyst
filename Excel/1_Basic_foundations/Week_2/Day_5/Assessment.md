# Week 2 — Day 05 Assessment
## Named Ranges in Microsoft Excel

**Total Marks:** 100  
**Suggested Time:** 60–75 minutes

---

## Section A — Conceptual Understanding (20 Marks)

**Q1. (5 Marks)** Define Named Ranges. Explain why they are useful when working with large Excel workbooks.

**Q2. (5 Marks)** Differentiate between a single-cell Named Range and a multi-cell Named Range. Give one example of each.

**Q3. (5 Marks)** Explain the difference between Workbook Scope and Worksheet Scope. Provide a practical business example of each.

**Q4. (5 Marks)** Explain the difference between Named Ranges and Absolute Cell References. Why might an analyst prefer Named Ranges in a financial model?

---

## Section B — Formula Application (25 Marks)

Suppose the following Named Ranges have been created:

| Named Range | Refers To | Value |
|---|---|---:|
| Selling_Price | B2 | 50,000 |
| GST_Rate | B3 | 18% |
| Commission_Rate | B4 | 5% |
| Discount_Rate | B5 | 10% |
| Sales_Data | D2:D6 | Sales values |

**Q5. (5 Marks)** Write an Excel formula to calculate GST Amount using the Named Ranges.

**Q6. (5 Marks)** Write an Excel formula to calculate Commission Amount.

**Q7. (5 Marks)** Write an Excel formula to calculate Discount Amount.

**Q8. (5 Marks)** Write an Excel formula to calculate the total sales using the `Sales_Data` Named Range.

**Q9. (5 Marks)** The GST rate changes from 18% to 20%. Explain what happens to formulas that use `GST_Rate`, assuming the name still refers to cell B3.

---

## Section C — Practical Excel Operations (35 Marks)

### Business Scenario: Retail Sales Company

A retail company maintains the following worksheet:

| Product | Quantity | Unit Price |
|---|---:|---:|
| Laptop | 3 | 40000 |
| Monitor | 5 | 12000 |
| Mouse | 10 | 500 |
| Keyboard | 6 | 1500 |
| Printer | 2 | 18000 |

**Q10. (5 Marks)** Create a Named Range called `Product_List` referring to A2:A6 using the Name Box.

**Q11. (5 Marks)** Create a Named Range called `Unit_Prices` referring to C2:C6 using the Define Name option.

**Q12. (5 Marks)** Create a Named Range called `GST_Rate` referring to a cell containing 18%. Set its scope to Workbook.

**Q13. (5 Marks)** Open Name Manager and identify the following information for `GST_Rate`:

- Name
- Scope
- Refers To
- Value

**Q14. (5 Marks)** Edit the comment of `GST_Rate` to:

`GST rate used for retail sales calculations`

**Q15. (10 Marks)** Assume the company adds a new product in row 7.

The original `Product_List` refers to A2:A6.

Explain:

1. Whether the new product will automatically become part of the original Named Range.
2. Why this could create an incomplete calculation.
3. How an Excel Table could help solve this problem.

---

## Section D — Analytical Thinking and Error Diagnosis (20 Marks)

**Q16. (5 Marks)** A company has 10 worksheets, and each worksheet calculates GST using the same rate.

Explain why a workbook-scoped Named Range would be useful.

**Q17. (5 Marks)** An analyst deletes the Named Range `GST_Rate` from Name Manager. However, the actual value of 18% remains in cell B3.

Some formulas that previously used `GST_Rate` now display `#NAME?`.

Explain why this happens and how the analyst can correct the problem.

**Q18. (5 Marks)** A company uses the following formula:

`=SUM(A2:A100)`

The analyst replaces it with:

`=SUM(Sales_Data)`

Explain the advantages and potential limitations of the second formula.

**Q19. (5 Marks)** A business maintains GST, commission and discount assumptions across several worksheets.

Recommend an appropriate approach for managing these assumptions. Explain your reasoning, including the role of Named Ranges and Excel Tables.

---

## Assessment Submission Guidelines

1. Attempt all questions.
2. Write formulas exactly as they would appear in Excel.
3. Explain the logic behind your answers.
4. For practical questions, perform the operations in Excel and report the results.
5. For analytical questions, focus on business reasoning rather than memorised definitions.

## Evaluation Criteria

| Section | Marks |
|---|---:|
| A — Conceptual Understanding | 20 |
| B — Formula Application | 25 |
| C — Practical Excel Operations | 35 |
| D — Analytical Thinking | 20 |
| **Total** | **100** |

### Performance Benchmark

- 90–100: Excellent understanding
- 85–89: Strong understanding
- 70–84: Good foundation
- 60–69: Developing understanding
- Below 60: Revisit the relevant concepts and practical exercises

**End of Day 05 Assessment**