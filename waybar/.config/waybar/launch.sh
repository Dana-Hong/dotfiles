#!/usr/bin/env bash

set -u

generated_style="$HOME/.config/waybar/matugen.css"
fallback_style="$HOME/.config/waybar/style.css"

if [[ -f "$generated_style" ]]; then
    exec waybar -s "$generated_style"
else
    exec waybar -s "$fallback_style"
fi
