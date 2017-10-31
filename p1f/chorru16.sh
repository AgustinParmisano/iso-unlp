#!/bin/bash

if [[ $# < "2" ]]; then
  echo "Se requieren al menos 2 parametros"
  echo "1: Directorio, 2aN: rutas absolutas de Archivos" # no estaba, es para testing
  exit 1
fi

if [ ! -d $1 ]; then
  echo "No existe o no es un Directorio válido"
  echo "1: Directorio, 2aN: rutas absolutas de Archivos" # no estaba, es para testing
  exit 2
fi

archivos=$*

for a in $archivos; do
  #if [ ! -f $a ]; then #hasta acá llegó el parcial pero lo voy seguir a modo de ejemplo
  if [ -f $a ] && [ -x $a ]; then
    echo "$a es un archivo y posee permisos de ejecución"
  elif [ -d $a ] && [ -w $a ]; then
    echo "$a es un directorio y posee permisos de escritura"
  fi
done
