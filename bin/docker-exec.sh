#!/usr/bin/env bash

set -e

# @todo Move to functions.

function dkr_id () {
    basename "$PWD" | tr  -dc '[:alnum:]\n' | tr '[:upper:]' '[:lower:]'
}

if [[ ! $SRV ]]; then
    SRV=web
fi

if [[ ! $USR ]]; then
    USR=app
fi

ID=$(dkr_id)
CNTR=${ID}_${SRV}_1

docker exec --user="$USR" -ti $CNTR /bin/bash

exit 0
