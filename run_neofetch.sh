#!/bin/bash
# run_neofetch.sh

# Checking if neofetch is installed
if ! command -v neofetch &> /dev/null
then
   echo "Neofetch is not installed. Installing......"
   sudo apt update && sudo apt install neofetch -y

   echo "If the installation faild, directly clone from github= https://github.com/dylanaraps/neofetch.git "
fi

# Run neofetch
neofetch
