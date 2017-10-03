#!/bin/bash

x() {
	echo $1 | grep $2
}

function y {
	echo $1 | grep $2
}


#function y(1,2) {
#	echo $1 | grep $2
#}

x "hola mundo" "a"
y hola mundo o
#z "hola" "o"

exit 256
