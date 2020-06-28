#!/bin/bash
# Getting Sources
set -e
mkdir -p $MYOS/sources
chmod -v a+xwt $MYOS/sources
wget -c -i $top/lib/wget-list -P $MYOS/sources || true
#pushd $MYOS/sources
#md5sum -c $top/lib/md5sums
#popd
#ln -sf $MYOS/sources/master.tar.gz $MYOS/souces/bootscripts.tar.gz
