---
title: Keyboards
---

## Keymaps

I prefer to use the QMK open source firmware for programming layouts. There are many easy ways to get into this, including `VIA` and `json`, but I have always used the bare C language to define layouts. This allows for the most flexibility and largest feature set when it comes to macros, etc.

As firmware get flashed directly onto the keyboard's chip, there is no corresponding program that needs to be running on the computer. The major advantage of this is that any computer you have attached the keyboard to doesn't know it is a super keyboard with extra tricks, as the computer just receives standard key codes.

Storing your keymap layouts separate from the qmk firmware repository is easier than ever, thanks to the qmk "userspace keymaps" support.
This is great, since I had previously jumped through hoops to keep my small layout collection separate from the large firmware repository.

All my keymaps can be found in my dotfiles repository, here are a few examples:

* [Prime_E](https://github.com/p3l6/env/blob/main/keymaps/keyboards/primekb/prime_e/keymaps/me/keymap.c)
* [Bmek](https://github.com/p3l6/env/blob/main/keymaps/keyboards/bemeier/bmek/keymaps/me/keymap.c)
* [Shared custom keycode macros](https://github.com/p3l6/env/blob/main/keymaps/users/me/custom-keycodes.h)

## Collection

This is an inventory of my keyboards and keycap sets.
Most of these are on display, but my current daily drivers are the 'Prime Elise' and 'Kbdfans kbdpad mkii'.

| Type        | Board                 | Keycap set          |
|-------------|-----------------------|---------------------|
| 45% (ergo)  | Prime Elise           | gmk space cadet     |
| 45% (ergo)  | Prime E               | xda middle earth    |
| 35%         | Quefrency (left half) | mt3 godspeed        |
| 65%         | Ca66                  | sa green screen     |
| hhkb        | Tokyo60 (slate)       |                     |
| hhkb (ergo) | Bmek                  | gmk laser           |
| hhkb        | Kbdfans 5 deg & dz60  | gmk red samurai     |
| numpad      | Kbdfans kbdpad mkii   | gmk space cadet     |
| 65%         |                       | sa grab bag 65%     |
| full        |                       | artifact bloom 9009 |
|             |                       | g20 blanks          |


{::comment}
pending: mtnu caps
drop red keyboard
drop g20 blanks
drop grab bag sa
get split ortho keyboard for testing
{:/comment}
