Author: William Ting
Date: 2012-05-30
Title: Migrating from Jekyll to Pelican
Tags: pelican, hyde, jekyll, bootstrap, static, blog, generator, python, ruby, webdev

It was only a few months ago that I made my first foray into static site generators migrating from [WordPress to Jekyll][jb-switch]. Alas, I'm liable to try out different blogging engines like a woman tries out shoes.

While Jekyll was *good enough* for the first few months, inevitably I reached the point where I wanted to start digging into the internals. While I could poke around into Jekyll just fine, if I'm going to start hacking away I'd rather work on a Python project than Ruby. There's nothing particularly wrong with Ruby, but Python and Ruby overlap on the application stack and I'm entrenched in the Python camp.

For Ruby ecosystem, there's no doubt that Jekyll is king with extensive use in GitHub and many other places. However competitors in Python ecosystem isn't as clear cut. There's [Hyde][hy], [Pelican][pe], [Blogophile][bp], and [Poole][po] just to name a few.

I briefly entertained the idea of switching to Hyde, but ultimately decided on Pelican.

Driving my decision to switch to Pelican was based on a few things:

- great [documentation](http://pelican.notmyidea.org/en/latest/index.html)
- category / tag specific RSS feeds
- Jinja2 templating (as opposed to Liquid)
- simple, flexible layout

A few other standout features that didn't apply to me is multi-language support and easy import of WordPress content.

As a result, I spent the last two days creating a theme for use with Pelican. The [theme][th-sv] is based on [Svbtle.com][sv] while adding a few more features (Disqus commenting, code blocks, tag clouds, etc). As always, check out this website's [code][wt] for a feel of how simple and straightforward a Pelican site can be.

[jb-switch]: http://williamting.com/posts/2012/03/15/why-jekyll-bootstrap/
[th-sv]: https://github.com/wting/pelican-svbtle
[sv]: http://www.svbtle.com/
[hy]: http://ringce.com/hyde
[hy-new]: https://github.com/hyde/hyde
[bp]: http://blogofile.com/
[pe]: http://pelican.notmyidea.org/
[po]: https://bitbucket.org/obensonne/poole
[wt]: https://github.com/wting/williamting.com
