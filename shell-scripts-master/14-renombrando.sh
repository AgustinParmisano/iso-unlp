#!/bin/bash

if [ $# -ne 3 ]; then
	echo "Faltan parámetros:"
	echo "Uso: 1: directorio, 2:opción -a (adelante) o .b (atras), 3: CADENA."
	echo "Saliendo status 1"
	exit 1
fi

if [ ! -d $1 ]; then
	echo "$1 No es un directorio válido."
	echo "Saliendo status 2"
	exit 2
fi

for f in $(ls $1); do
	echo "Parametro elegido: $1"
	if [ $2 != "-a" ]; then
		echo "Renombrando $f por $f$3"
		mv $1/$f $1/$f$3
	fi

	if [ $2 != "-b" ]; then
		echo "Renombrando $f por $3$f"
		mv $1/$f $1/$3$f
	fi
done
echo "Saliendo status 0"
exit 0
