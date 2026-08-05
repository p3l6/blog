---
title: Slack
---

## Configure Style  <!-- Section -->

Paste into dev console.

```
function addStyle (styleString) {
  const style = document.createElement('style');
  style.textContent = styleString;
  document.head.append(style);
}

addStyle(`
html, body, * {
    font-family: 'system-ui';
}

.p-channel_sidebar__compose_button {
  background: none !important;
  color: #D8DCE8 !important;
}

.p-channel_sidebar__list {
  zoom: 85%;
}

#addMoreChannels, #addMoreDM, #addMoreApps {
  display: none;
}

.p-video_composer_button, .p-audio_composer_button, .c-wysiwyg_container__footer_divider {
  display: none;
}

`);
```
