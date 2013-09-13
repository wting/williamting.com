## About

This is the code for my blog at [williamting.com](http://williamting.com/),
built with [Pelican](http://pelican.notmyidea.org/en/2.8/index.html).

## Installation

**Setup virtual environment**

1. `sudo pip install virtualenvwrapper`
2. `mkvirtualenv williamting.com`

**Install LESS Compiler**

1. `sudo npm install -g less` (via [npm](https://npmjs.org/package/less))

**Clone site and install Pelican**

1. `git clone https://github.com/wting/williamting.com.git`
2. `cd williamting.com`
3. `pip install pelican`

**Initialize and update submodules** (to use [pelican-svbtle theme][svbtle])

1. `git submodule init`
2. `git submodule update`

**Build and run the site locally**

1. `make local`

## License

Content in the following directories is copyrighted by William Ting. No reuse is
allowed without permission.

    src/images/
    src/pages/
    src/posts/

All other directories and files are MIT Licensed unless otherwise defined.

## Theme Info

The theme source is available in a separate [repository][svbtle].

[svbtle]: https://github.com/wting/pelican-svbtle
