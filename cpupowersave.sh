#!/usr/bin/bash

if [ "${EUID}" -ne 0 ]; then
    echo "Error: you must be root to run cpumode";
    exit 2;
fi

if cpupower frequency-set -g powersave > /dev/null; then
    echo "CPU performance mode was changed to powersave";
    exit 0;
else
    echo "Error: couldn't change performance mode to powersave";
    echo "Possible solutions: check is 'cpupower' exists, reinstall 'cpumode' or just try again";
    exit 237;    
fi