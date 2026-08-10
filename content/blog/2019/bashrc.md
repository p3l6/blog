---
title: Bashrc
summary: Some useful bash shortcuts that I have used.
date: 2019-02-25
---

So this past week, I spent some time evaluating and switching to the Z shell. So far I'm enjoying the added features over osx's stock bash version. However, it did take some time to convert my bashrc environment into zshrc and options, as well as exploring new options and features available in zsh. I learned quite a bit so far about zsh, and expect to learn more in the coming weeks, however today I just wanted to look at some things in bash.

As I was going through my bashrc file, I was reminded a few things about it that I enjoy, and thought I should highlight a few of them. In no particular order, here we go!

```bash
function up {
  path="";
  if [ $1 ]; then
    for i in $(seq 1 $1); do
      path=$path"../";
    done;
  else
    path="../";
  fi;
  cd $path;
}
```

This function started as a shortcut for `cd ..` but later morphed into taking an optional integer argument that would go up the specified number of directories. As in `up 4`. It does this by building a string of repeated `../`, and then changing to that. I wanted to do the whole change in one cd step, so as to preserve the ability to use `cd -` to return to the previous directory.

```bash
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
export HISTCONTROL=ignoredups
```

These are three separate bash options.
* The first one is the most important, it allows you to match files for completion case-insensitively. It will correct the case for you.
* The second one is perhaps more controversial for people, but it makes it so you only have to tab once to get the list of possible matches to show up, instead of getting a beep first and having to tab again. When I first added this, I did end up hitting it twice most of the time.
* The last one keeps duplicates out of your history, which is useful when trying to execute previous commands. If you do something like `make build` a bunch of times in a row, you'll still only have to use the up arrow twice to get to the `make clean` that you ran before them.

```bash
alias which='type -a'
```

Basically, this is a better version of which that is already built in. It lists every version found in the path, in path order. It will expand aliases and tell you them as well.

```bash
function wtf () ( shopt -s dotglob; du -shc * | sort -h; )
```

As in "What are all these files doing here"? This is a simple one that just sorts the file sizes in your current directory, to easily see what part of your source directory is suddenly taking a huge amount of disk space. A one line quick disk sweeper.

```bash
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2'
```

A fun little shortcut that prints out your current ip addresses, instead of having to look through all the interfaces.

```bash
function bash_git_branch
{
  # first option branch name, second option is detached head
  _br=$(git symbolic-ref -q --short HEAD 2> /dev/null || git  rev-parse --short HEAD 2> /dev/null)
  if [ ! -z $_br ]; then printf "[%s]" $_br; fi
}
PS1='\[\e[0;32m\]$(bash_git_branch)\[\e[m\]:\[\e[0;36m\]\W\[\e[m\]\$ '
```

Lastly, and probably most importantly, I add the current git branch to my prompt. I also like having only the name of the current directory, not the full path, after that. If you are not in a git directory, it omits that part of the prompt. It will either use the name of the current branch, or the short version SHA when in a detached head state.

Thats it for now! If you want to look more at my bash profile, or see what I currently have for my in progress Z shell environment, you can see all my dotfiles on [my GitHub](https://github.com/p3l6/env).
