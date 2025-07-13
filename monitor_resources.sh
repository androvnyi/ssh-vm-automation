#!/bin/bash

LOG="/var/log/monitor.log"

echo "===== $(date) =====" >> $LOG
echo "[CPU & MEMORY USAGE]" >> $LOG
top -b -n 1 | head -n 10 >> $LOG
echo "" >> $LOG
echo "[DISK USAGE]" >> $LOG
df -h >> $LOG
echo "" >> $LOG
echo "[TOP MEMORY PROCESSES]" >> $LOG
ps aux --sort=-%mem | head -n 5 >> $LOG
echo -e "\n\n" >> $LOG
