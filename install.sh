#!/bin/sh
# 2014.01.28 by sea
#
#	Variables
#
	app=tui
	[[ ! -f install.sh ]] && cd $(dirname $0)
	[[ -d /usr/bin ]] && \
		DIR_BIN=/usr/bin || \
		DIR_BIN=/bin
	DIR_APP=/usr/share/$app
	DIR_CFG=/etc/$app
	DIR_DOC=/usr/share/doc/$app
	DIR_MAN1=/usr/share/man/man1
	DIR_TPL=$DIR_APP/templates
	for tDir in $DIR_APP $DIR_CFG $DIR_DOC $DIR_MAN1; do [ ! -d $tDir ] && mkdir -p $tDir;done
#
#	Initall to Environment
#
	read -p "Press enter to install $app OR press 'CTRL+c' to abort"
	mkdir -p $DIR_APP $DIR_CFG $DIR_MAN1 $DIR_TPL #$DIR_MAN8
	cp README.md $DIR_APP
	cp bin/* $DIR_BIN
	cp conf/* $DIR_CFG
	cp docs/[A-Z]* $DIR_DOC
	cp docs/* $DIR_APP
	cp man/*1 $DIR_MAN1
	cp uninstall.sh $DIR_APP
	cp templates/* $DIR_TPL
	
	source tui
	MSG="Installed $app"
	tui-printf "$MSG" "$WORK"
	tui-status $? "$MSG"
