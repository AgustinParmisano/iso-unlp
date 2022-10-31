#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Se acepto solo 1 parametro (nombre usuario)"
	exit 1
fi

usuarios=( $(cat /etc/passwd | cut -d: -f1) )

for i in ${usuarios[*]}; do
	#echo "Usuario: $i"
	if [ $1 = $i ]
	then
		echo "El usuario $i exite"
		exit 0
	fi
done

echo "El usaurio $1 no existe"
exit 2
