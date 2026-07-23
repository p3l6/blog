---
title: Creating a Custom Color Theme
summary: I have formalized my custom color palette to use for this site and syntax highlighting.
date: 2026-05-27 20:00 -0400
---

I have tried to create syntax highlighting (or terminal color themes) in the past, but always abandoned them.
They are quite difficult to create, if you want a result that looks halfway decent.
Previously, I approached it in a difficult way; such as trying to force xcode's default theme into basic ansi terminal colors, or other overconstrained goals.
The results always ended up inconsistent and visually unpleasant.

On this attempt, two things clicked. The first was to use the [OKLCH color space](https://en.wikipedia.org/wiki/Oklab_color_space), in which the lightness and chroma components are based on human perception. This is much different from RGB or HSL, because if colors have some of the same values, they will appear similar!
Exactly what you need for making a consistent looking color theme.

My second realization was about what is most important about a syntax highlighting theme. It is not the color values themselves, as much as which language elements those colors represent.
Anytime I would try a popular theme from the internet, what would end up bothering me was that the strings were not red, or the comments were green, for example. As a seasoned xcode user, I am partial to the way the default colors are used, and anything else tends to seem off-putting.
Granted, I could have taken any off-the-shelf theme, such as Dracula, and changed the color assignments to match my preferences.
However, having to modify the theme defeats the main benefit of these popular themes: being are already available for many programs!
If I was already going to customize them, I might as well go full custom with changing color codes as well.

So, while I was doing fine with the three random colors given to this blog, the seven dracula colors given to the terminal, and the nine default colors given to xcode; much like sauron, I thought it would be better to create one universal color theme to rule them all.

## Examples

* A [preview page](/dev/mist/preview) contains example swatches for syntax highlighting themes and the full palette.
* The [main theme page](/dev/mist) contains all the hex codes and syntax assignments.
* A code highlighting example:
  ```swift
  /// A terrible prime number checker
  /// - Param number: an integer to check
  /// - Returns: true if the number is prime (eventually)
  func isPrime(_ number: Int) -> Bool {
    for x in 2 ..< number/2 {
      guard number % x != 0 else {
        Log.warning("\(number) is divisible by \(x)")
        return false
      }
    }
    return true
  }
  ```

## Development Process

I got started on this after reading [Julia Evan's blog post](https://jvns.ca/blog/2026/05/04/css-colour-palettes/) about color themes.
It reminded me that I too had once used tailwind on my blog, but after having moved on I had no true replacement for the color palette.
Her blog made me aware of [Flexoki](https://stephango.com/flexoki), which was novel to me in that it combined syntax highlighting and a website palette into the same theme.

After poking around flexoki, I found a [playground](https://github.com/kepano/flexoki/tree/main/_playground) in its repository, which I understand the author used to extrapolate the expanded palette values based on the initial version's basic accent colors.
I explored this playground a bit, trying various modifications: changing how it seeded the values, using a constant lightness/chroma for each color level, using a single hue to define each color.
I decided that a method using OKLCH like this would work well for my goals.

Using the same color levels, names, and approximate lightness/chroma scales, I started writing [my own generation script](https://github.com/p3l6/blog/tree/main/dev/mist/generate_colors.rb), to convert the input arrays of lightness/chroma/hue into preview swatches and color codes. Since my constraints were a lot tighter, the script ended up fairly simple, at least for color calculation and conversions.

Once the basic script was working, I started experimenting with different hues.
I used the color picker on [oklch.com](https://oklch.com), and looked for hues that were similar to colors I've liked in the past: Xcode, Dracula, existing blog colors, etc. I picked a few colors this way, and interpolated or spaced out the remaining colors in between them.
I initially picked the background color based on Xcode's default line highlight, and ended up using its resemblance to mist to name the theme.

With the script inside my blog repository, I chose to have it output css variables and color codes directly into source files, overwriting their previous contents.
I considered running it as a custom publish step, but decided it will change so infrequently that the output can just be committed in the css and markdown.

Once things were looking good on the blog, I translated it into a light theme for xcode and dark theme for terminal. Unfortunately, while dark mode was okay, the light mode was quite difficult to read! All the text looked very "washed out".
I went about trying to adjust the lightness/chroma levels to have more contrast at the 600 level, and went in circles here for quite some time.

It came down to three separate changes that wrapped up the project:
* I dropped some color levels. I was using 13 levels per color, like flexoki, but 9 were sufficient for my needs. I also dropped the extra shades for 'paper' and 'black', opting to just let those be the 100/900 levels of the base color.
* I realized that [Harmoizer](https://harmonizer.evilmartians.com) (which I had seen at the beginning but did not have the context yet to understand it) was exactly what I wanted to help choose lightness and chroma values. This tool considers the APCA contrast rating between text and background, to make sure text is legible.
* But the biggest factor was human error. I had assumed the light mode palette was the issue, since my dark mode terminal looked fine. But, in fact it was Xcode's color picker to blame. You cannot simply enter hex codes into an Xcode theme, you must use the macOS system color picker. It defaulted to linear-rgb input instead of sRGB, which resulted in most of the colors I entered appearing significantly lighter than intended.
