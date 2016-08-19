#!/bin/bash
set -e
database=/etc/vsftpd/virtual-users.db

if [ "$1" = "-d" ]; then
    if [ -f $database ]; then
        rm $database
    fi
    shift
fi

if [ "$#" -ne 2 ]; then
    >2 echo "usage: $0 [-d] <user> <password>"
    >2 echo
    >2 echo "The -d option deletes the database before the operation."
    exit 1
fi

echo -e "$1\n$2" | db5.3_load -T -t hash $database
