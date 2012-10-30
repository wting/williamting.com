Author: William Ting
Date: 2012-04-18
Title: Set Up Python and Django on Dreamhost
Tags: python, django, dreamhost, pythonbrew, virtualenv

### Overview

Dreamhost is stable, cheap, web hosting with good support. However one of the biggest drawbacks is the outdated Ruby and Python installations on the Debian servers. At the time of this writing, the latest Python is v2.7.3 while the server is still on v2.5.2.

While I've mentioned how simple it is to [set up Ruby on Rails for Dreamhost][ror], the process is streamlined due to RVM's maturity. Unfortunately the Python stack has no equivalent, instead using a plethora of tools to provide the same functionality via [pythonbrew][pb], [pip][pip], and [virtualenv][venv].

Trying to install a custom Python environment has been an exercise in frustration, but hopefully the following instructions can help others.

### Automatic Install
I've written a [script](https://gist.github.com/2839765) to help streamline the instructions below. Log in to your Dreamhost account via ssh and download the script:

    $ ssh user@domain.com
    $ git clone git://gist.github.com/2839765.git ~/tmp
    $ cd ~/tmp

It's a fairly simple script, so make sure to read it over to make sure there is nothing malicious.

The script defaults to `.bashrc` and Python v2.7.3. To change these settings, edit the script and modify the following variables: `rcfile`, `version`, `setuptools_version`. Only v2.x is supported through the script as setuptools is not necessary for Python v3.x.

Run the script, choosing `--pythonbrew` or `--source` installation type.

    $ bash ./dreamhost_python_setup.sh --pythonbrew

### Create Isolated Environment, Install Django

1. Create an isolated environment called test and begin using it:

        $ pb venv create test
        $ pb venv use test

2. Install Django:

        $ pip install django

3. Install Python bindings for MySQL. Download it [here](https://sourceforge.net/projects/mysql-python/).

        $ wget https://downloads.sourceforge.net/project/mysql-python/mysql-python/1.2.3/MySQL-python-1.2.3.tar.gz
        $ tar -xvzf MySQL-python-1.2.3.tar.gz
        $ cd MySQL-python-1.2.3
        $ python setup.py build
        $ python setup.py install

<a name="final"> </a>
### Final Words

Don't forget to [enable Passenger](http://wiki.dreamhost.com/Passenger#Configuration_Steps) on your domain for web apps.

With this set up you now have an environment that can be easily updated or frozen at your discretion.

If you ever want to remove PythonBrew, either disable it by using `pythonbrew off` or delete the `~/.pythonbrew/` folder.

[pb]: http://pypi.python.org/pypi/pythonbrew/
[pip]: http://www.pip-installer.org/en/latest/index.html
[ror]: http://williamting.com/posts/2012/04/02/set-up-ruby-on-rails-on-dreamhost/
[venv]: http://pypi.python.org/pypi/virtualenv
