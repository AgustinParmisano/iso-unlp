#!/bin/bash
# Crea reporte con cantidad de archivos con una extension dentro de la carpeta home del usuario actual

if [ $# -ne 1 ]
then
    echo "Numero de parametros incorrecto."
    exit 1
elif [ `echo $1 | cut -c 1` = "." ]
then
    echo "Ingrese la extension sin el punto."
    exit 1
else
    current=`pwd`
    cd /home/$USER
    echo $USER $(find -user $USER -name "*.$1" | wc -l) > "${current}/reporte.txt"
    cd $current
    exit 0
fi
