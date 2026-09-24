## Repo storage for my personal website

[ers.land](https://ers.land)

I don't expect readers or viewers of this blog (other than the resume portions when I am actively looking for work).
As such, I maintain and post to it as a *personal digital garden*, for my own enjoyment.

## Running locally

1. Install stuff
   1. `hugo`
   2. `typst`
   3. `resvg`
  4. `go-task`
2. `task serve`

## Generic hugo notes

* You cant use any {{ go template }} stuff in content files. It has to all go in layouts
  * I've allowed inline shortcodes, but try not to use them. The default is good separation
* Front matter dates require seconds
* Preferred time format: `{{ .Date | time.Format "2 Jan 2006"}}`
* Tables usually require headers, but I am using a custom render hook to:
  * Omit a blank header `| | |`
  * Replace separator rows `| - | - | - |` with a line, as kramdown would have done

## Callouts

Used like `> [!NOTE] Optional title override`
Callout types are NOTE, TIP, IMPORTANT, WARNING, ABSTRACT, SOURCE (defined in css)

## Including images

Both alt text and title are optional. Reminder:
* alt text: shows when image fails to load, should describe the image
* title: aka hover-text. use to describe something unclear about an image

![Alt text](/path/to/image "Title - extra information")
OR
![Alt text][footnote]
then later,
[footnote]: /path/to/image "Title - extra information"

## Block attributes

Add html markup following blocks:

```
{.class1 .class2}
{#with-an-id}
{title="Blockquote title"}
{style="color: red"}
{height="36px" width="36px"}.
```

## To do

* Consider bringing in <aside> as a latex sidenote. Recover css from latex.css. Possibly convert footnotes. Have to use the left side.
