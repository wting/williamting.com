---
layout: post
title: "Change git repository origin"
tags: [git, github, repository, vcs]
---
{% include JB/setup %}

When you first clone a repository, git will automatically create a remote
address called origin and check out the master branch.

As time goes on, sometimes you want to change the origin or default repository
for a plethora of reasons.

First, rename or delete the origin repository.

    ╭─ting@noa ~/code/wting.github.com ‹ruby-1.9.3› ‹master*›
    ╰─➤  git remote rename origin github

Then add the new default repository location.

    ╭─ting@noa ~/code/wting.github.com ‹ruby-1.9.3› ‹master*›
    ╰─➤  git remote add origin dreamhost:~/git/wting.github.com.git

Afterwards you have to edit `.git/config` to set the default remote repository:

    [branch "master"]
    remote = github
    merge = refs/heads/master

Since we renamed origin to github it has been updated here as well. All we need
to is change it to point to the new default repository location:

    [branch "master"]
    remote = dreamhost
    merge = refs/heads/master

