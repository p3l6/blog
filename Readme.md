## Repo storage for my personal developer website
[p3l6.dev](https://p3l6.dev)

I don't expect readers or viewers of this blog (other than the resume portions when I am actively looking for work). 
As such, I maintain and post to it as a *personal digital garden*, for my own enjoyment. 

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
