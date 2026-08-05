---
title: Advent of Code 2025
summary: Thoughts from completing this year's adventofcode.com puzzles.
date: 2025-12-12 09:45 -0500
---

I have worked on advent of code puzzles for the last few years to some extent. This year, there will only be 12 puzzles instead of 25, so I'm hoping to make it through them. In the past I would ordinarily run out of steam partway through, but with fewer puzzles, I am hopeful.

## Preparation

I've done some preparation, using generally the same swift harness as the last years.
However, I have cleaned up and simplified it quite a bit.
I removed the use of swift macros, which although neat, was not actually saving much code. I had added that macro in the year that swift macros were introduced, as an exercise. 

I considered adding a new string class (and substring) for AsciiString, to wrap the input and easily have random element access. I remembered having issues in the past with working around swift's native support for unicode.
It seemed like a fun idea, that could use the new swift InlineArray and/or Span classes. However, I must have been remembering challenges from before regexes were introduced, as my last few years have don't have the hacky character random access extension, nor seem to miss it.

## Day 1

A solid start, although part two was more challenging than I expected. I wanted to use division and modulus operations to calculate the zero passes. This seemed more in the spirit of the problem than a nested loop to move over each click. But I did find lots of edge cases to consider, when the dial either starts or ends at a zero already. 

## Day 2

I determined in planning that string random access would not likely to be something that would come up. But here I am on day two, doing index based substrings: `str[str.startIndex ..< str.index(str.startIndex, offsetBy: substringSize)]`. Fortunately, there wasn't too much, just a little ironic to hit it right away.

## Day 4

A classic grid problem. I did end up adding a few new functions to my Grid class, although not all were used in the final solution. An elementwise `map()`, `count(where:)`, two functions to determine the available points around a point: `neighbors4(of:)` and `neighbors8(of:)`. Other than that the solution was pretty straightforward, sometimes it is nice to have a day where all the work happens in expanding the utility classes.

## Day 5

Today was my fastest turnaround between part one and part two so far. I lucked out in that the structure I found for the first part aligned perfectly with the second. For part one, instead of doing a naive double loop, I converted all input numbers into an array of `(index, kind)` pairs. Then looping over a sorted list, just keeping track of the "current nested range depth" was all that was needed. For part two, it was a simple matter of adding an accumulator for the full range, when the nested depth returned to zero. 

## Day 7

Today was a complete refactor between parts one and two. This was the first day where part two fits the common the pattern: "the naive solution is easy but takes too long to run". It would have had to count 48 trillion paths! I expect there will be more problems like this as the end approaches.

## Day 9

Really tough day. Part one was almost trivial, since it reused most of the parsing from the previous day. Part two stumped me for a long time, trying to debug functions for intersection and interior checks. Eventually, I discovered the issue was not determining the correct rectangle, but that I was calculating the area as `abs(x - other.x + 1) * ...` instead of `(abs(x - other.x) + 1) * ...`, and had gotten lucky with that working on part one. 

## Day 10

Part one was fairly straightforward to brute force, but took about 20 seconds, which was not promising for part two. After some optimization, it still was much to slow for part two. I was unable to find any algorithmic solution that ran in reasonable time for part two, but did think there might be a linear algebra approach to be taken. After a quick check, that seems to be the only way to do it, so I'll leave it for another time.

## Day 12

I was going to skip this day entirely, after reading the prompt, writing this kind of packing algorithm would take so long. Usually, I finish the day before checking the work slack thread about it, but today it revealed that there was in fact no packing required, just counting the squares was enough. I tried that too, and got the right answer, but it feels sorta anticlimatic? In that it is not a general solution to the question, but a shortcut that works for the specific given input.

## Conclusion

I'm happy with the amount of puzzles I solved this year. As stated in my goal, I completed all the days (aside from the linear algebra part two).
Additionally, I only had to look up hints for day 9, to double check where I was stuck, and day 12, which I would have otherwise skipped.
I very much like this 12 day format, and hope it returns next year.

All my solutions can be found on my [github repo.](https://github.com/p3l6/advent-of-code/tree/main/2025/AoC)
