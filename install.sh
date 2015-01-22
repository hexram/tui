#!/bin/sh
# 2014.12.08 by sea
#
#	Variables
#
	app=tui
	[ ! -f install.sh ] && cd "$(dirname '$0')"
	[ -d /usr/bin ] && \
		DIR_BIN=/usr/bin || \
		DIR_BIN=/bin
	[ -d /etc/bash_completion.d ] && \
		DIR_COMPL=/etc/bash_completion.d || \
		DIR_COMPL=""
	DIR_APP=/usr/share/$app
	DIR_CFG=/etc/$app
	DIR_DOC=/usr/share/doc/$app
	DIR_MAN1=/usr/share/man/man1
	DIR_TPL=$DIR_APP/templates
	for tDir in $DIR_APP \
			$DIR_CFG \
			$DIR_DOC \
			$DIR_MAN1 \
			$DIR_TPL \
			$DIR_APP/conf \
			$DIR_APP/conf.etc
	do	[ ! -d $tDir ] && \
			mkdir -p $tDir && printf "*\tCreated missing dir: $tDir\n"
	done
#
#	Initall to Environment
#
	printf "\n\n\t"
	read -p "Press enter to install $app OR press 'CTRL+c' to abort"
	mkdir -p $DIR_APP $DIR_CFG $DIR_MAN1 $DIR_TPL #$DIR_MAN8
	cp README.md $DIR_APP
	cp tui_compl.bash /etc/bash_completion.d/
	cp bin/* $DIR_BIN
	cp conf.etc/* $DIR_CFG
	cp conf.etc $DIR_APP/conf.etc
	cp conf.home/* $DIR_APP/conf
	cp -R docs/[A-Z]* $DIR_DOC
	cp -R docs/* $DIR_APP
	cp man/*1 $DIR_MAN1
	cp uninstall.sh $DIR_APP
	cp -R templates/* $DIR_TPL
	#cp profile.d/* /etc/profile.d
	RET=$?
	tui-status $? "Installed $app"
#	tui-yesno "Remove these tempfiles here ($pwd)/* ?" && rm ./*
