#!/bin/bash
#
set -e
cd $MYOS/sources
rm -rf e2fsprogs-1.45.5
tar xf e2fsprogs-1.45.5.tar.gz
cd e2fsprogs-1.45.5

./configure --host=${MYOS_TARGET} --prefix=/usr
make
make install DESTDIR=${MYOS}



cd $MYOS/sources
rm -rf e2fsprogs-1.45.5

