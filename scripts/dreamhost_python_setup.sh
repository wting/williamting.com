#!/usr/bin/env bash
# Written by William Ting for the following blog post:
# http://williamting.com/2012/04/18/django-setup-on-dreamhost/

rcfile="${HOME}/.bashrc"
version="2.7.3"
setuptools_version="2.7"
tmp_dir="${HOME}/tmp-${RANDOM}"

if [[ ${#} == 0 ]]; then
	echo "Option --pythonbrew or --source required."
	exit 1
fi

function install_tools {
	# Install setuptools
	wget http://pypi.python.org/packages/${setuptools_version}/s/setuptools/setuptools-0.6c11-py${setuptools_version}.egg
	sh ./setuptools--0.6c9-py${setuptools_version}.egg

	# Install pip
	curl -L https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python

	# Install django
	pip install django
}

if [[ ${1} == "--pythonbrew" ]]; then
	mkdir ${tmp_dir} || exit 1
	cd ${tmp_dir}

	# Install pythonbrew
	curl -L https://raw.github.com/utahta/pythonbrew/master/pythonbrew-install | bash

	# Modify rcfile:
	echo "# Load pythonbrew" >> ${rcfile}
	echo "alias pb='pythonbrew'" >> ${rcfile}
	echo "export PYTHONPATH=~/.pythonbrew/pythons/Python-${version}/lib" >> ${rcfile}
	echo "[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc" >> ${rcfile}
	echo "" >> ${rcfile}

	alias pb='pythonbrew'
	export PYTHONPATH=~/.pythonbrew/pythons/Python-${version}/lib
	[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

	# Install Python
	pythonbrew install ${version}
	pythonbrew switch ${version}

	# Install commonly used tools, django
	install_tools

	# Initialize virtualenv
	pythonbrew venv init

	# Wrapup
	cd ${HOME}
	rm -fr ${tmp_dir}

	echo
	echo "pythonbrew environment installed, pythonbrew is aliased to 'pb'."
	echo
	echo "To remove this environment, delete ~/.pythonbrew and remove the lines from your ${rcfile}."
	echo
	echo "Refer to pythonbrew documentation for more details:"
	echo
	echo "    http://pypi.python.org/pypi/pythonbrew/"
	echo
	echo "Please run:"
	echo
	echo "    source ${rcfile}"
	echo "    pb switch ${version}"
	echo
elif [[ ${1} == "--source" ]]; then
	mkdir ${tmp_dir} || exit 1
	cd ${tmp_dir}

	# Install Python
	wget http://python.org/ftp/python/${version}/Python-${version}.tgz
	tar -xvzf Python-${version}.tgz
	cd Python-${version}
	./configure --prefix=$HOME/opt/python-${version}
	make && make install

	# Modify rcfile:
	echo "# Load custom python installation" >> ${rcfile}
	echo -e "export PATH=~/opt/python-${version}/bin:\${PATH}" >> ${rcfile}
	echo "export PYTHONPATH=~/opt/python-${version}/lib" >> ${rcfile}
	echo "" >> ${rcfile}

	export PATH=~/opt/python-${version}/bin:\${PATH} >> ${rcfile}
	export PYTHONPATH=~/opt/python-${version}/lib >> ${rcfile}

	# Install commonly used tools, django
	install_tools

	# Install virtualenv
	pip install virtualenv

	# Wrapup
	cd ${HOME}
	rm -fr ${tmp_dir}

	echo
	echo "Custom Python environment installed to ~/opt/python-${version}"
	echo
	echo "To remove this environment, delete ~/opt/python-${version} and remove the lines from your ${rcfile}."
	echo
	echo "Please run:"
	echo
	echo "    source ${rcfile}"
	echo
else
	echo "Invalid argument. Option --pythonbrew or --source required."
	exit 1
fi
