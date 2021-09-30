#!/bin/bash

if [ $# -ne 3 ]; then
	echo "Se deben enviar 3 parametros: valor1 operando valor2"
	echo "Los operandos son: + - / \*"
	echo "Ejemplo: 2 + 6"
	echo "Ejemplo2: 4 \* 2"
	exit 1
fi

operando=$2

case $operando in
	'+') 
		echo $(expr $1 + $3)
		;;
	'-') 
		echo $(expr $1 - $3)
		;;
	'*') 
		echo $(expr $1 \* $3)
		;;
	'/') 
		echo $(expr $1 / $3)
		;;
	*)
		echo "No existe el operando $operando"
		echo "Los operandos son: + - / \*"
		exit 2
		;;
esac

exit 0
