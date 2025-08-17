#!/bin/bash
# run_neofetch.sh (portable version with logging)

set -euo pipefail
LOGFILE="./run_fetchii.log"

echo  -e "\n==== $(whoami)'s System Info ===="

echo -e "\n********************************"

echo "==== Running Neofetch ====" | tee -a "$LOGFILE"

# Check git
if ! command -v git >/dev/null 2>&1; then
   echo "Error: git is not installed. Please install git first." | tee -a "$LOGFILE"
   exit 1
fi

# Cloning
if [ ! -d "./neofetch" ]; then
   echo "Cloning Neofetch repository..." | tee -a "$LOGFILE"
   if git clone --depth=1 https://github.com/dylanaraps/neofetch.git >>"$LOGFILE" 2>&1; then
       echo "Clone successful." | tee -a "$LOGFILE"
   else
       echo "Error:Failed to clone Neofetch repo." | tee -a "$LOGFILE"
       exit 1
    fi
else
   echo "Neofetch repo already exists. Skipping clone." | tee -a "$LOGFILE"
fi

# Run neofetch  if executable
if [ -x "./neofetch/neofetch" ]; then
      ./neofetch/neofetch | tee -a "$LOGFILE"
else
   echo "Error: neofetch script not found or not ececutable." | tee -a "$LOGFILE"
   exit 1
fi

# Custom System Info
echo " " | tee -a "$LOGFILE"
echo -e "\n==== Date & Uptime ====" 
echo "Date: $(date)"
echo "Uptime: $(uptime -p)"

# Disk usage
echo -e "\n=====Disk Usage====" 
if command -v df -f >/dev/null 2>&1; then
       df -h | grep "/dev/" || echo "No /dev partitions found" | tee -a "$LOGFILE"
else
   echo "Error: Could not retrive disk usage." | tee -a "$LOGFILE"
fi

echo
echo -e "\n====Memory Usage====" | tee -a "$LOGFILE"
if command -v free -h >/dev/null 2>&1; then 
       free -h  | tee -a "$LOGFILE"
else
   echo "Error: Could not retrive memory usage" | tee -a "$LOGFILE"
fi
