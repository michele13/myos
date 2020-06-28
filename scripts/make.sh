#!/bin/bash
#
set -e
cd $MYOS/sources
rm -rf make-4.3
tar xf make-4.3.tar.gz
cd make-4.3

./configure --host=${MYOS_TARGET} --prefix=/usr
make
make install DESTDIR=${MYOS}



cd $MYOS/sources
rm -rf make-4.3

