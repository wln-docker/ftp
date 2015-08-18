#!/bin/bash
# Create user
set -e
if [ ! -z "$FTP_USER" -a ! -z "$FTP_PASS" ]; then
    /ftpuser.sh -d "$FTP_USER" "$FTP_PASS"
fi

# Executing supervisord
exec supervisord -n
