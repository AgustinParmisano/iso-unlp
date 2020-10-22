#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Se debe ingresar 1 parametro"
	exit 1
fi

user=$1

user_exists=$(cat "/etc/passwd"|grep $user)

if [ -z $user_exists ]; then
	echo "El usuario $user no existe"
	exit 2
fi


shell=$(cat "/etc/passwd"|grep $user|cut -d: -f7)

echo "La shell del usuario $user es $shell"

exit 0
