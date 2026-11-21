# Lab 02: Filesystem Navigation & Management

## Objective
Practice traversing the top-down Linux Filesystem Hierarchy Standard, building nested directory structures, and inspecting disk utilization.

## Commands Executed
```bash
# Verify current working directory and path
pwd

# List directory contents with detailed permissions and hidden files
ls -la /etc /var /usr

# Create and inspect nested lab directories
mkdir -p lab-02-demo/nested/data
cd lab-02-demo/nested/data
pwd

# Check disk usage of the directory
du -sh .