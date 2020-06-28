#!/bin/bash
# Build the rest of the libc
set -e
cd $MYOS/sources
cd  glibc-2.30/build

make
make install DESTDIR=${MYOS}

cd $MYOS/sources
rm -rf glibc-2.30
