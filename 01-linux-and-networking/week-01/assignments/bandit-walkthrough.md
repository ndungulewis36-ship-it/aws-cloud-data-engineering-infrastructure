# OverTheWire Bandit: Week 1 Assignments (Levels 0 to 8)

Documentation of the OverTheWire Bandit wargame assignments, covering SSH connections, Linux file navigation, permissions, searching, and text processing.

---

## Assignment 0: Level 0 → Level 1
- **Level Goal:** The password for the next level is stored in a file called `readme` located in the home directory. Use this password to log into `bandit1` using SSH.
- **Commands Needed:** `ls`, `cd`, `cat`, `file`, `du`, `find`
- **Commands Used:**
  ```bash
  ssh bandit0@bandit.labs.overthewire.org -p 2220
  cat readme

## Level 1 → Level 2
- **Level Goal:** The password for the next level is stored in a file called `-` located in the home directory.
- **Commands Needed:** `ls`, `cd`, `cat`, `file`, `du`, `find`
- **Commands Used:**
  ```bash
  cat ./-

## Level 2 → Level 3
- **Level Goal:** The password for the next level is stored in a file called `spaces in this filename` located in the home directory.
- **Commands Needed:** `ls`, `cd`, `cat`, `file`, `du`, `find`
- **Commands Used:**
  ```bash
  cat "spaces in this filename"

---

## Level 3 → Level 4
- **Level Goal:** The password for the next level is stored in a hidden file in the `inhere` directory.
- **Commands Needed:** `ls`, `cd`, `cat`, `file`, `du`, `find`
- **Commands Used:**
  ```bash
  cd inhere
  ls -la
  cat .hidden

## Level 4 → Level 5
- **Level Goal:** The password for the next level is stored in the only human-readable file in the `inhere` directory.
- **Commands Needed:** `ls`, `cd`, `cat`, `file`, `du`, `find`
- **Commands Used:**
  ```bash
  cd inhere
  file ./-*
  cat ./-file07

 ## Level 6 → Level 7
- **Level Goal:** The password for the next level is stored somewhere on the server and has all of the following properties:
  - Owned by user `bandit7`
  - Owned by group `bandit6`
  - 33 bytes in size
- **Commands Needed:** `ls`, `cd`, `cat`, `file`, `du`, `find`, `grep`
- **Commands Used:**
  ```bash
  find / -user bandit7 -group bandit6 -size 33c 2>/dev/null
  cat /var/lib/dpkg/info/bandit7.password

  ## Level 7 → Level 8
- **Level Goal:** The password for the next level is stored in the file `data.txt` next to the word `millionth`.
- **Commands Needed:** `man`, `grep`, `sort`, `uniq`, `strings`, `base64`, `tr`, `tar`, `gzip`, `bzip2`, `xxd`
- **Commands Used:**
  ```bash
  grep "millionth" data.txt

 