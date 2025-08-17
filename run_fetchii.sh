#!/bin/bash
# run_neofetch.sh (portable version)

set -euo pipefail
LOGFILE="./run_neofetch.log"

echo "==== Running Neofetch ===" tee -a "$LOGFILE"

if ! command -v git >/dev/null 2>&1; then
   echo "Error: git is not installed. Please install git first." | tee -a "$LOGFILE"
   exit 1
fi

if [ -f "./neofetch/neofetch" ]; then
   echo "Cloning Neofetch repository..." tee -a "$LOGFILE"
   if git clone --depth=1 https://github.com/dylanaraps/neofetch.git >>"$LOGFILE" 2>&1; then
       echo "Clone successful." | tee -a "$LOGFILE"
   else
       echo "Error:Failed to clone Neofetch repo." | tee -a "$LOGFILE"
       exit 1
    fi
fi

if [ -x "./neofetch/neofetch" ]; then
      ./neofetch/neofetch | tee -a "$LOGFILE"
else
   echo "Error: neofetch script not found or not ececutable." | tee -a "$LOGFILE"
   exit 1
fi
