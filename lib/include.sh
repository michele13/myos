#!/bin/echo This file is sourced, not run:
error () {
	echo ""
	tail $1
	echo ""
	echo "Build FAILED"
	echo "Read $1 for more information"
	exit 1
}
step () {
	if [ ! -f $top/stage/$1 ]; then
		bash $top/scripts/$1.sh > $top/logs/$1 2>&1 || error $top/logs/$1
		touch $top/stage/$1
	fi

}

