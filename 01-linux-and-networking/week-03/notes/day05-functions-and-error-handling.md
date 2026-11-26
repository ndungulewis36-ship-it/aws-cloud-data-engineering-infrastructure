# Week 03 — Day 05: Functions, Exit Codes, Error Handling & Debugging

**Module:** 01 — Linux & Networking Foundations  
**Focus:** Bash Functions, `local` Scope, Exit Codes (`$?`), `set -euo pipefail`, `trap`, and Debugging

---

## 1. Bash Functions & Variable Scope
Functions group reusable logic into named blocks. Arguments passed to a function use positional parameters (`$1`, `$2`, `$@`) scoped locally to that function.

```bash
log_message() {
    local LEVEL="$1"      # 'local' prevents leaking outside the function
    local MESSAGE="$2"
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [$LEVEL]$MESSAGE"
}

log_message "INFO" "Pipeline initialized"
