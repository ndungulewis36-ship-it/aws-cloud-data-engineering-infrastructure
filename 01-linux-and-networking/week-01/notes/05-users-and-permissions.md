# 05. Users, Groups, and Permissions

## 1. User and Group Management
- **UID / GID:** Every user has a unique User ID (UID) and Group ID (GID) for system identification.
- **`/etc/passwd`:** Contains core user account information (username, password placeholder, UID, GID, home directory, default shell).
- **`/etc/group`:** Defines system groups and lists their respective members.

## 2. Linux Permission Model
Every file and directory is governed by three permission classes and three access types:
- **Classes:** Owner (`u`), Group (`g`), and Others (`o`).
- **Types:** Read (`r = 4`), Write (`w = 2`), and Execute (`x = 1`).

## 3. Permission & Ownership Commands
- **`chmod`:** Changes file access permissions using octal mode (e.g., `chmod 600 file.txt`) or symbolic mode (e.g., `chmod u+x script.sh`).
- **`chown`:** Changes the user and group ownership of a file or directory (e.g., `sudo chown user:group file.txt`).
