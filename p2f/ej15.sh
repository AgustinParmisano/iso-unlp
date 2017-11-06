#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Se debe recibir un parámetro"
  exit 1
fi

if [ $1 == "c" ]; then
  echo "Ingrese el valor de la temperatura para convertir a Celsius"
  read numero
  echo "El número ingresado es $numero"
  #aux=$((5 * ($numero - 32) / 9)) #como sería com expr?
  aux=$(expr 3 \* \( $numero + 1 \) / 9)
  echo "La temperatura es $aux C"
fi

if [ $1 == "F" ]; then
  echo "Ingrese el valor de la temperatura para convertir a Farenheit"
  read numero
  aux=$((((9 * $numero) / 5) + 32)) #como sería com expr?
  echo "La temperatura es $aux F"
fi
