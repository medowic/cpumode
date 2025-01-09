#!/usr/bin/bash

if [ "${EUID}" -ne 0 ]; then
    echo "Error: you must be root to run cpumode";
    exit 2;
fi

function checkSet() {
    if [ "${1}" != "0" ]; then
        echo "Error: couldn't change performance mode to '${2}'";
        echo "Possible solutions: check is 'cpupower' exists, reinstall 'cpumode' or just try again";
        exit 237;
    else
        echo "CPU performance mode was changed to '${2}'";
        exit 0;
    fi
}

function getHelp() {
    echo "Usage: cpumode <mode | command>"
    echo ""
    echo "Supported CPU modes:"
    echo " - performance"
    echo " - balanced"
    echo " - powersave"
    echo ""
    echo "Supported commands:"
    echo " - help"
    echo " - version"
    echo ""
    echo "GitHub repository: https://github.com/medowic/cpumode"
}

function getVersion() {
    echo "cpupower v1.0, 2025"
    echo "GitHub repository: https://github.com/medowic/cpumode"
    echo ""
    echo "Contributed under MIT License, https://github.com/medowic/cpumode/LICENSE"
}

if [ "${1}" == "performance" ]; then
    cpupower frequency-set -g performance > /dev/null;
    checkSet "${?}" "${1}";
elif [ "${1}" == "powersave" ]; then
    cpupower frequency-set -g powersave > /dev/null;
    checkSet "${?}" "${1}";
elif [ "${1}" == "balanced" ]; then
    if cpupower frequency-set -g schedutil > /dev/null; then
        echo "CPU performance mode was changed to balanced";
        exit 0;
    else
        cpupower frequency-set -g ondemand > /dev/null
        echo "CPU performance mode was changed to balanced";
        echo "Note: 'schedutil' isn't supported on your machine. It's usually requires a newer Linux kernel (4.8+)";
        exit 0;
    fi
elif [ "${1}" == "" ] || [ "${1}" == "help" ]; then
    getHelp;
    exit 0;
elif [ "${1}" == "version" ]; then
    getVersion;
    exit 0;
else
    echo "Error: couldn't change performance mode to '${1}'";
    echo "";
    getHelp;
    exit 237;
fi
