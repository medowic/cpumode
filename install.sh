#!/usr/bin/bash

if [ "${EUID}" -ne 0 ]; then
    echo "Error: you must to run this script as root";
    exit 1;
fi

if ! cpupower frequency-info >/dev/null 2>&1; then
    echo "Error: 'cpupower' isn't found";
    echo "If you haven't it, you must to install 'linux-tools-common' and 'linux-tools-$(uname -r)'";
    exit 1;
fi

if ! cp cpumode.sh /usr/bin/cpumode >/dev/null 2>&1; then
    echo "Error: couldn't copy main file into /usr/bin";
    exit 1;
else
    chmod 755 /usr/bin/cpumode;
    chmod +x /usr/bin/cpumode;
fi

if ! cp cpubalanced.sh /usr/bin/cpubalanced >/dev/null 2>&1; then
    echo "Error: couldn't copy main file into /usr/bin";
    exit 1;
else
    chmod 755 /usr/bin/cpubalanced;
    chmod +x /usr/bin/cpubalanced;
fi

if ! cp cpupowersave.sh /usr/bin/cpupowersave >/dev/null 2>&1; then
    echo "Error: couldn't copy main file into /usr/bin";
    exit 1;
else
    chmod 755 /usr/bin/cpupowersave;
    chmod +x /usr/bin/cpupowersave;
fi

if ! cp cpuperformance.sh /usr/bin/cpuperformance >/dev/null 2>&1; then
    echo "Error: couldn't copy main file into /usr/bin";
    exit 1;
else
    chmod 755 /usr/bin/cpuperformance;
    chmod +x /usr/bin/cpuperformance;
fi

echo "Installation was successful"
exit 0