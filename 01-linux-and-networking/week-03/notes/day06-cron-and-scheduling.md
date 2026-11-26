# Week 03 — Day 06: Cron Jobs, Crontab Syntax, Scheduling & Logging

**Module:** 01 — Linux & Networking Foundations  
**Focus:** `cron` Daemon, 5-Field Crontab Syntax, Special Macros, PATH Gotchas, and Log Redirection

---

## 1. What is `cron`?
`cron` is a background Linux daemon (`crond` / `cron`) that wakes up every minute to check scheduled tasks—called **cron jobs**—and executes them automatically at specified times.

### Essential `crontab` Commands
* `crontab -l` — List your current user's scheduled cron jobs.
* `crontab -e` — Edit your crontab file in your default editor (`nano` or `vim`).
* `crontab -r` — Remove your entire crontab (use with caution).

---

## 2. Crontab 5-Field Time Syntax
Every cron entry follows five time-and-date fields followed by the command or script path:

```text
┌───────────── minute (0 - 59)
│ ┌───────────── hour (0 - 23)
│ │ ┌───────────── day of the month (1 - 31)
│ │ │ ┌───────────── month (1 - 12)
│ │ │ │ ┌───────────── day of the week (0 - 6) (Sunday = 0 or 7)
│ │ │ │ │
* * * * *  /absolute/path/to/script.sh
