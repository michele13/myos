#!/bin/bash
#
set -e
cd $MYOS/sources
rm -rf grub-2.04 
tar xf grub-2.04.tar.xz
cd grub-2.04

# We will build GRUB 3 times
# one for each platform: i386-pc i386-efi and  x86_64-efi

mkdir -pv build
cd build

# i386-pc
../configure --host=${MYOS_TARGET} --prefix=/usr --with-platform=pc --target=i386
make && make DESTDIR=${MYOS} install
rm -rf *

# i386-efi
../configure --host=${MYOS_TARGET} --prefix=/usr --with-platform=efi --target=i386
make && make DESTDIR=${MYOS} install
rm -rf *

# x86_64-efi
../configure --host=${MYOS_TARGET} --prefix=/usr --with-platform=efi --target=x86_64
make && make DESTDIR=${MYOS}  install
rm -rf *

cd $MYOS/sources
rm -rf grub-2.04
