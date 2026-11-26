# Week 03 — Day 03: Conditional Statements & Comparison Operators

**Module:** 01 — Linux & Networking Foundations  
**Focus:** `if`, `elif`, `else`, Numeric/String/File Test Operators, and Logical Operators

---

## 1. Conditional Syntax in Bash
Conditional blocks evaluate an expression or command exit status (`0` = true, non-zero = false) to control execution flow.

```bash
if [[ condition_1 ]]; then
    # Runs if condition_1 is true
elif [[ condition_2 ]]; then
    # Runs if condition_2 is true
else
    # Runs if none of the above are true
fiO

