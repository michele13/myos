#!/bin/bash
#
set -e
cd $MYOS/sources
rm -rf tar-1.32 
tar xf tar-1.32.tar.xz
cd tar-1.32

FORCE_UNSAFE_CONFIGURE=1 \
	./configure --host=${MYOS_TARGET} --prefix=/usr --bindir=/bin

make
make install DESTDIR=${MYOS}

cd $MYOS/sources
rm -rf tar-1.32
