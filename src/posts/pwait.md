Author: William Ting
Date: 2013-01-03
Title: Linux pwait
Tags: pwait, wait, linux, proctools
Status: published

I've been frustrated with the lack of [pwait][pw] on Linux for a while now.
[wait][w] exists, but it's limited by the fact that it can only monitor child
processes of the current shell.

The simplest version of a pwait is:

    $ while [ -e /proc/${pid} ]; do sleep 0.1; done

While simple and straightforward, it lacks a few things I've added into a more
robust Bash version:

    - monitoring multiple pids
    - monitoring processes based on name

Anyway, you can find `pwait` at this [GitHub repo][gh].

[pw]: http://www.freebsd.org/cgi/man.cgi?pwait
[w]: http://linux.die.net/man/3/wait
[gh]: https://github.com/wting/pwait
