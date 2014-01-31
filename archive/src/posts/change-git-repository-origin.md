Author: William Ting
Date: 2012-03-14
Title: Change Git Repository Origin
Tags: git, github, repository, vcs, origin

When you first clone a repository, git will automatically create a remote
address called origin and check out the master branch.

As time goes on, sometimes you want to change the origin or default repository
for a plethora of reasons.

### Adding new repository, moving the old one

First, rename or delete the origin repository.

    $ git remote rename origin github

Then add the new default repository location.

    $ git remote add dreamhost dh:~/git/wting.github.com.git

### Switch branch to track new remote

    $ git push -u dreamhost

#### Manual Method

You can also make this change by editing `.git/config` to set the default
remote:

    [branch "master"]
    remote = dreamhost
    merge = refs/heads/master

Afterwards, pulls and pushes should now be using the new default repository.
