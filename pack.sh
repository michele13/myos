#!/bin/bash
set -e
export top=$(pwd)

source config.txt
mkdir -p $top/target
cd ${MYOS}

if [ -f $top/target/rootfs-${MYOS_CPU}.tar.xz ]; then 
	echo File already exists! Exiting..
	exit 1
fi

echo Creating Tarball, please wait..
tar cpvJf $top/target/rootfs-${MYOS_CPU}.tar.xz \
	--exclude=./cross-tools \
      	--exclude=./sources \
	--owner=0 --group=0 . /dev/console /dev/null

