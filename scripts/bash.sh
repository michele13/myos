#!/bin/bash
#
set -e
cd $MYOS/sources
rm -rf bash-5.0
tar xf bash-5.0.tar.gz
cd bash-5.0

./configure --host=${MYOS_TARGET} --prefix=/usr --bindir=/bin \
	--without-bash-malloc \
	--docdir=/usr/share/doc/bash-5.0
make
make install DESTDIR=${MYOS}



cd $MYOS/sources
rm -rf bash-5.0

