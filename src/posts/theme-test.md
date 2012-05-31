Author: William Ting
Date: 2012-04-25
Title: This Is A Theme Testing Post
Category: frontend, webdev
Tags: pelican, theme, testing, ui
Status: draft

## Paragraph, Link, Bold, Italics

*Vivamus* id dolor [ipsum](http://www.lipsum.com/). Nullam tellus **libero**,
pretium at interdum non, ullamcorper mollis lorem. Vestibulum eu tortor mauris,
id fringilla dolor.  Cras venenatis eleifend arcu, dapibus auctor felis feugiat
nec. Aliquam vel quam turpis. Aenean congue, quam at dignissim molestie, nisi
enim semper dolor, id dapibus nulla diam vel lorem. Nunc sit amet lorem purus, a
scelerisque lorem.

# h1 heading

## h2 heading

### h3 heading

#### h4 heading

##### h5 heading

###### h6 heading

## Unordered List

- alpha
- bravo
- charlie

## Ordered List

1. apple
2. banana
3. coconut

## Quotes

> Allow the president to invade a neighboring nation, whenever he shall deem it
> necessary to repel an invasion, and you allow him to do so whenever he may
> choose to say he deems it necessary for such a purpose - and you allow him to
> make war at pleasure.
>
> – Abraham Lincoln

## Code

### C++

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

### Python

    import re
    for test_string in ['555-1212', 'ILL-EGAL']:
    if re.match(r'^\d{3}-\d{4}$', test_string):
        print test_string, 'is a valid US local phone number'
        else:
        print test_string, 'rejected'

### Javascript

    $("#foo").css("background-color", "red");
    $("#foo").css("font-weight", "bold");

    // becomes:

    $("#foo").css({
            "background-color": "red",
            "font-weight": "bold"
            });

### CSS

    pre {
        margin: 0;
        padding: 0 0 0 20px;
        display: inline-block;
        border-left: 10px solid @accent;
        width: 600px;

        color: @black;
        background-color: @light-grey;
        font-family: 'Inconsolata', 'Consolas', 'Deja Vu Sans Mono', 'Droid Sans Mono', Courier New, monospace, serif;
        overflow-x: auto;
        .box-shadow;
    }
