---
title: Advanced Debugging
year: 2018
---
```
Xcode can always open a new tab to debug
Xcode > Behaviors > Edit behaviors > pause > tab named: debug

(lldb) expression
  run any code expression
  attach to a bp with auto-continue to test live changes without restarting
  then you can disable the breakpoint to go back

(lldb) po $arg1
       po $arg2
       etc, can be used in an assembly frame when you don't know the source

use a breakpoint to 'set --one-shot --name "-[ ]"'
useful to automatically set another breakpoint after a specific action

you can move the instruction pointer with the grab handle
or use 'jump --by 1'
if you execute an expression after this, it will be like replaceing a line of code, live

you can execute objc when in a swift frame
expression -l objc -O --

Use watchpoints and the view debugger

you can write your own lldb commands in python

if po or p isnt working you can use 'frame variable' to read from memory without formatting

You can get a fake on screen touch bar, even on regular macs. Window > show touch bar
Use it to pause an app without it losing focus
Or, Cmd-click on the window behind

Copy an element in the view debugger to get it's pointer

enable malloc stack = alloc and free in options for scheme logging to get stack traces for object creation

```
