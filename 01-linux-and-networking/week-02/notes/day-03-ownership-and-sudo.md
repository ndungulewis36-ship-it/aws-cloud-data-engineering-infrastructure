# Week 02 — Day 03: File Ownership & Privilege Escalation (`sudo`)

## 1. File Ownership (`chown` & `chgrp`)
Every file and directory in Linux is bound to an owner (`user`) and a group (`group`).
- **`chown` (Change Owner):** Modifies the user owner of a file/directory.
  - *Syntax:* `sudo chown username filename`
  - *Recursive:* `sudo chown -R username:groupname /path/to/dir`
- **`chgrp` (Change Group):** Modifies the group ownership independently.
  - *Syntax:* `sudo chgrp groupname filename`

## 2. Privilege Escalation (`sudo` & `/etc/sudoers`)
- **`sudo` (Superuser DO):** Executes a command with root (superuser) privileges based on authorized policy.
- **`/etc/sudoers`:** The master configuration file governing who can run what commands as root.
- **`visudo`:** The mandatory utility to safely edit `/etc/sudoers`. It checks for syntax errors before saving, preventing you from accidentally locking yourself out of root access.
