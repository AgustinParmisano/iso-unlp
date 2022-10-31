#!/bin/bash

if [ $# -ne 1 ]
then
	echo "falta un parametro"
	exit 1
fi

archivo_log=reporte.txt
echo "" > $archivo_log
for usuario in $(ls /home)
do
	echo "Buscando arhcivos con extension $1 para usuario: $usuario"
	cantidad=$(find /home/* -name "*.$1" -u $| wc -l)
	echo "$usuario $cantidad" >> $archivo_log
done

exit 0
