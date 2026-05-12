---
title: Introducing Ipad apps for mac
year: 2019
---
Rebuild and run ipad apps on the mac
combine lower level frameworks between mac and ios
appkit and uikit are still separate frameworks
ipad app on the inside, but looks and works like a normal mac app

## Stuff you get
* window stoplights
* Menu bars
* Dark mode
* scrolling
* Settings bundles
* Some touchbar defaults
* custom views will come verbatim
* copy paste
* drag and drop
* multiple windows
* application lifecycle

## api differences
* custom multi-touch gestures
* deprecated frameworks
  * have not been ported to mac
* ios specific frameworks
* hardware specific frameworks
* specific differences
  * core location is less acurrate
  * core motion, telephony, etc
  * media, avfoundation
  * various other small differences, identified by compiler suggestions
* data protection, auto encryption doesnt happen
* nsbundle to find resources will be in different places
