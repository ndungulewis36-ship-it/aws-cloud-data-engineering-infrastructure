# Week 03 — Day 02: Variables, Environment Variables, User Input & Arguments

**Module:** 01 — Linux & Networking Foundations  
**Focus:** Local Variables, `export`, `read`, Command-Line Arguments (`$1`, `$@`), and Quoting Rules

---

## 1. Local Variables & Quoting Rules
Variables store values in memory for reuse across a script.

* **Assignment rule:** Never leave spaces around `=` (`APP_NAME="pipeline"`, NOT `APP_NAME = "pipeline"`).
* **Referencing:** Prefix with `$` or wrap in curly braces `${APP_NAME}` (required when appending text directly, e.g., `${APP_NAME}_v1.tar.gz`).
* **Command Substitution:** Store command output inside a variable using `$(command)` (e.g., `BACKUP_DATE=$(date +%Y-%m-%d)`).

### Double Quotes vs. Single Quotes
| Quote Type | Behavior | Example | Output |
| :--- | :--- | :--- | :--- |
| **Double (`"..."`)** | Expands `$variables` and `$(commands)` | `echo "Host: $HOSTNAME"` | `Host: DESKTOP-VUEEFMI` |
| **Single (`'...'`)** | Literal text only (no variable expansion) | `echo 'Host: $HOSTNAME'` | `Host: $HOSTNAME` |

---

## 2. Environment Variables (`export`)
* **Local Variable:** Exists only inside the current shell or script. Child subshells cannot access it.
* **Environment Variable:** Promoted with `export` so any child process or subshell spawned by the script inherits it.

```bash
LOCAL_PORT=5432              # Visible only in current script
export DB_ENV="production"   # Inherited by child processes and subshells
