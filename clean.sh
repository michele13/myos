#!/bin/bash
set -e
export top=$(pwd)
echo Cleaning!
. config.txt
rm -rf $MYOS logs stage
