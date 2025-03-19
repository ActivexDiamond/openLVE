#!/bin/bash

result=${PWD##*/}          # to assign to a variable
result=${result:-/}        # to correct for the case where PWD is / (root)


#FIXME: Make this work with prj_dir/src instead of just cd'ing down into source when called from prj_dir.
# Currently if you call it form anywhere other than prj_dir or prj_dir/src it fails.
# It should instead know what prj_dir is, and cd into prj_dir/src smartly.
if [ "${PWD##*/}" != "src" ]; then
	echo "run.sh: Changing into 'src' directory."
	cd src
fi

echo "run.sh: Executing 'luajit main.lua'"
luajit main.lua
