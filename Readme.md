## Repo storage for my personal developer website
[p3l6.dev](https://p3l6.dev)

## Running locally

`./run-local`

## Including images
Both alt text and title are optional. Reminder:
* alt text: shows when image fails to load, should describe the image
* title: aka hover-text. use to describe something unclear about an image

![Alt text](/path/to/image "Title - extra information")
OR
![Alt text][footnote]
then later,
[footnote]: /path/to/image "Title - extra information"


## Kramdown extras reference

https://kramdown.gettalong.org/quickref.html

Notably, add html markup following blocks with "block inline attribute list"s:

```
{: title="Blockquote title"}
{: .class1 .class2}
{: #with-an-id}
{: style="color: red"}
```

## Tailwind

Tailwind is not integrated into the jekyll build pipeline, so just run it and commit the output, when the html changes.

Build: `./_tailwind/build`, which happens at the beginning of run-local. It would be great to watch for tailwind changes, but jekyll watch currently doesn't see the changes to the theme files, so the server has to be relaunched regardless.
