---
title: VS Code
layout: reference
---

## Shortcuts to remember

| Keypress | Action                                    |
|----------|-------------------------------------------|
| Cmd shift dot | navigate current file outline |
| Cmd shift e | adds a cursor at the next occurance of current word |
| Option double click | add a cursor, selecting that word |
| Cmd up | will move cursor to the top (Since home/end don't work) |
| Ctrl h | look up current word in Dash docs |

## Other to remember
* when adding an if statement, instead of deleting the closing curly, just shift-alt-down the line to surround the existing lines!
* Box select: alt+shift+drag. BUT: start dragging first! then push keys, and keep dragging.

## Changing case in find/replace
This is done with the modifiers `\u\U\l\L`, where `\u` and `\l` will upper/lowercase a single character, and `\U` and `\L` will upper/lowercase the rest of the matching group.
The modifiers can be stacked and go before the group: `\u\u\u$1` `\l\U$1` 
