#!/usr/bin/env bash
# Runs a program from the extracted Linux build on the virtual display, with
# the build mounted at /home/player/1vs100 so screenshots show a neutral path
# instead of your own. The mounts are private to the program: nothing is
# created in the real /home.
#
# Usage: run_as_player.sh <linux-build-dir> <program> [args...]
#   run_as_player.sh ~/Downloads/1vs100 ./launcher
#
# Set SHOT_LINKS_TO to a folder that symlinks in content/ point into; it is
# mounted at the same path inside, so those links still resolve.
set -euo pipefail
build=$(realpath "$1")
shift
links=${SHOT_LINKS_TO:-}
exec unshare -Urm --kill-child bash -c '
  build=$1 links=$2; shift 2
  if [ -n "$links" ]; then
    hold=$(mktemp -d)
    mount --bind "$links" "$hold"
  fi
  mount -t tmpfs none /home
  mkdir -p /home/player/1vs100
  mount --bind "$build" /home/player/1vs100
  if [ -n "$links" ]; then
    mkdir -p "$links"
    mount --bind "$hold" "$links"
  fi
  cd /home/player/1vs100
  exec env HOME=/home/player USER=player DISPLAY="${SHOT_DISPLAY:-:77}" WAYLAND_DISPLAY= \
    SDL_VIDEODRIVER=x11 XDG_CONFIG_HOME=/home/player/.config "$@"
' run_as_player "$build" "$links" "$@"
