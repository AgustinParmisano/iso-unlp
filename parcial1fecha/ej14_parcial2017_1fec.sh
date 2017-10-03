#!/bin/bash

if [ $# -lt 2 ]; then
  echo "No se pasaron bien los parametros, deben ser mínimo 2"
  echo "1: tipo de archivos -v (video) o -m (musica)"
  echo "2 a N: Archivo o archivos multimedia de video o musica"
  exit 1
fi

files=$(echo $* | cut -d" " -f2-$#)
echo "Files: ${files[@]}"

if [ "$1" = "-m" ] || [ "$1" = "-v" ]; then
  echo "Se indico el tipo de archivos multimedia como $1"
  for i in $files; do
    echo "Procesando archivo $i"
    if test -e $i; then
      echo "Reproduciendo archivo existente $i con opcion $1"
      #vlc $i $1 #comentado para testing, puedo causar errores en el sistema ejecutar archivos con formato inválido para vlc
    else
      echo "El arcvhivo $i no es valido para el reproductor. Error con fecha: $(date)" >> /var/log/reproductor.error
    fi
  done
else
  echo "El tipo de archivo multimedia ingresado $1 es incorrecto, debe ser -v (video) o -m (musica)"
  exit 2
fi
