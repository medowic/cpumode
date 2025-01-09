#!/usr/bin/bash

if [ "${EUID}" -ne 0 ]; then
    echo "Error: you must be root to run cpumode";
    exit 2;
fi

if cpupower frequency-set -g schedutil > /dev/null; then
    echo "CPU performance mode was changed to balanced";
    exit 0;
elif cpupower frequency-set -g ondemand > /dev/null; then
    echo "CPU performance mode was changed to balanced";
    echo "Note: 'schedutil' isn't supported on your machine. It's usually requires a newer Linux kernel (4.8+)";
    exit 0;
else
    echo "Error: couldn't change performance mode to balanced";
    echo "Possible solutions: check is 'cpupower' exists, reinstall 'cpumode' or just try again";
    exit 237;
fi