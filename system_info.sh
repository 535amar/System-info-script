#!/bin/bash
echo "===Amar's System Info ==="
neofetch 2>/dev/null || echo "Neofetch not installed"
echo "Disk Usage:"
df - h | grep '^/dev'
echo "Memory Usage:"
free -h
