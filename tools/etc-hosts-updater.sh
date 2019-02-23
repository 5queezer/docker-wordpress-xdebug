#!/usr/bin/env bash
set -euo pipefail

# Default IP address for host
ip="127.0.0.1"

# Hostname to add/remove.
hostname="$2"

yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "cannot $*"; }

remove() {
    if [ -n "$(grep -P "[[:space:]]$hostname" /etc/hosts)" ]; then
        echo -n "$hostname found in /etc/hosts. ";
        try sudo sed -ie "/[[:space:]]$hostname/d" "/etc/hosts";
        echo "Removed.";
    else
        yell "$hostname was not found in /etc/hosts";
    fi
}

add() {
    if [ -n "$(grep -P "[[:space:]]$hostname" /etc/hosts)" ]; then
        yell "$hostname, already exists: $(grep $hostname /etc/hosts)";
    else
        try printf "%s\t%s\n" "$ip" "$hostname" | sudo tee -a "/etc/hosts" > /dev/null;

        if [ -n "$(grep $hostname /etc/hosts)" ]; then
            echo -n "$hostname was added succesfully: ";
            echo "$(grep $hostname /etc/hosts)";
        else
            die "Failed to add $hostname";
        fi
    fi
}

$@