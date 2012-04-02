---
layout: post
title: "Set Up Ruby on Rails on DreamHost"
tags: [ruby, rails, rvm, dreamhost, jekyll]
---
{% include JB/setup %}

Ruby on Rails has always been plagued with version discrepancies when developing
locally vs servers. If you're on a shared hosting plan, then you're also stuck
with an outdated version of Ruby on Rails dependent on your hosting provider to
update the environment. However if you have shell access, there is a way to work
around this limitation.

The steps below need to be performed on at a [DreamHost SSH
prompt](http://wiki.dreamhost.com/SSH), but should also be performed locally to
setup the same development environment.

### Setting Up RVM

[Ruby Version Manager](http://beginrescueend.com/) (RVM) is a great tool for
maintaining environment between different machines. This setup will install a
local single user version into `~/.rvm/`.

1. Install RVM, note the required space between the two angled brackets `< <`

        ➤ bash -s stable < <(curl -s
        https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)

2. Modify your `.bashrc` to add a path to RVM and to load it on new shells:

        ➤ PATH=$PATH:$HOME/.rvm/bin
        ➤ [[ -s ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm

3. Reload your shell

        ➤ source ~/.bashrc

4. Check any other necessary requirements and follow relevant instructions:

        ➤ rvm requirements

Read up on [Gem Sets](http://beginrescueend.com/gemsets/basics/) for even more
 control over gems compartmentalization.

### Setting Up Ruby on Rails

1. Install a Ruby version to work on:

        ➤ rvm install 1.9.3

2. Switch to the installed version of Ruby and make it default:

        ➤ rvm use 1.9.3 --default

3. Install Rails

        ➤ gem install rails

### DreamHost Setup

Follow these [configuration
steps](http://wiki.dreamhost.com/Passenger#Configuration_Steps)
to configure your domain on the DreamHost panel.

### Conclusion

With this configuration you have a stable environment that you can update at
your choosing, with the ability to use the latest Rails (v3.2.3) instead of the
outdated system version (v3.0.3).
