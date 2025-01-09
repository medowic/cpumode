#!/usr/bin/bash

if [ "${EUID}" -ne 0 ]; then
    echo "Error: you must to run this script as root";
    exit 1;
fi

if ! rm /usr/bin/cpumode; then
    echo "Error: couldn't remove cpumode file from /usr/bin";
    exit 1;
fi

if ! rm /usr/bin/cpuperformance; then
    echo "Error: couldn't remove cpumode file from /usr/bin";
    exit 1;
fi

if ! rm /usr/bin/cpubalanced; then
    echo "Error: couldn't remove cpumode file from /usr/bin";
    exit 1;
fi

if ! rm /usr/bin/cpupowersave; then
    echo "Error: couldn't remove cpumode file from /usr/bin";
    exit 1;
fi

echo "Uninstall was successful"
exit 0