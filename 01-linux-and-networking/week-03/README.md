# Week 03 — Bash Scripting & System Automation (Complete Notes)

**Module:** 01 — Linux & Networking Foundations  
**Topics:** Shebangs & Execution, Variables & Arguments, Conditionals, Loops, Functions & Error Handling, and `cron` Scheduling

---

## Day 01 — Bash Fundamentals & Script Execution
* **Shebang (`#!/usr/bin/env bash`):** Placed on line 1 to instruct the kernel which interpreter executes the script. Using `/usr/bin/env bash` ensures portability across different Linux distributions.
* **Permissions & Execution:**
  * `chmod u+x script.sh` — Grants execute permission to the file owner.
  * `./script.sh` — Executes the script in a child subshell.
  * `source script.sh` (or `. script.sh`) — Runs the script inside the **current** shell session (variables persist after completion).

---

## Day 02 — Variables, Environment Variables, Input & Arguments
* **Local Variables:** Assigned with no spaces around `=` (`APP="etl"`). Referenced via `$APP` or `${APP}`.
* **Command Substitution:** Captures command output into a variable using `$(command)` (e.g., `TODAY=$(date +%Y-%m-%d)`).
* **Quoting Rules:**
  * Double quotes (`"$VAR"`) expand variables and command substitutions.
  * Single quotes (`'$VAR'`) preserve literal characters without expansion.
* **Environment Variables (`export`):** Promotes a variable (`export ENV="prod"`) so child processes and subshells inherit it.
* **User Input (`read`):**
  * `read -p "Prompt: " VAR` — Prompts interactively and stores input.
  * `read -s -p "Secret: " PASS` — Hides typed characters for sensitive credentials.
* **Positional Arguments:**
  * `$0` — Script name.
  * `$1`, `$2`, ... — 1st, 2nd, ... arguments passed on the CLI.
  * `$#` — Total number of arguments.
  * `$@` — All arguments preserved as separate quoted strings.

---

## Day 03 — Conditional Statements & Comparison Operators
```bash
if [[ condition_1 ]]; then
    # commands
elif [[ condition_2 ]]; then
    # commands
else
    # fallback commands
fi

---

## Day 04 — Loops (`for`, `while`, `until`) & File Automation
* **`for` Loop (Lists, Ranges & Files):**
  ```bash
  for file in /var/log/*.log; do
      [[ -f "$file" ]] || continue
      gzip -c "$file" > "${file}.gz"
  done
