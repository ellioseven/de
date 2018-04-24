#!/usr/bin/env bash

set -e
set -u

function dkr_id () {
    basename "$PWD" | tr  -dc '[:alnum:]\n' | tr '[:upper:]' '[:lower:]'
}

function dkr_compose () {
    docker-compose -p $(dkr_id) up -d
}

dkr_compose
