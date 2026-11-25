# Week 02 — Day 04: Process Control, Jobs & Signals

## 1. Foreground vs. Background Execution
- **Foreground (`fg`):** Default execution state where a process occupies the terminal and blocks further command input until it finishes or is interrupted.
- **Background (`&`):** Appending `&` to a command runs it immediately in the background, freeing the shell for new inputs (e.g., `sleep 300 &`).
- **Job Control Commands:**
  - `jobs`: List all active jobs spawned by the current terminal session with their job numbers (e.g., `[1]+ Running`).
  - `Ctrl + Z`: Pause/suspend the current foreground process and send it to the background in a *Stopped* state.
  - `bg %N`: Resume a stopped job in the background.
  - `fg %N`: Bring a background or suspended job back to the foreground.

## 2. Signals & Process Termination (`kill`)
Processes communicate via signals. The `kill` command sends specific signals to a process by its Process ID (`PID`).
- **`SIGTERM` (Signal 15 / default):** Gracefully asks a process to terminate, allowing it to save state, close file handles, and exit cleanly.
- **`SIGKILL` (Signal 9):** Forcefully terminates a process immediately via the kernel. The process cannot catch, ignore, or clean up before dying.
- **`SIGHUP` (Signal 1):** Hangup signal, often used to reload configuration files without restarting a service.
