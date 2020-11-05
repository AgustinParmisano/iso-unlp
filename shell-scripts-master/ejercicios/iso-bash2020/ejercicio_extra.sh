#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Se debe ingresar al menos 1 parametro"
	exit 1
fi

path="/var/log/usr/any-service/error.log"
error="FATAL ERROR"

# Script verifique 3 minutos existe el archivo /var/log/usr/any-service/error.log
while true; do
	echo "Esperando 3 minutos"
	sleep 3 #*60

	if [ -f $path ]; then
		# si existe y dentro de el hay al menos 1 linea con el texto FATAL ERROR hay que
		grep -i "$error" "$path"
		if [ $? -eq 0 ]; then
			# comprimir y empaquetar el contenido directorio del /var/log/usr/serice y
			# guardar en un directorio pasado por parametro y ademas
			tar czf "$1.tar.gz" "/var/log/usr/service/*"

			# Cuando termina el script hay que  informar la cantiad de lineas de texto que tenia el texto FATAL ERROR
			cant=$(cat $path | tr ' ' '\n' | grep -wc "$error")

			echo "La cantidad de $error es $cant"
			# causar la terminacion del script apropiadamente
			exit 0
		fi
	fi
done






