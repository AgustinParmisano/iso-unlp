#!/bin/bash
array=()
valores=($(cat /etc/passwd | cut -d: -f1))
array=$valores

function imprimirVal { 
	echo ${#valores[*]}
	for (( j=0; j<=${#valores[*]}; j++ ));do
		echo ${valores[$j]}
	done
}

imprimirVal
exit 0


