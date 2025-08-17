#!/bin/bash
# system_info.sh - SHow system information with error handling

echo "==== $(whoami)'s System Info ===="

if command if neofetch >/dev/null 2>&1; then
    neofetch
else
    echo "Warning: Neofetch not installed, Skipping system info..."
fi
echo
echo -e "\n ====Disk Usage===="
if df -h >/dev/null 2>&1; then
      df -h | grep '^/dev' || echo "No /dev partitions found"
else
    echo "Error: COuld not retrive disk usage."
fi
echo
echo -e "\n====Memory Usage===="
if free -h >/dev/null 2>&1; then
     free -h
else
   echo "Error: COuld not retrive memory usage."
fi
