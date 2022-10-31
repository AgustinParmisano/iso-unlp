#!/bin/bash

#Realice un script que reciba como parámetro el nombre de un directorio. Deberá validar que
#el mismo exista y de no existir causar la terminación del script con código de error 4. Si el
#directorio existe deberá contar por separado la cantidad de archivos que en él se encuentran
#para los cuales el usuario que ejecuta el script tiene permiso de lectura y escritura, e informar
#dichos valores en pantalla. En caso de encontrar subdirectorios, no deberán procesarse, y
#tampoco deberán ser tenidos en cuenta para la suma a informar.

if [ $# -ne 1 ]
then
	echo "Debe recibir al menos un parametro. Directorio existente"
	exit 1
fi

if [ ! -d $1 ]
then
	echo "No es Directorio existente"	
	exit 4
fi

read=0
write=0

#archivos=($(ls $1))
archivos=($(find $1))

for archivo in ${archivos[*]}
do
	if [ -w $archivo ]; then
		echo "$archivo tiene permisos de escritura"
		write=$(($write + 1))
	fi

	if [ -r $archivo ]; then
		echo "$archivo tiene permisos de lectura"
		read=$(($read + 1))
	fi

done

echo "Hay en el directorio $1 $write archivos con permisos de escritura"
echo "Hay en el directorio $1 $read archivos con permisos de lectura"
exit 0
