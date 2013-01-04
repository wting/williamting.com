Author: William Ting
Date: 2013-01-04
Title: Resyncing .srt Files
Tags: srt, subtitles, shift, time, offset, sync
Status: published

I wrote another one-off tool last night to fix some of an issue that's been
plaguing me for a while. Sometimes when subtitles are off you can offset them in
VLC or XBMC, but it's only temporarily and usually has a +/- 10 second limit.

`srt-resync` is a simple tool that lets you offset subtitles like this:

    $ srt-resync [seconds] [srt_file]

It supports partial seconds and negative numbers, so if you find it useful go
ahead and get it [here][gh].

[gh]: https://github.com/wting/srt-resync
