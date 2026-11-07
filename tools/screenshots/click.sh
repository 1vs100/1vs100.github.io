#!/usr/bin/env bash
# Clicks a point in the PC launcher on the virtual display, then captures it.
#
# Usage: click.sh <x> <y> <out.png>   (x and y relative to the launcher window)
#
# The launcher (Dear ImGui) misses a click whose press and release arrive in
# the same frame, so the button is held briefly.
set -euo pipefail
export DISPLAY=${SHOT_DISPLAY:-:77}
here=$(cd "$(dirname "$0")" && pwd)
eval "$(xdotool search --name '^1 vs 100$' getwindowgeometry --shell | head -5)"
xdotool mousemove $((X + $1)) $((Y + $2))
read -rt 0.15 < <(tail -f /dev/null) || true
xdotool mousedown 1
read -rt 0.15 < <(tail -f /dev/null) || true
xdotool mouseup 1
xdotool mousemove_relative 0 1
read -rt 1.2 < <(tail -f /dev/null) || true
"$here/capture.sh" "$3"
