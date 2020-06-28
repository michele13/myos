#!/bin/bash
#
set -e
cd $MYOS/sources
rm -rf bootscripts-embedded-master
tar xf master.tar.gz
cd bootscripts-embedded-master

make DESTDIR=${MYOS}/ install-bootscripts

cd $MYOS/sources
rm -rf bootscripts-embedded-master
