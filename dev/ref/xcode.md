---
title: Xcode
---

## Logs <!-- Setting -->

**Not needed!** As of Xcode 15, logs can be filtered by library by right clicking them in the output.

Setting the `OS_ACTIVITY_MODE = disable` environment variable for the current scheme may hide noisy system library messages from the output.
Possibly all NSLogs as well though?

## PluginKit  <!-- Section -->

`pluginkit` is a command line program that can help deal with extensions.
In particular, it may be of use assigning the right extension to launch.

* List extensions by type: `pluginkit -m -p com.apple.dt.Xcode.extension.source-editor`
* Verbose output, with duplicates: `pluginkit -m -p com.apple.dt.Xcode.extension.source-editor -A -D -vvv`
* Remove problematic extension: `pluginkit -r path/to/extension`
* Add an undetected one (maybe): `pluginkit -a path/to/appex`

If the problem is instead with **multiple copies of Xcode.app**, re-register the main one.
```sh
$ PATH=/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support:"$PATH"
$ lsregister -f /Applications/Xcode.app
```
