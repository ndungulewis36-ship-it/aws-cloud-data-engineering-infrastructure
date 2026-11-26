# Week 03 — Day 01: Bash Fundamentals, Shell Scripts & Shebangs

**Module:** 01 — Linux & Networking Foundations  
**Focus:** Shell Scripting Basics, Shebang (`#!`), Permissions, and Execution Methods

---

## 1. What is a Shell Script?
A **shell script** is a plain-text file containing a sequence of Linux commands that are read and executed sequentially from top to bottom by a command-line interpreter—most commonly **Bash** (*Bourne Again SHell*).

* **Purpose:** Automates repetitive system administration tasks, file operations, backups, and environment setups.
* **Comments:** Any line starting with `#` (except the shebang on line 1) is ignored by the shell and used for documentation.

---

## 2. The Shebang (`#!`)
The **shebang** (`#!`) is a special character sequence placed at the very top of a script (**Line 1, Column 1** with no leading spaces) that tells the Linux kernel which interpreter to use to execute the file.

### Common Shebangs
* `#!/bin/bash` — Points directly to the Bash binary in `/bin/bash`.
* `#!/usr/bin/env bash` — Searches the user's `$PATH` environment variable to locate `bash`. This is preferred for portability across different Linux distributions and Unix-like systems.

> **Rule:** If `#!` is not on the first line, the kernel treats it as a standard comment and executes the script using the default system shell (`/bin/sh`).

---

## 3. Script Permissions (`chmod`)
By default, newly created text files have read/write permissions (`-rw-r--r--`) and cannot be executed directly. You must grant execute (`x`) permissions before running a script as a standalone program.

```bash
# Grant execute permission to the file owner
chmod u+x script.sh

# Grant execute permission to everyone
chmod +x script.sh
