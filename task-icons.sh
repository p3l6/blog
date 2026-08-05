#!/usr/bin/env bash
set -euo pipefail

widths=(1024 512 256 192 180 128 32)

for pair in "square:0" "round:15" "circle:40"; do
  IFS=: read -r name radius <<< "$pair"

  sed "s|rx=\"0\"/><!-- CLIP -->|rx=\"${radius}\"/>|" \
    content/site/icon/boat.svg > "content/site/icon/boat-${name}.svg"

  for width in "${widths[@]}"; do
    resvg -w "$width" \
      "content/site/icon/boat-${name}.svg" \
      "content/site/icon/boat-${name}-${width}.png"
  done
done
