# Week 02 — Day 02: Linux File Permissions (Symbolic & Numeric)

## 1. The Three Permission Classes & Types
- **Classes:**
  - **u (User/Owner):** The specific user who owns the file.
  - **g (Group):** Users belonging to the file's assigned group.
  - **o (Others):** Everyone else on the system.
- **Permission Types:**
  - **r (Read):** View file contents or list directory contents (`4`).
  - **w (Write):** Modify/delete files or create files inside a directory (`2`).
  - **x (Execute):** Run a script/binary or enter/traverse a directory (`1`).

## 2. Numeric (Octal) Permission Mode
Permissions are calculated by summing the octal values for each class (`r=4`, `w=2`, `x=1`):
- `7` = `4 + 2 + 1` (Read, Write, Execute)
- `6` = `4 + 2` (Read, Write)
- `5` = `4 + 1` (Read, Execute)
- `4` = `4` (Read-only)
- `0` = No permissions

*Example:* `chmod 750 script.sh`
- **Owner (`u`):** `7` (rwx)
- **Group (`g`):** `5` (r-x)
- **Others (`o`):** `0` (---)

## 3. Symbolic Permission Mode
Modify specific classes and bits without recalculating octal numbers using `+`, `-`, or `=`:
- `chmod u+x script.sh` — Add execute permission for the owner.
- `chmod g-w,o=r config.yaml` — Remove write for group, set others to read-only.
- `chmod a+r shared.txt` — Add read permission for all classes (`ugo`).
