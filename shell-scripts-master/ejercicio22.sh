#!/bin/bash

#Dada la siguiente declaración al comienzo de un script: num=(10 3 5 7 9 3 5 4) (la cantidad de elementos del arreglo puede variar).
#Implemente la función productoria dentro de este script, cuya tarea sea multiplicar todos los números del arreglo


productoria() {

	local result=1;
	for n in `echo ${num[@]}`; do
		result=$(expr $result \* $n)
	done

	echo "El resultado de productoria es: $result"
}

num=(10 3 5 7 9 3 5 4)

productoria
