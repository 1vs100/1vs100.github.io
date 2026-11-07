#!/usr/bin/env bash
# Creates a Wine prefix for screenshots of Windows programs: the Aero theme,
# smooth fonts, and a user named Player so paths read C:\users\Player.
#
# Usage: wine_setup.sh            (prefix in $WINEPREFIX, default ~/.cache/1vs100-docs-wine)
# Then:  WINEPREFIX=... USER=Player wine explorer /desktop=shot,1920x1080 setup.exe
#
# Run Windows programs inside "explorer /desktop": Xvfb has no window manager,
# and the Wine desktop draws the themed window frames itself.
set -euo pipefail
export WINEPREFIX=${WINEPREFIX:-$HOME/.cache/1vs100-docs-wine}
export DISPLAY=${SHOT_DISPLAY:-:77} WAYLAND_DISPLAY= WINEDEBUG=-all USER=Player LOGNAME=Player
export WINEDLLOVERRIDES="mscoree,mshtml="
reg=$(mktemp --suffix=.reg)
trap 'rm -f "$reg"' EXIT
wineboot -i >/dev/null 2>&1
theme=$(find "$WINEPREFIX/drive_c/windows/resources/themes" -iname '*.msstyles' | head -1)
[ -n "$theme" ] || { echo "no theme in $WINEPREFIX" >&2; exit 1; }
theme_win='C:\\windows\\resources\\themes\\'"$(basename "$(dirname "$theme")")"'\\'"$(basename "$theme")"
# The prefix has no Tahoma or Segoe UI and would fall back to a bitmap font.
cat > "$reg" <<EOF
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\ThemeManager]
"ThemeActive"="1"
"DllName"="$theme_win"
"ColorName"="NormalColor"
"SizeName"="NormalSize"

[HKEY_CURRENT_USER\\Control Panel\\Desktop]
"FontSmoothing"="2"
"FontSmoothingType"=dword:00000002
"FontSmoothingGamma"=dword:00000578
"FontSmoothingOrientation"=dword:00000001

[HKEY_CURRENT_USER\\Software\\Wine\\Fonts\\Replacements]
"MS Shell Dlg"="Noto Sans"
"MS Shell Dlg 2"="Noto Sans"
"MS Sans Serif"="Noto Sans"
"Microsoft Sans Serif"="Noto Sans"
"Tahoma"="Noto Sans"
"Segoe UI"="Noto Sans"
EOF
wine regedit /S "$reg"
wineserver -w
echo "$WINEPREFIX ready, theme $theme_win"
