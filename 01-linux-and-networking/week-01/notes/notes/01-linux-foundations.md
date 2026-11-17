# 01. Linux History & Core Architecture

## 1. Predecessors: UNIX & C (1969+)
- **Origins:** Developed at Bell Laboratories in 1969 by Ken Thompson and Dennis Ritchie.
- **Portability:** Rewriting UNIX in the **C programming language** decoupled the OS from specific hardware, making it portable across different systems and driving widespread adoption.

## 2. The GNU Project & GPL (1983–1989)
- **Mission:** Announced by Richard Stallman in September 1983 (development started January 1984), GNU (*"GNU's Not UNIX"*) aimed to build a completely free, open-source UNIX-like OS.
- **Licensing & Tools:** Produced essential system utilities and published **GNU General Public License (GPL) v1** in February 1989.
- **Missing Piece:** GNU lacked a production-ready kernel—its own kernel (**GNU Hurd**) was unfinished when Linux emerged.

## 3. Role of the Operating System Kernel
- Acts as the core bridge between **hardware** and **software**.
- Directly manages critical system resources:
  - **CPU** scheduling and execution
  - **Memory** allocation
  - **Peripheral devices** (storage, network interfaces, I/O)

## 4. Birth of Linux & GNU/Linux (1991–1992)
- **Creation:** In 1991, Finnish student **Linus Torvalds** began developing the Linux kernel as a personal project.
- **GNU/Linux:** Releasing Linux under the **GNU GPL in 1992** allowed it to be paired with the existing GNU system utilities to form a complete, free operating system (**GNU/Linux**).