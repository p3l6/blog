## Repo storage for my personal developer website
[pwxn.dev](https://pwxn.dev)

## Running locally
docker run -it --rm -v "$PWD":/usr/src/app -p "4000:4000" starefossen/github-pages

## Theme reference
https://github.com/pages-themes/minimal


## Including images
Both alt text and title are optional. Reminder: 
* alt text: shows when image fails to load, should describe the image
* title: aka hover-text. use to describe something unclear about an image

![Alt text](/path/to/image "Title - extra information")
OR
![Alt text][footnote]
then later,
[footnote]: /path/to/image "Title - extra information"
