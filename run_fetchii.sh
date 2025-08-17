#!/bin/bash
# run_neofetch.sh (portable version with logging)

set -euo pipefail
LOGFILE="./run_fetchii.log"

echo "==== Running Neofetch ===" | tee -a "$LOGFILE"

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
