---
layout: post
title: "Set Up Python and Django on Dreamhost"
description: ""
tags: [python, django, dreamhost, pythonbrew, virtualenv]
---
{% include JB/setup %}

## Overview

Dreamhost is stable, cheap, web hosting with good support. However one of the biggest drawbacks is the outdated Ruby and Python installations on the Debian servers. At the time of this writing, the latest Python version is v2.7.3 while the server is lagging behind on v2.5.2.

While I've mentioned how simple it is to [upgrade and setup Ruby on Rails for Dreamhost][ror], the process is streamlined due to RVM's maturity. Unfortunately the Python stack has no equivalent, instead using a plethora of tools to provide the same functionality via [pythonbrew][pb], [pip][pip], and [virtualenv][venv].

Trying to install a custom Python environment has been an exercise in frustration, but hopefully the instructions below can help others.

## Install Python

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

3. Add the following lines at the end of your `~.bashrc`:

        export PATH=~/opt/python-2.7.3/bin:"${PATH}"
        export PYTHONPATH=~/opt/python-2.7.3/lib:"${PYTHONPATH}"

4. Reload configuration.

        $ source ~/.bashrc

5. Confirm you're using the new Python installation:

        $ which python
        $ python --version
        $ echo $PYTHONPATH

## Install Python Tools

1. Install `setuptools`. Download the correct version to match your Python installation [here](http://pypi.python.org/pypi/setuptools#files).

        $ cd ~/tmp
        $ wget http://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg
        $ sh ./setuptools--0.6c9-py2.7.egg

2. Install `pip`:

        $ curl -L https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python

3. Install `virtualenv`:

        $ pip install virtualenv

4. Create an isolated environment called test:

        $ virtualenv test

5. Install Django:

        $ pip install django

6. Clean up installation files:

        $ rm -rf ~/tmp

## Final Words

It was a long road, but now you're ready to start hosting Django apps on your Dreamhost account!

[pb]: http://pypi.python.org/pypi/pythonbrew/
[pip]: http://www.pip-installer.org/en/latest/index.html
[ror]: http://williamting.com/2012/04/02/ror-setup-on-dreamhost
[venv]: http://pypi.python.org/pypi/virtualenv
