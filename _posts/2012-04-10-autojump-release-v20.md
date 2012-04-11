---
layout: post
title: "Autojump Release v20"
description: ""
tags: [autojump, release, github, cli]
---
{% include JB/setup %}

I just pushed out autojump release v20 onto GitHub this afternoon. Most of the changes from v19 is polish related: better documentation, better installation/unstallation tools when using the source version, bug fixes, etc.

If you spend any significant time at the command line, I suggest giving it a try by [downloading](https://github.com/joelthelion/autojump/downloads) the source or checking out the [code](https://github.com/joelthelion/autojump). Feel free to shoot any suggestions or problems on the [issues](https://github.com/joelthelion/autojump/issues) page.

**Release Notes**:

- Man page and --help has been overhauled to provide better documentation and usage scenarios.
- Installation scripts now act dependent on current environmental settings.

If run as root, will do a global install. Installation script also detects which version to install (bash or zsh) dependent on $SHELL.  Both of these behaviors can be overridden using --local/--global or --bash/--zsh arguments.

- Uninstallation script added, will remove both global and local installations but ignores database.
- Symlinks can be preserved as database entries, refer to man page for more details.
- This change log added to better help package maintainers keep track of changes between releases.
- Miscellaneous bug fixes.
