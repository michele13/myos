#!/bin/bash
# Install Cross LibGCC
set -e
cd $MYOS/sources
cd gcc-build

make all-target-libgcc 
make install-target-libgcc

cd $MYOS/sources
