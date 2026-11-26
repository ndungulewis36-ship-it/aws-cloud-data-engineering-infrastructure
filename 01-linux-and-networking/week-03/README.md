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

## Day 04 — Loops (for, while, until) & File Automation

for Loop (Lists, Ranges & Files):

```bash
for file in /var/log/*.log; do
    [[ -f "$file" ]] || continue
    gzip -c "$file" > "${file}.gz"
done
while Loop (Safe Line-by-Line Reading):

Bash
while IFS= read -r line; do
    echo "Processing: $line"
done < targets.txt
until Loop (Polling Until Condition Becomes True):

Bash
until [[ -f "/tmp/job.done" ]]; do
    sleep 2
done
Loop Controls: continue skips to the next iteration; break exits the loop immediately.

## Day 05 — Functions, Exit Codes, Strict Error Handling & Debugging
Functions & Local Scope:

```bash
log_info() {
    local MSG="$1"
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [INFO] $MSG"
}
Exit Codes ($?): 0 indicates success; 1–255 indicates an error. Use return inside functions and exit to terminate scripts.

Strict Error Handling (set -euo pipefail):

set -e — Exit immediately when any command fails.

set -u — Treat unset variables as errors.

set -o pipefail — Fail a pipeline if any command in the pipe fails.

Cleanup Traps (trap):

Bash
trap 'rm -f /tmp/pipeline.lock' EXIT
Debugging: Run bash -n script.sh to check syntax without executing, or bash -x script.sh to trace every expanded command.

## Day 06 — Cron Jobs, Crontab Syntax & Logging

Crontab Commands: crontab -l (list), crontab -e (edit), crontab -r (remove).

5-Field Schedule Format:

Plaintext
* * * * *  /absolute/path/to/script.sh >> /var/log/job.log 2>&1
│ │ │ │ │
│ │ │ │ └── Day of week (0–6, Sunday = 0 or 7)
│ │ │ └──── Month (1–12)
│ │ └────── Day of month (1–31)
│ └──────── Hour (0–23)
└────────── Minute (0–59)
Shorthand Macros: @reboot, @hourly, @daily, @weekly.

Production Rules: Always use absolute paths (cron uses a minimal /usr/bin:/bin $PATH) and redirect both stdout and stderr (>> file.log 2>&1) for auditing.