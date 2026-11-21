# Lab 03: Users, Groups, and Permissions

## Objective
Practice inspecting user environments, managing file permissions using numeric and symbolic modes, and altering ownership as outlined in `05-users-and-permissions.md`.

## Commands Executed
```bash
# Check current user and identity details
whoami
id

# Inspect system user and group configuration files
tail -n 5 /etc/passwd
tail -n 5 /etc/group

# Create a sample test file and view default permissions
echo "Secret infrastructure config" > config.txt
ls -l config.txt

# Modify permissions using numeric mode (owner read/write, others none)
chmod 600 config.txt
ls -l config.txt

# Modify permissions using symbolic mode (add execute for user)
chmod u+x config.txt
ls -l config.txt