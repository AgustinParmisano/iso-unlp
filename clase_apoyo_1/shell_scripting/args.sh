#!/bin/bash

for arg in $*; do
	echo $arg
done

for arg in ${argv[*]}; do
	echo $arg
done

for arg in $@; do
	echo $arg
done

exit 0
