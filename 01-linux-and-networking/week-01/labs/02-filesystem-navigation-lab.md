# Lab 02: Linux Filesystem Navigation & Management

## Objective
Practice applying root directory navigation, directory creation hierarchy, file manipulation, and search utilities.

## Commands Executed
```bash
mkdir -p infrastructure-lab/{linux,networking,scripts,documentation,logs,projects}
cd infrastructure-lab/linux
pwd
echo "Linux Filesystem Lab" > notes.txt
cp notes.txt backup.txt
mv backup.txt archive.txt
cat notes.txt
find ~ -name "*.txt"
grep "Filesystem" notes.txt
```
