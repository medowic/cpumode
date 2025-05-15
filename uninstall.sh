#!/usr/bin/bash

function errorcode() {
    echo "Error: couldn't remove ${1} file from /usr/bin"
}

if [ "${EUID}" -ne 0 ]; then
    echo "Error: you must to run this script as root";
    exit 1;
fi

if ! rm /usr/bin/cpumode; then
    errorcode "cpumode";
    exit 1;
fi

if ! rm /usr/bin/cpuperformance; then
    errorcode "cpuperformance";
    exit 1;
fi

if ! rm /usr/bin/cpubalanced; then
    errorcode "cpubalanced";
    exit 1;
fi

if ! rm /usr/bin/cpupowersave; then
    errorcode "cpupowersave";
    exit 1;
fi

echo "Uninstall was successful"
exit 0