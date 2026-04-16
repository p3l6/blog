---
title: Git
---

## Revision specifiers <!-- Variable -->

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

## Bisect <!-- Builtin -->

Use `git bisect` to quickly determine what commit introduced a change, usually a bug.

* `git bisect start`
* `git bisect good a1b54ff3` Mark an earlier commit that works
* `git bisect bad master` Mark a later commit that doesn't work
	* Repeatedly test the checkouts, running `git bisect bad|good|skip` for each
* Eventually, git will report the first commit that broke
* `git bisect reset` To end the session

## Attributes <!-- Attribute -->

* Attributes can mark files as machine generated, non-diffable, non-mergable, etc
* Attributes specified in `.gitattributes` can be overridden in `.git/info/attributes`

## Change branch without tree <!-- Command -->

This will update the current branch, without changing any files.
The difference between the two points will be left as uncommitted changes.

1. `git checkout workingTree`
2. `git checkout --detach`
3. `git reset --mixed destination`
4. `git checkout destination`

## Diff <!-- Command -->

Git's diff can be used on arbitrary files or folders, even if they are in separate repos or no repos at all.

`git diff --no-index current/ base/`

## Merge to squash <!-- Command -->

This re-writes a traditional merge commit into a squashed merge commit.
Any dependent tree's will have to be rebased onto the new commit. Also this will require force push.

1. Have the merge commit branch checked out
2. `git reset --hard HEAD~1`
3. `git cherry-pick -m 1 HEAD@{1}`

## Interop with an svn repo <!-- Section -->

```bash
git svn clone <svn url> -s --prefix=origin/
git svn clone <svn url>/trunk --prefix=origin/ # clone without tags and branches
git svn fetch # gets new svn commits onto origin/git-svn, can continue a failed clone sometimes
# ...use git normally...
git svn rebase # pulls down, rebases current work on top, creates local commits. instead of pull
git svn dcommit
# ...if using topic branches, rebase them onto master instead of merging.
# ...don't push to git repos, since commits get rewritten when using dcommit
git svn find-rev r1234
```

## Rebase stacked branches  <!-- Command -->

Adapted from [Git rebase docs](https://git-scm.com/docs/git-rebase)

In the following situation, there is a stacked feature branch, and topicA has been squash merged to main.
We want to rebase the commits from topicB back onto main.

```
                        H---I---J topicB
                       /
              E---F---G  topicA
             /
A---B---C---D---EFG’  main
```

The command `git rebase --onto main topicA topicB` makes the following change

```
                   E---F---G  topicA
                 /      H'--I'--J'  topicB
                |     /
    A---B---C---D---EFG’  main
```

This could also be useful when topicB does not depend on topicA, regardless of topicA being merged.
