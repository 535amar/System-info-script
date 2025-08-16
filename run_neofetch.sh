#!/bin/bash
# run_neofetch.sh (portable version)

if [ -f "./neofetch/neofetch" ]; then
    ./neofetch/neofetch
else
   echo "Cloning Neofetch...."
   git clone https://github.com/dylanaraps/neofetch.git
   ./neofetch/neofetch
fi
