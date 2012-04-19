---
layout: post
title: "Performance Decrease Using env?"
description: ""
tags: [python, performance, env, shell, script, bash]
---
{% include JB/setup %}

This questions popped up the other day on [Hacker News][hn] about why Google's [Python style guide][go-py] specified the use of `#!/usr/bin/python` over `#!/usr/bin/env python`. The latter loads environmental variables before running python leading to more portable code. Some users use a different Python interpreter than the system's default (e.g. PyPy, or custom Python install on a shared host) which would otherwise cause problems. Some of the commentors assumed there was overhead involved.

It's fairly straightforward to test, I created two files called `foo_env.py` and `foo_sys.py` respectively:

{% highlight python %}
#!/usr/bin/env python
print("foobar");

#!/usr/bin/python
print("foobar");
{% endhighlight %}

I then wrote a wrapper script to loop it 5000 times:

{% highlight bash %}
#!/usr/bin/env bash
for i in {1..5000}; do
    ${1} >/dev/null
done
{% endhighlight %}

The results:

    $ time ./testloop.sh ./foo_env.py
    ./testloop.sh ./foo_env.py  205.67s user 23.59s system 96% cpu 3:56.77 total

    $ time ./testloop.sh ./foo_sys.py
    ./testloop.sh ./foo_sys.py  202.81s user 22.51s system 97% cpu 3:51.90 total

There you go, **using `env` results in 2.1% overhead**. Marginal for most cases, but for 2.1% overhead is enough justification for others. Google-sized companies are running on standard environments anyway so the difference is worth it.

[hn]: https://news.ycombinator.com/item?id=3861617
[go-py]: http://google-styleguide.googlecode.com/svn/trunk/pyguide.html
