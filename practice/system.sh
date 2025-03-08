#!/bin/bash

# Thresholds for filtering
MIN_SIZE=50000  # Minimum size in KB (50 MB)
DAYS_UNUSED=30  # Minimum days since last access

echo -e "Size (MB)\tPackage\tLast Accessed"

# List installed packages with sizes
dpkg-query -W --showformat='${Installed-Size}\t${Package}\n' | sort -n | while read size package; do
    filepath=$(dpkg -L $package 2>/dev/null | grep '/usr/bin' | head -n 1)
    if [ -n "$filepath" ]; then
        # Get last access time
        last_access=$(stat -c %X $filepath 2>/dev/null || echo 0)
        current_time=$(date +%s)
        days_unused=$(( (current_time - last_access) / 86400 ))
    else
        days_unused=0
    fi

    # Filter for large and unused applications
    if [ "$size" -ge "$MIN_SIZE" ] && [ "$days_unused" -ge "$DAYS_UNUSED" ]; then
        echo -e "$((size / 1024))\t$package\t$(date -d @$last_access '+%Y-%m-%d')"
    fi
done
