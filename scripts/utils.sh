#!/bin/bash

function goto_root {
    script_dir=$(dirname $0)
    if [[ "$script_dir" == "." ]]; then
        cd ..
    else
        cd "$(dirname $script_dir)"
    fi
}

function get_scope {
    TO_PARSE="."
    if [ ! -z ${1+x} ]; then
        TO_PARSE="$1"
    fi
    echo $TO_PARSE
}

function list_dirs {
    echo ${1} | awk -F '/' '{$1=""; print $0}' | cut -c 2-
}
