---
layout: post
title: "Set Up Python and Django on Dreamhost"
description: ""
tags: [python, django, dreamhost, pythonbrew, virtualenv]
---
{% include JB/setup %}

<pre id="toc">
- <a href="#overview">Overview</a>
- <a href="#auto">Automatic Install</a>
- <a href="#pythonbrew">Manual Install via pythonbrew</a>
    - Install Python Tools
    - Create Isolated Environment, Install Django
- <a href="#source">Manual Install via Source Code</a>
    - Install Python Tools
    - Create Isolated Environment, Install Django
- <a href="#final">Final Words</a>
</pre>

<a name="overview"> </a>
### Overview

Dreamhost is stable, cheap, web hosting with good support. However one of the biggest drawbacks is the outdated Ruby and Python installations on the Debian servers. At the time of this writing, the latest Python is v2.7.3 while the server is still on v2.5.2.

While I've mentioned how simple it is to [set up Ruby on Rails for Dreamhost][ror], the process is streamlined due to RVM's maturity. Unfortunately the Python stack has no equivalent, instead using a plethora of tools to provide the same functionality via [pythonbrew][pb], [pip][pip], and [virtualenv][venv].

Trying to install a custom Python environment has been an exercise in frustration, but hopefully the instructions below can help others.

There are two methods of installation, from source or via pythonbrew. Pythonbrew helps streamline the process and is preferable. If you prefer installing from source, jump to the [source code instructions below](#source).

<a name="auto"> </a>
### Automatic Install

I've written a script to help streamline the instructions below. Log in to your Dreamhost account via ssh and download the script:

    $ ssh user@domain.com
    $ wget http://williamting.com/scripts/dreamhost_python_setup.sh

The script defaults to `.bashrc` and Python v2.7.3. To change these settings, edit the script and modify the following variables: `rcfile`, `version`, `setuptools_version`. Only v2.x is supported through the script as setuptools is not necessary for Python v3.x.

Run the script, choosing `--pythonbrew` or `--source` installation type.

    $ bash ./dreamhost_python_setup.sh --pythonbrew

That's it! Jump down to [final words](#final).

<a name="pythonbrew"> </a>
### Manual Install Python via pythonbrew

1. Run the following script to install into `~/.pythonbrew/`:

        $ curl -L https://raw.github.com/utahta/pythonbrew/master/pythonbrew-install | bash

2. Add the following lines to the end of `~/.bashrc`:

        [[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc
        export PYTHONPATH=~/.pythonbrew/pythons/Python-2.7.3/lib

    Unfortunately the `export PYTHONPATH` line is necessary and must be manually updated until the developer fixes this [bug](https://github.com/utahta/pythonbrew/issues/74).

3. Reload configuration.

        $ source ~/.bashrc

4. Install a Python version and begin using it.

        $ pythonbrew install 2.7.3
        $ pythonbrew switch 2.7.3

#### Install Python Tools

1. Install `setuptools`. Download the correct version to match your Python installation [here](http://pypi.python.org/pypi/setuptools#files).

        $ mkdir ~/tmp
        $ cd ~/tmp
        $ wget http://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg
        $ sh ./setuptools--0.6c9-py2.7.egg

2. Install `pip`:

        $ curl -L https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python

3. Clean up installation files:

        $ rm -fr ~/tmp

#### Create Isolated Environment, Install Django

1. Create an isolated environment called test to `~/.pythonbrew/venvs/Python-2.7.3/test`:

        $ pythonbrew venv init
        $ pythonbrew venv create test

2. Install Django:

        $ pip install django

For more information on how to use pythonbrew refer to the [documentation][pb].

<a name="source"> </a>
### Manual Install Python via Source Code

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

3. Add the following lines at the end of `~.bashrc`:

        export PATH=~/opt/python-2.7.3/bin:"${PATH}"
        export PYTHONPATH=~/opt/python-2.7.3/lib

4. Reload configuration.

        $ source ~/.bashrc

5. Confirm you're using the new Python installation:

        $ which python
        $ python --version
        $ echo $PYTHONPATH

#### Install Python Tools

1. Install `setuptools`. Download the correct version to match your Python installation [here](http://pypi.python.org/pypi/setuptools#files).

        $ cd ~/tmp
        $ wget http://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg
        $ sh ./setuptools--0.6c9-py2.7.egg

2. Install `pip`:

        $ curl -L https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python

3. Clean up installation files:

        $ rm -rf ~/tmp

4. Install `virtualenv`:

        $ pip install virtualenv

#### Create Isolated Environment, Install Django

1. Create an isolated environment called test to `~/test/`:

        $ virtualenv test

2. Install Django:

        $ pip install django

<a name="final"> </a>
### Final Words

Don't forget to [enable Passenger](http://wiki.dreamhost.com/Passenger#Configuration_Steps) on your domain for web apps.

With this set up you now have an environment that can be easily updated or frozen at your discretion.

It was a long road (unless you went the automatic installation route), but now you're ready to start hosting Django apps on your Dreamhost account!

[pb]: http://pypi.python.org/pypi/pythonbrew/
[pip]: http://www.pip-installer.org/en/latest/index.html
[ror]: http://williamting.com/2012/04/02/ror-setup-on-dreamhost
[venv]: http://pypi.python.org/pypi/virtualenv
