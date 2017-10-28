#!/bin/bash

#Crear un script que verifique cada 10 segundos si un usuario se ha loqueado en el sistema
#(el nombre del usuario será pasado por parámetro). Cuando el usuario finalmente se loguee,
#el programa deberá mostrar el mensaje ”Usuario XXX logueado en el sistema” y salir.

if [ $# -ne 1 ]; then
	echo "Parametros incorrectos, debe propircionar un nombre de usuario"
	echo "Saliendo con status 1"
	exit 1
fi

l=0

while [ $l -ne 1 ]; do
	echo "Esperando a que se logee el usuario: $1"
	for u in $(who); do
		if [ $1 == $u ]; then
			echo "Usuario $1 logueado en el sistema"
			echo "Saliendo con status 0"
			exit 0
		fi
	done
	sleep 5
done
