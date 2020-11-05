#!/bin/bash

param=( $* )
#unset param[0]

echo ${param[*]}

for i in ${param[*]:1:3}; do
	echo "Este es el param $i"
done
