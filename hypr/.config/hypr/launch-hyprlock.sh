#!/usr/bin/env bash
set -u

wallpaper="$HOME/.cache/matugen/lockscreen-wallpaper"
fallback_wallpaper="$HOME/.config/fastfetch/Digital_Blue_Flowers_PNG - 1500x1500.png"

mkdir -p "$HOME/.cache/matugen"
if [[ ! -e "$wallpaper" ]]; then
    ln -sfn "$fallback_wallpaper" "$wallpaper"
fi

config="$HOME/.config/hypr/hyprlock-matugen.conf"
if [[ ! -f "$config" ]]; then
    config="$HOME/.config/hypr/hyprlock.conf"
fi

exec hyprlock --config "$config"
