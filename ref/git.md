---
title: Git
layout: reference
---

## Git Revision Specifications
* SHA-1 or short SHA-1 (default first seven characters)
* Branch name
* RefLog shortnames, works for HEAD and branch names. 'git reflog' to see list or 'git reflog show master'
  * HEAD@{5} fifth HEAD ago
  * master@{yesterday}
  * @{upstream} current branch origin
* HEAD^ parent of HEAD
* d921970^2 second parent of d921970, only useful for merges. does not mean grandparent
* HEAD~ parent of HEAD (equivalent to HEAD^)
* HEAD~2 grandparent of HEAD (equivalent to HEAD^^)
* A..B commits in B that are not in A
* A..  equivalent to A..HEAD (also ..B)
* A...B commits in either but not both, often with --left-right


## Git
* diff by word instead of line `git diff --color-words`
* export a stash `git stash show -p > file.patch`
* see what will be cleaned `git clean --dry-run`
* abort a pull-triggered merge `:cq` then `git merge --abort`
* delete stale branches (origin/feature, not feature) `git remote prune origin`
* `git commit -n` skips running the commit git hooks

## Git bisect
* git bisect start
* git bisect good a1b54ff3
* git bisect bad master
	* git bisect bad
	* git bisect good
	* git bisect skip
* git bisect reset

## Squashing topic branches
```sh
git checkout develop && git pull
git checkout topic   && git rebase develop
# fix conflicts if any...
git checkout develop && git merge --squash topic
git commit
```

## Git Svn
```sh
git svn clone <svn url> -s --prefix=origin/
git svn clone <svn url>/trunk --prefix=origin/ # clone without tags and branches
git svn fetch # gets new svn commits onto origin/git-svn, can continue a failed clone sometimes
...use git normally...
git svn rebase # pulls down, rebases current work on top, creates local commits. instead of pull
git svn dcommit
...if using topic branches, rebase them onto master instead of merging.
...don't push to git repos, since commits get rewritten when using dcommit
git svn find-rev r1234
```

## Tagging Releases
```sh
# make sure your develop is up to date
git checkout develop
git pull

# do the same with production
git checkout production
git pull

# merge the changes from develop to production
git merge develop
# or specify the SHA of the commit to merge, if older than the current develop branch,
  git merge 5bbd3ef

# tag the current top of master
git tag -a v18.1.0 -m 'version 18.2.0' <commit id>
# the most important thing here is the -a, for annotated tag.

# by default, tags aren't pushed with a standard push
git push                             # push production
git push --tags                      # push new tag

# remember to go back to the develop branch for working
git checkout develop
```

## Rebases on dependent topics
Adapted from [Git rebase docs](https://git-scm.com/docs/git-rebase)

Another example of `—onto` option is to rebase part of a branch. If we have the following situation: 
```
                            H---I---J topicB
                           /
                  E---F---G  topicA
                 /
    A---B---C---D---EFG’  master
```
then the command
`git rebase --onto master topicA topicB`
would result in:
```
                   E---F---G  topicA
                 /      H'--I'--J'  topicB
                |     /
    A---B---C---D---EFG’  master
```
This is useful when topicB does not depend on topicA.  
Or when, **topicA has already been squashed and merged onto master.**

## Attrbutes
* Attrributes can mark files as machine generated, non-diffable, non-mergable, etc
* Attributes specified in `.gitattributes` can be overridded in `.git/info/attributes`

## Diff arbitrary files
`git diff --no-index current/ base/`  
Git can be used to diff  arbitrary directory pairs.  
Either, both, or neither of the directories have need to even be in a git repository.


