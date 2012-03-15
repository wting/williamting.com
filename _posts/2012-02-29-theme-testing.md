---
layout: post
title: "Theme Testing"
tags: [jekyll, theme, markdown]
---
{% include JB/setup %}

This is just a simple post to help me test personal customizations of Yuya
Saito's [the-minimum](https://github.com/studiomohawk/jekyll-theme-the_minimum) theme.

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

### C++ (example 1)

{% highlight cpp %}
    // sequence template
    #include <iostream>
    using namespace std;

    template <class T, int N>
    class mysequence {
        T memblock [N];
      public:
        void setmember (int x, T value);
        T getmember (int x);
    };

    template <class T, int N>
    void mysequence<T,N>::setmember (int x, T value) {
      memblock[x]=value;
    }

    template <class T, int N>
    T mysequence<T,N>::getmember (int x) {
      return memblock[x];
    }

    int main () {
      mysequence <int,5> myints;
      mysequence <double,5> myfloats;
      myints.setmember (0,100);
      myfloats.setmember (3,3.1416);
      cout << myints.getmember(0) << '\n';
      cout << myfloats.getmember(3) << '\n';
      cout << "Example Post" << endl;
      return 0;
    }

{% endhighlight %}

### C++ (example 2)

{% highlight cpp %}

    /*
     * Multi-line comment block
     */

    #include <iostream>
    #include <vector>
    #include <string>
    #include <algorithm>
    #include <functional>

    class Person {
      private:
        std::string name;
      public:
        //...
        void print () const {
            std::cout << name << std::endl;
        }
        void printWithPrefix (std::string prefix) const {
            std::cout << prefix << name << std::endl;
        }
    };

    void foo (const std::vector<Person>& coll)
    {
        using std::for_each;
        using std::bind2nd;
        using std::mem_fun_ref;

        // call member function print() for each element
        for_each (coll.begin(), coll.end(),
                  mem_fun_ref(&Person::print));

        // call member function printWithPrefix() for each element
        // - "person: " is passed as an argument to the member function
        for_each (coll.begin(), coll.end(),
                  bind2nd(mem_fun_ref(&Person::printWithPrefix),
                          "person: "));
    }


    void ptrfoo (const std::vector<Person*>& coll)
                                      // ^^^ pointer !
    {
        using std::for_each;
        using std::bind2nd;
        using std::mem_fun;

        // call member function print() for each referred object
        for_each (coll.begin(), coll.end(),
                  mem_fun(&Person::print));

        // call member function printWithPrefix() for each referred object
        // - "person: " is passed as an argument to the member function
        for_each (coll.begin(), coll.end(),
                  bind2nd(mem_fun(&Person::printWithPrefix),
                          "person: "));
    }

    int main()
    {
        std::vector<Person> coll(5);
        foo(coll);

        std::vector<Person*> coll2;
        coll2.push_back(new Person);
        ptrfoo(coll2);
    }
{% endhighlight %}

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
