---
title: Great developer habits
year: 2019
---
### Organize
Things take longer if you don’t have organized and tidy workspaces. Use xcode groups by function. Keep in sync with file structure. Use a different storyboard for each feature, and use storyboard references.
Stay modern: keep your xcode project up to date.
Get rid of unused code. It’s in source control anyway. Have a zero warning policy, otherwise they will accumulate.

### Track
Use source control of course. Small, regular commits. Write useful commit messages. Use commits as if you were a large team, even as a solo developer.

### Document
Focus comments on why the code is, or it’s purpose. Not what is happening. Provide background and reasoning. Use descriptive variable names.
If you don’t add documentation for a function or module means you have to relearn the documentation in your mind whenever you want to reuse it.

### Test
Write tests, as they will catch bugs and prevent future bugs later.

### Analyze
Use the network link conditioner, to simulate data networks in apps. Take advantage of the sanitizers and checkers, leave enabled mostly.
Xcode disk tracker will show open files and read/write rates.

### Evaluate
Do code reviews.  Other peoples opinions and thoughts is better than developing in a vacuum. Helps with code consistency and team familiarity.
Even if you are a solo dev, consider a code review exchange or meetup groups.
Understand each change you are looking at, don’t skim. Actually build the project. And run it, and the tests!

### Decouple
Use packages and frameworks.

### Manage
Dependencies, do your due diligence of each. And its subdepencies. Evaluate it’s usage of private data. Have a plan for if the project disapears or goes unmaintained.
