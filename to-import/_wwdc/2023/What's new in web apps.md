---
title: What's new in web apps
year: 2023
---
### Web apps on Mac
* Add a website to dock, from file menu
* Copies website cookies from safari, so you stay logged in
  * Afterwhich the cookies diverge
  * Localstorage will not be copied
* Works with credential autofill
* Customizations
  * Set a web app manifest
    * `<link rel="manifest" href="manifest.json>`
  * Set toolbar items, or hide the toolbar: standalone display mode
  * Can customize name
  * Can override scope, which is the hostname of the webapp by default. That is, you can restrict the app to subsets of the domain.
  * Links opened with `user.open` will always open within the webapp
  * One time emailed links won't work for auth, since it won't open in the app

### Notifications
* Standards based web push should just work
