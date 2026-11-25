# Lab 04 — Process Control, Jobs & Signals

```bash
sleep 120 &
jobs
sleep 200 &
JOB_ID=$!
echo "Running background sleep with PID $JOB_ID"
ps aux | grep sleep
kill -15 "$JOB_ID"
ps aux | grep sleep
```
