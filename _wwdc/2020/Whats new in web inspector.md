---
title: Whats new in web inspector
year: 2020
---
* Sources tab
  * Combines the previous resources tab and debugging tab
  * Can view page responses as a dom tree instead of a text file
  * Local overrides: button copies the selected resource into a local copy, that persists between sessions and reloads
    * By editing in the sidebar, you can edit http status etc
  * Inspector bootstrap script can be used to modify javascript apis
  * New debugger button that moves by expression (step) instead of statement (next)
  * Pretty-print any content, to debug minified content
* Timelines tab adds a new Media and animations timeline
* Storage tab
  * New filtering and editing cookies
* Graphics tab, expands canvas tab, with more animations
* Layers tab visualizes the layer tree of the page
* Console tab has a couple new APIs
  * queryInstantces(constructor | prototype) finds objects of that class
  * queryHolders(obj) finds objects with a strong reference to obj
