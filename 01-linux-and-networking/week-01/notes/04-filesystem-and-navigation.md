# 04. Linux Filesystem and Navigation

## 1. The Linux Filesystem Hierarchy
In Linux, files and directories are organized in a single top-down hierarchical tree starting at the root (`/`).

| Directory | Purpose |
| :--- | :--- |
| `/` | **Root directory:** The absolute top of the entire Linux filesystem hierarchy. |
| `/home` | **User directories:** Home folders for standard system users (accessible via `~`). |
| `/etc` | **System configuration:** Host-wide configuration files and settings. |
| `/var` | **Variable data:** System logs, caches, and spool files (e.g., `/var/log`). |
| `/tmp` | **Temporary files:** Transient storage cleared across system reboots. |
| `/usr` | **User applications:** Read-only utilities, shared libraries, and application binaries. |
| `/opt` | **Optional software:** Third-party standalone application packages. |

---

## 2. Core Navigation Commands
- **`pwd` (Print Working Directory):** Prints the absolute path of your current working directory.
- **`cd` (Change Directory):** Switches your working directory.
  - `cd /` — Jump straight to the root directory.
  - `cd ~` — Jump directly to your user home directory.
  - `cd ..` — Move up one level to the parent directory.
- **`ls` (List):** Lists contents of a directory.
  - `ls -l` — Detailed long-listing format (permissions, owner, size, date).
  - `ls -a` — Show all files, including hidden files starting with a dot (`.`).
  - `ls -lah` — Combined flags for human-readable, detailed viewing of all items.

---

## 3. File Creation, Inspection & Management
- **`mkdir` (Make Directory):** Creates new directories (use `-p` to create nested parent directories automatically).
- **`touch`:** Creates an empty file or updates an existing file's timestamp.
- **`cp` (Copy):** Copies files or directories from a source to a destination.
- **`mv` (Move/Rename):** Moves files or renames them.
- **`cat`:** Concatenates and prints file contents directly to the terminal output.
- **`less`:** Opens a file in an interactive, scrollable view for reading long documents.

---

## 4. Search & Filtering Tools
- **`find`:** Searches for files across the filesystem hierarchy based on name, type, or size.
  - Example: `find ~ -name "*.txt"`
- **`grep`:** Searches for matching text patterns inside files.
  - Example: `grep "Linux" notes.txt`

---

## 5. Lab Practice: Project Directory Structure
Structure your local repository workspace using these commands:

```bash
mkdir -p infrastructure-lab/{linux,networking,scripts,documentation,logs,projects}
cd infrastructure-lab/linux
echo "Linux filesystem navigation lab" > notes.txt
cp notes.txt backup.txt
mv backup.txt archive.txt
cat notes.txt
cd ~/aws-cloud-data-engineering-infrastructure/01-linux-and-netwogit add 04-filesystem-and-navigation.md
git commit -m "Week 01: Add filesystem and navigation notes"
git pushgit add 04-filesystem-and-navigation.md
git commit -m "Week 01: Add filesystem and navigation notes"
git pushgit add 04-filesystem-and-navigation.md
git commit -m "Week 01: Add filesystem and navigation notes"
git push
cd ~/aws-cloud-data-engineering-infrastructure/01-linux-and-networking/week-01/notes

# 1. Overwrite the file cleanly with the correct contents
cat << 'EOF' > 04-filesystem-and-navigation.md
# 04. Linux Filesystem and Navigation

## 1. The Linux Filesystem Hierarchy
In Linux, files and directories are organized in a single top-down hierarchical tree starting at the root (`/`). 

| Directory | Purpose |
| :--- | :--- |
| `/` | **Root directory:** The absolute top of the entire Linux filesystem hierarchy. |
| `/home` | **User directories:** Home folders for standard system users (accessible via `~`). |
| `/etc` | **System configuration:** Host-wide configuration files and settings. |
| `/var` | **Variable data:** System logs, caches, and spool files (e.g., `/var/log`). |
| `/tmp` | **Temporary files:** Transient storage cleared across system reboots. |
| `/usr` | **User applications:** Read-only utilities, shared libraries, and application binaries. |
| `/opt` | **Optional software:** Third-party standalone application packages. |

---

## 2. Core Navigation Commands
- **`pwd` (Print Working Directory):** Prints the absolute path of your current working directory.
- **`cd` (Change Directory):** Switches your working directory.
  - `cd /` — Jump straight to the root directory.
  - `cd ~` — Jump directly to your user home directory.
  - `cd ..` — Move up one level to the parent directory.
- **`ls` (List):** Lists contents of a directory.
  - `ls -l` — Detailed long-listing format (permissions, owner, size, date).
  - `ls -a` — Show all files, including hidden files starting with a dot (`.`).
  - `ls -lah` — Combined flags for human-readable, detailed viewing of all items.

---

## 3. File Creation, Inspection & Management
- **`mkdir` (Make Directory):** Creates new directories (use `-p` to create nested parent directories automatically).
- **`touch`:** Creates an empty file or updates an existing file's timestamp.
- **`cp` (Copy):** Copies files or directories from a source to a destination.
- **`mv` (Move/Rename):** Moves files or renames them.
- **`cat`:** Concatenates and prints file contents directly to the terminal output.
- **`less`:** Opens a file in an interactive, scrollable view for reading long documents.

---

## 4. Search & Filtering Tools
- **`find`:** Searches for files across the filesystem hierarchy based on name, type, or size.
  - Example: `find ~ -name "*.txt"`
- **`grep`:** Searches for matching text patterns inside files.
  - Example: `grep "Linux" notes.txt`
