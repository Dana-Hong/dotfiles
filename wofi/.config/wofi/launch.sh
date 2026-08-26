#!/usr/bin/env bash
set -u

if [[ -f "$HOME/.config/wofi/matugen.css" ]]; then
	stylesheet="$HOME/.config/wofi/matugen.css"
else
	stylesheet="$HOME/.config/wofi/style.css"
fi

exec wofi --show drun --style "$stylesheet"
