# docs
All documentation would go here

## Setting Up Development Environment
Steps for setting up development environment for Building FlexSwitch Debian Package for Dell S6000 Platform running Dell NAS.

> - Install Ubuntu 16.04.1 LTS.

> - Install dependent packages

	sudo apt-get update
	sudo apt-get install build-essential git fabric

> - Add following in /etc/apt/sources.list file

	deb https://dell-networking.bintray.com/sonic-apt jessie main

> - Update Apt Cache

	sudo apt-get update

> - Install Dell CPS development libraries and header files

	wget http://ftp.us.debian.org/debian/pool/main/h/hiredis/libhiredis0.10_0.11.0-4_amd64.deb
	sudo dpkg -i libhiredis0.10_0.11.0-4_amd64.deb 
	sudo apt-get install libsonic-common-dev libsonic-db-sql-dev libsonic-object-library1 libsonic-object-library-dev libsonic-model-dev 

> - Install Golang

	wget https://storage.googleapis.com/golang/go1.5.2.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf go1.5.2.linux-amd64.tar.gz

> - Setting OPX-FlexSwitch Repository

	mkdir git
	cd git
	git clone https://github.com/open-switch/opx-flxreltools.git reltools
	cd reltools
	fab setupDevEnv

> -  Update .bashrc with following:

	export PATH=$PATH:/usr/local/go/bin
	export SR_CODE_BASE=$HOME/git
	export GOPATH=$SR_CODE_BASE/snaproute/:$SR_CODE_BASE/external/:$SR_CODE_BASE/generated/

> - Run following command

	bash
	cd /home/snaproute/git/reltools

> - Build FlexSwitch Package

	python makePkg.py

> - Look for flexswitch_dellCPS-s6000-snaproute_*_amd64.deb /home/snaproute/git/reltools directory 
