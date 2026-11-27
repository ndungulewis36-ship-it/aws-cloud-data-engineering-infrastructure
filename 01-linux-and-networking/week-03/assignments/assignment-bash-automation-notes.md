# Assignment: Bash Scripting & System Administration

## 1. Strict Error Handling (`set -euo pipefail`)
Placed at the top of production Bash scripts to enforce fail-fast behavior rather than continuing with corrupted state.

* **`set -e` (`errexit`):** Exits immediately if any command returns a non-zero exit status.
* **`set -u` (`nounset`):** Treats unset variables as an error and exits immediately, preventing accidental operations on empty paths (e.g., `rm -rf "$UNSET_VAR/"`).
* **`set -o pipefail`:** Causes a pipeline (`cmd1 | cmd2`) to fail if *any* command in the pipe fails, rather than only checking the exit status of the final command.
* **Bypassing intentionally:** Append `|| true` to commands where a non-zero exit is acceptable (e.g., `grep` finding zero matches).

---

## 2. Parameter Expansion (`${VAR:-default}`)
Allows safe variable manipulation and fallback defaults without spawning external subshells.

| Syntax | Behavior | Example |
| :--- | :--- | :--- |
| `${1:-./workspace}` | Uses `$1` if set and non-empty; otherwise falls back to `./workspace`. | `BASE_DIR="${1:-./workspace}"` |
| `${VAR:=default}` | Assigns `default` to `VAR` if unset/empty, then evaluates to it. | `: "${ENV:=dev}"` |
| `${VAR:?error_msg}` | Exits with `error_msg` if `VAR` is unset or empty. | `TARGET="${1:?Missing target path}"` |

---

## 3. Archiving & Compression (`tar`)
Bundles directory trees into single archive files while preserving file permissions and timestamps.

* **Core syntax:** `tar -czf archive.tar.gz -C /parent/dir target_folder`
* **Flags:**
  * `-c`: Create a new archive.
  * `-z`: Compress the archive using `gzip`.
  * `-f`: Specify the output archive filename (must come immediately before the filename).
  * `-C`: Change to the specified directory before archiving so full leading paths are stripped from the archive structure.

---

## 4. File Search & Retention Cleanup (`find`)
Recursively searches directory trees by metadata (name, type, age, permissions) and executes batch actions.

* **Core syntax:** `find /path/to/backups -name "backup_*.tar.gz" -type f -mtime +7 -print -delete`
* **Key predicates & actions:**
  * `-type f`: Match regular files only (ignores directories).
  * `-name "pattern"`: Match filenames using shell globs (quote patterns to prevent premature shell expansion).
  * `-mtime +7`: Match files modified strictly more than 7 × 24 hours ago.
  * `-print -delete`: Prints matched paths to `stdout` (useful for counting via `| wc -l`) before deleting them.

---

## 5. Text Filtering & Log Parsing (`grep`)
Searches input streams or files for lines matching plain text or regular expressions.

* **Core syntax:** `grep -iE "error|fail" /var/log/syslog`
* **Flags:**
  * `-i`: Case-insensitive matching (`Error`, `ERROR`, `error`).
  * `-E`: Extended Regular Expressions (enables alternation with `|` without escaping).
  * `-c`: Outputs only the count of matching lines rather than the lines themselves.
* **Exit status note:** Returns `0` if matches exist, `1` if no matches exist, and `2` on file/syntax errors.

---

## 6. I/O Streams & Redirection
Controls where standard output (`stdout`, file descriptor `1`) and standard error (`stderr`, file descriptor `2`) are routed.

* **`>` (Overwrite):** Redirects `stdout` to a file, truncating existing content.
* **`>>` (Append):** Redirects `stdout` to the end of a file without overwriting.
* **`>&2` (Route to stderr):** Sends error messages to `stderr` so they remain visible even if `stdout` is redirected to a log file (`echo "Error" >&2`).
* **`{ cmd1; cmd2; } > file` (Command grouping):** Executes multiple commands in the current shell and opens the target file descriptor once for the entire block, improving I/O efficiency.
