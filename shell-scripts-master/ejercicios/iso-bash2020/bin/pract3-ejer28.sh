#!/bin/bash

#Realice un script que reciba como parámetro el nombre de un directorio.
if [ $# -ne 1 ]; then
	echo "Se debe ingresar un solo parametro"
	exit 86
fi

#Deberá validar que el mismo exista
if [ ! -d $1 ]; then
	echo "El directorio $1 no es un directorio valido"
	#de no existir causar la terminación del script con código de error 4.
	exit 4
fi

#Si el directorio existe
#deberá contar por separado la cantidad de archivos que en él se encuentran
#para los cuales el usuario que ejecuta el script tiene permiso de lectura y escritura,
#En caso de encontrar subdirectorios, no deberán procesarse, y tampoco deberán ser tenidos en cuenta para la suma a informar.

archivos_escritura=$(find $1/* -maxdepth 0 -type f -perm /u=w | wc -l)
archivos_lectura=$(find $1/* -maxdepth 0 -type f -perm /u=r | wc -l)

#informar dichos valores en pantalla.
echo "Solucion con find:"
echo "La cantidad de archivos de escritura que tiene el usuario $whoami en el directorio $1 es $archivos_escritura"
echo "La cantidad de archivos de lectura que tiene el usuario $whoami en el directorio $1 es $archivos_lectura"

contador_escritura=0
contador_lectura=0
for file in $(ls $1); do
	if [ ! -d $file ]; then
		if [ -w $file ]; then
			let contador_escritura++
		fi

		if [ -r $file ]; then
			let contador_lectura++
		fi
	fi
done

echo "Solucion con for en ls:"
echo "La cantidad de archivos de escritura que tiene el usuario $whoami en el directorio $1 es $contador_escritura"
echo "La cantidad de archivos de lectura que tiene el usuario $whoami en el directorio $1 es $contador_lectura"

exit 0
