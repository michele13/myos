#!/bin/bash
#
set -e
cd $MYOS/sources
cd gcc-9.2.0

# Backup limits.h
mkdir -pv $MYOS/cross-tools/backup
cp `dirname $($MYOS_TARGET-gcc -print-libgcc-file-name)`/include-fixed/limits.h $MYOS/cross-tools/backup/limits.h


# Fix a problem introduced by Glibc-2.31
sed -e '1161 s|^|//|' \
	-i libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
cd ../gcc-build

make
make install

# Replace the partial self-contained limits.h with a full featured one
cd $MYOS/sources/gcc-9.2.0
cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
	`dirname $($MYOS_TARGET-gcc -print-libgcc-file-name)`/include-fixed/limits.h

cd $MYOS/sources
rm -rf gcc-9.2.0
rm -rf gcc-build
