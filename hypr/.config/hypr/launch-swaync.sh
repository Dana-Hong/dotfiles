#!/usr/bin/env bash
set -u

style="${HOME:?HOME is not set}/.config/swaync/matugen.css"

if [[ -f "$style" ]]; then
    exec swaync --style "$style"
fi

exec swaync
