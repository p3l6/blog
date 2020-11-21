---
layout: default
title: Keyboards
---

Currently my main keyboards are a ca66, and a hhkb layout dz60 in a kbfans 5 degree case.
I got into this hobby because I wanted to program my own layout, and add little tricks and shortcuts for the keys.
That is really fun!
I am able to have access to have all the keys on a full keyboard, but in a more compact space.
To do this, I prefer to use the QMK open source firmware.
It's very easy, all you need to do is create files that specify the keycodes that will be sent when keys are pressed.
The major advantage of this is that any computer you have attached the keyboard to doesn't know it is a super keyboard with extra tricks, as the computer just receives standard key codes. You can see my layout files for each keyboard below.

Lately, I have separated my keymap configs from the main qmk repository, to make it easier to manage for myself.
I've found it much more convenient to have a small and light repository, and have some scripts to clone the main repo and make the builds for me.
You can find that script (makefile) in my [keymap repository](https://github.com/pwxn/keymaps).
Essentially, I have a folder for each of my keyboards, and use `git submodules` to manage the rest of Qmk.

* [ca66](https://github.com/pwxn/keymaps/blob/master/ca66/keymap.c)
* [hhkb dz60 in 5 deg](https://github.com/pwxn/keymaps/blob/master/dz60/keymap.c)
* [tada68 hhkb variant](https://github.com/pwxn/keymaps/blob/master/tada68-hhkb/keymap.c)
* [gherkin for bagpipe authoring](https://github.com/pwxn/qmk_firmware/blob/master/keyboards/40percentclub/gherkin/keymaps/ePipes/keymap.c)

My first keyboard was a fully custom layout, hand wired. Most of the keyboards since then have been kits, and those are much easier.
But by jumping in the deep end at the beginning, I learned a lot!

As for keycaps, I am slowly acquiring more options.
Below are some sets that I have.

* SA Green Screen.
* XDA Middle Earth.
* SA Grab bag set. A random assortment of grab bag keys, but with the proper sculpting!
* G20 Blanks. I used these on my first keyboard that had a really bizarre layout.
* MT3 Godspeed.
* GMK Red Samurai (on order)
* GMK Space cadet (on order)
