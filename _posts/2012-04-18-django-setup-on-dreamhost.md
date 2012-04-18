---
layout: post
title: "Set Up Python and Django on Dreamhost"
description: ""
tags: [python, django, dreamhost, pythonbrew, virtualenv]
---
{% include JB/setup %}

## Table of Contents
<pre>
1 Overview
2 Install Python
  2.1 via pythonbrew
  2.2 via source code
3 VirtualEnv setup
  3.1 via pythonbrew
  3.2 via source code installation
</pre>

## 1 Overview

Dreamhost is stable, cheap, web hosting with good support. However one of the biggest drawbacks is the outdated Ruby and Python installations on the Debian servers. At the time of this writing, the latest Python version is v2.7.3 while the server is lagging behind on v2.5.2.

While I've mentioned how simple it is to [upgrade and setup Ruby on Rails for Dreamhost][ror], the process is streamlined due to RVM's maturity. Unfortunately the Python stack has no equivalent, instead using a plethora of tools to provide the same functionality via [pythonbrew][pb], [pip][pip], and [virtualenv][venv].

Trying to install a custom Python environment has been an exercise in frustration, but hopefully the instructions below can help others.

## 2 Install Python

There are two methods of installation, from source or via pythonbrew. Pythonbrew helps streamline the process and is preferable.

### 2.1 via pythonbrew

1. Run the following script to install into `~/.pythonbrew/`:

        $ curl -L https://raw.github.com/utahta/pythonbrew/master/pythonbrew-install | bash

2. Add the following lines to `~/.bashrc`:

        export PYTHONPATH=~/.pythonbrew/pythons/Python-2.7.2/lib
        [[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

    Unfortunately the `export PYTHONPATH` line is necessary and must be manually updated until the developer fixes this [bug](https://github.com/utahta/pythonbrew/issues/74).

3. Reload configuration.

        $ source ~/.bashrc

4. Install a Python version and begin using it.

        $ pythonbrew install 2.7.3 3.2.3
        $ pythonbrew switch 2.7.3

For more information on how to use pythonbrew refer to the [documentation][pb].

### 2.2 via source code

1. Download the preferred version of Python. Replace 2.7.3 with your preferred version.

        $ mkdir ~/tmp
        $ cd ~/tmp
        $ wget http://python.org/ftp/python/2.7.3/Python-2.7.3.tgz
        $ tar -xvzf Python-2.7.3.tgz
        $ cd Python-2.7.3

2. Configure Python and install it.

        $ ./configure --prefix=$HOME/opt/python-2.7.3
        $ make
        $ make install

3. Add the following lines to your `~.bashrc`:

        export PATH=~/opt/python-2.7.3/bin:"${PATH}"
        export PYTHONPATH=~/opt/python-2.7.3/lib

4. Reload configuration.

        $ source ~/.bashrc

5. Confirm you're using the new Python installation:

        $ which python
        $ python --version
        $ echo $PYTHONPATH

6. Afterwards you need to install `setup-tools`. Download the correct version to match your Python installation from [here](http://pypi.python.org/pypi/setuptools#files).

        $ cd ~/tmp
        $ wget http://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg
        $ sh ./setuptools--0.6c9-py2.7.egg

7. Download and install `pip`:

        $ curl -L https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python

8. Clean up installation files:

        $ rm -rf ~/tmp

## 3 Setting up Virtual Env

### 3.1 via pythonbrew

    $ pythonbrew venv init
    $ pythonbrew venev create proj

### 3.2 via source code installation

    $

[pb]: http://pypi.python.org/pypi/pythonbrew/
[pip]: http://www.pip-installer.org/en/latest/index.html
[ror]: http://williamting.com/2012/04/02/ror-setup-on-dreamhost
[venv]: http://pypi.python.org/pypi/virtualenv
