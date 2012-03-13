---
layout: post
title: "Example Post"
tags: [jekyll, theme, markdown]
---
{% include JB/setup %}

# h1 heading

## h2 heading

### h3 heading

#### h4 heading

##### h5 heading

###### h6 heading

## Paragraph, Link, Bold, Italics

*Vivamus* id dolor [ipsum](http://www.lipsum.com/). Nullam tellus **libero**,
pretium at interdum non, ullamcorper mollis lorem. Vestibulum eu tortor mauris,
id fringilla dolor.  Cras venenatis eleifend arcu, dapibus auctor felis feugiat
nec. Aliquam vel quam turpis. Aenean congue, quam at dignissim molestie, nisi
enim semper dolor, id dapibus nulla diam vel lorem. Nunc sit amet lorem purus, a
scelerisque lorem.

## Code

### Python

{% highlight python %}
    import re
    for test_string in ['555-1212', 'ILL-EGAL']:
        if re.match(r'^\d{3}-\d{4}$', test_string):
            print test_string, 'is a valid US local phone number'
        else:
            print test_string, 'rejected'
{% endhighlight %}

### Javascript

{% highlight javascript %}
    $("#foo").css("background-color", "red");
    $("#foo").css("font-weight", "bold");

    // becomes:

    $("#foo").css({
        "background-color": "red",
        "font-weight": "bold"
    });
{% endhighlight %}

## List

- alpha
- bravo
- charlie

1. apple
2. banana
3. coconut

## Quotes

> Allow the president to invade a neighboring nation, whenever he shall deem it
> necessary to repel an invasion, and you allow him to do so whenever he may
> choose to say he deems it necessary for such a purpose - and you allow him to
> make war at pleasure.
>
> -- Abraham Lincoln

## Reddit Disapproval Face **ಠ_ಠ**

That's all folks!
