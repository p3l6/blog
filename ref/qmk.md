---
title: Qmk
layout: reference
---

For installing, see readme in keymap repository's readme

## Notes
### zDz60
Keys to remove to get to the 6 PCB screws: tab, caps, l-shift, g, h, backslash, enter, fn, l-ctrl

### Tada
Keys to remove to get to the 6 PCB screws: tab, l-ctrl, l-alt, g, h, l-arrow, d-arrow, spacebar, backslash

## Building with Docker
Run from inside your root qmk directory. Edit the keymap and keyboard as appropriate.
This was very useful at a time when the homebrew compilers had a bugged version.
```
docker run -e keymap=paulLayout -e keyboard=tada68 --rm -v $('pwd'):/qmk:rw edasque/qmk_firmware
```
