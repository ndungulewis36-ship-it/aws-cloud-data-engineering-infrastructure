# Week 03 — Day 04: Loops (`for`, `while`, `until`) & File Automation

**Module:** 01 — Linux & Networking Foundations  
**Focus:** `for`, `while`, `until`, Loop Controls (`break`/`continue`), and Safe File Iteration

---

## 1. The `for` Loop
Iterates over a predefined list of items, numeric ranges, array elements, or file globs.

```bash
# Iterating over an explicit list or array
SERVERS=("web-01" "db-01" "etl-01")
for host in "${SERVERS[@]}"; do
    echo "Checking connectivity to $host..."
done

# Iterating over files safely
for file in /var/log/*.log; do
    [[ -e "$file" ]] || continue   # Skip if glob matches nothing
    echo "Processing $file"
done

# Numeric range & C-style syntax
for i in {1..5}; do echo "Batch $i"; done
for ((i=0; i<5; i++)); do echo "Index $i"; done
