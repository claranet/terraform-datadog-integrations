#!/bin/bash

function goto_root() {
    script_dir=$(dirname $0)
    if [[ "$script_dir" == "." ]]; then
        cd ..
    else
        cd "$(dirname $script_dir)"
    fi
}

function init() {
    set -euo pipefail
    if [[ ${GITLAB_CI:-} == "true" ]]; then
        set -x
    fi
    # MON-478 fix sort order behavior on case
    export LC_COLLATE=C
    goto_root
    if ! [ -z ${1:-} ]; then
        cd "$1"
    fi
}

function get_scope() {
    TO_PARSE="./"
    if [ ! -z ${1+x} ] && [ $1 != "." ]; then
        TO_PARSE="$1"
    fi
    if [[ $TO_PARSE != ./* ]]; then
        TO_PARSE="./${TO_PARSE}"
    fi
    echo $TO_PARSE
}

function list_dirs() {
    echo ${1} | awk -F '/' '{$1=""; print $0}' | cut -c 2-
}

function browse_modules() {
    find "$1" -name "$2" -exec dirname "{}" \; | sort -fdbiu
}
