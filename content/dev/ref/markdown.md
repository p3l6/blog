---
title: Markdown
---

## Images <!-- Section -->

Alt text and hover text are both optional.
Alt text shows when image fails to load, it should describe the image.
Title text (aka hover) should be used to describe something unclear about an image.

```md
![alt text](/image/url "hover text")
```

Or, a reference to an image at the end of the document:

```md
![alt text][1]

...

[1]: /path/to/image "hover text"
```
