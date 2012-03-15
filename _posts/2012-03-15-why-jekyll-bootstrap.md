---
layout: post
title: "Why Jekyll (Bootstrap)?"
tags: [jekyll, web, blog, markdown, git, github]
---
{% include JB/setup %}

There are plenty of blogging platforms available, from microblogging platforms
such as Tumblr to heavyweights like WordPress.  Why use Jekyll?

If the idea of typing a post in your preferred text editor in Markdown (or
Textile), while using git to track changes and `git push` to deploy your site
sounds appealing then Jekyll might be for you.

Jekyll is a parsing engine that builds a static website by parsing your Markdown
files and assembling the layout based on a template. There are no databases to
set up and manage, and GitHub will host your site for free (using [GitHub
Pages](http://pages.github.com/)).

The great thing about this setup is that you directly control the content in
portable, flat text files. I've blogged on and off over the years on various
platforms, and frankly I've lost track of many posts buried in random databases.

Most (if not all) security issues are eliminated by not using databases and
server side scripting. There is no need need to constantly worry about logging
in to an individually hosted WordPress blog to patch the most recent 0-day
exploit.

Using static over dynamic pages also yields reliability and performance
advantages. Traditional blogging software such as WordPress have to use a
caching layer to serve static content.

To clarify, Jekyll is not a blogging software. It is minimalistic and efficient
at generating static web sites from Markdown and template files. The drawback is
you have to code all the front end templates from scratch. However, this is
where [Jekyll Bootstrap](http://jekyllbootstrap.com/) comes in.

Jekyll Bootstrap builds on top of Jekyll by adding modular theming, default
templates, and other niceties such as Google Analytics, and Disqus commenting.
By following the front page directions you can have a blog up in ~5 minutes.

To see a few demos or designs of other Jekyll-powered blogs, take a look at this
[list](https://github.com/mojombo/jekyll/wiki/sites). Otherwise feel free to
[fork this website](https://github.com/wting/williamting.com).
