#!/usr/bin/env bash

set -u

wallpaper="$1"

mkdir -p "$HOME/.cache/matugen"

# Regenerate application themes only after the selected wallpaper is applied.
if awww img "$wallpaper" -t random --transition-duration 1; then
    if matugen \
        --prefer lightness \
        --type scheme-vibrant \
        --quiet \
        image "$wallpaper"; then
        # Ask interactive Zsh sessions to redraw Fastfetch and Starship.
        pkill -USR1 -u "$UID" -x zsh || true
    fi
fi
