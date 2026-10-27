#!/bin/bash
# Makhmutkhodzhaev_Farukh_system.sh
# DevOps Laboratory Work 1 — Linux system information script
# Student: Farukh Makhmutkhodzhaev, Group IT-2 2314, Student ID 37093

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
INFO_FILE="$PROJECT_ROOT/Makhmutkhodzhaev_Farukh_info.txt"

echo "=============================="
echo "Student Information"
echo "=============================="
echo ""
echo "Name: Farukh"
echo "Surname: Makhmutkhodzhaev"
echo "Group: IT-2 2314"
echo "Student ID: 37093"
echo ""
echo "=============================="
echo "System Information"
echo "=============================="
echo ""
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -s) $(uname -r)"
echo "Disk Usage:"
df -h "$PROJECT_ROOT"
echo ""
echo "Memory Usage:"
if command -v free >/dev/null 2>&1; then
    free -h
elif command -v vm_stat >/dev/null 2>&1; then
    total_mb=$(($(sysctl -n hw.memsize) / 1024 / 1024))
    page_size=$(vm_stat | awk '/page size/ {print $8}' | tr -d '.')
    free_mb=$(($(vm_stat | awk '/Pages free/ {print $3}' | tr -d '.') * ${page_size:-16384} / 1024 / 1024))
    echo "Total Memory: ${total_mb} MB"
    echo "Free Memory:  ${free_mb} MB"
else
    echo "Memory information is not available on this system"
fi
echo ""
if [ -f "$INFO_FILE" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
