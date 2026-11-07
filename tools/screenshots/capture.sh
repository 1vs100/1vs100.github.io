#!/usr/bin/env bash
# Saves the virtual display as a PNG, cropped to everything that is not
# background (the window or windows on it).
#
# Usage: capture.sh <out.png>
# Needs ImageMagick (import) and Python with Pillow.
set -euo pipefail
export DISPLAY=${SHOT_DISPLAY:-:77}
raw=$(mktemp --suffix=.png)
trap 'rm -f "$raw"' EXIT
import -window root "$raw"
python3 -I - "$raw" "$1" <<'PY'
import sys
from PIL import Image, ImageChops
image = Image.open(sys.argv[1]).convert('RGB')
background = Image.new('RGB', image.size, image.getpixel((2, 2)))
box = ImageChops.difference(image, background).getbbox()
(image.crop(box) if box else image).save(sys.argv[2])
PY
