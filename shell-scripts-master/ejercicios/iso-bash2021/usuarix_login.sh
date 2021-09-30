#!/bin/bash


#Crear un script que verifique cada 10 segundos si un usuario se ha loqueado en el sistema
#el nombre del usuario será pasado por parámetro). Cuando el usuario finalmente se loguee,
#el programa deberá mostrar el mensaje ”Usuario XXX logueado en el sistema” y salir.

usu=$1
secs=2

if [ $# -ne 1 ]; then
	echo "Se debe enviar 1 usuarix"
	exit 1
fi

while true; do
	cantidad_usu=$(who | grep $usu | cut -d" " -f1 | wc -l)
	if [ $cantidad_usu -eq 0 ]; then
		echo "Todavia no entro $usu. Esperamos $secs segundos"
		sleep $secs
	else
		echo "Entro $usu!!!"
		break
	fi
done

exit 0
