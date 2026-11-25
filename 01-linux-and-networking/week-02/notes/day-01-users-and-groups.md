# Week 02 — Day 01: Linux Users, Groups & Account Management

## 1. User & Group Types
- **Root User (`UID 0`):** Superuser with unrestricted system access.
- **System Users (`UID 1–999`):** Non-login accounts created for background services and daemons (e.g., `www-data`, `postgres`).
- **Regular Users (`UID 1000+`):** Standard interactive accounts with home directories under `/home/<username>`.
- **Primary vs. Secondary Groups:** Every user has one primary group (assigned to newly created files) and can belong to multiple secondary/supplementary groups for shared resource access.

## 2. Core Identity & Password Configuration Files
- **`/etc/passwd`:** Stores user account metadata (`username:x:UID:GID:comment:home_dir:shell`).
- **`/etc/shadow`:** Restricted file (`root` only) storing encrypted password hashes and password aging policies.
- **`/etc/group`:** Defines groups and their secondary members (`group_name:x:GID:user_list`).

## 3. Essential Account Management Commands
- `useradd -m -s /bin/bash <user>`: Create a user with a home directory (`-m`) and default shell (`-s`).
- `passwd <user>`: Set or update a user's password.
- `groupadd <group>`: Create a new group.
- `usermod -aG <group> <user>`: Append (`-a`) a user to a secondary group (`-G`) without removing existing group memberships.
- `id <user>` / `groups <user>`: Inspect UID, GID, and group memberships.
- `userdel -r <user>`: Delete a user account and remove their home directory (`-r`).
