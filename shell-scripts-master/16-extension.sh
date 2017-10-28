#!/bin/bash

# Realizar un script que reciba como parámetro una extensión y haga un reporte con 2
# columnas, el nombre de usuario y la cantidad de archivos que posee con esa extensión. Se
# debe guardar el resultado en un archivo llamado reporte.txt

if [ $1 -ne 1]; then
	echo "Es necesario 1 parametro, extension."
	echo "Saliendo con status 1"
	exit 1
fi

u=$(whoami)
c=$(find /home -name "*.sh" -user $u | wc -l)
echo "La cantidad de archivos con extension $1 para el usuario $u es"
