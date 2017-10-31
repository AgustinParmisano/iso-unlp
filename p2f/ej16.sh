#!/bin/bash

arreglo=(`cat /etc/passwd | cut -d: -f1`)

function existe {
  if [ $# -ne 1 ]; then
    echo "Debe recibir un parámetro"
    return 3
  fi
  for usuario in "${arreglo[@]}"; do
    if [ $usuario == $1 ]; then
      echo "Se encotnró el usuario: $usuario"
      return 1
    fi
  done
  return 2
}

function cantidad {
  echo "La cantidad de usuarios en el arreglo es: ${#arreglo[@]}"

}

function ejecuta {
  if [ $# -ne 2 ]; then
    echo "debe recibir dos parámetros"
    return 3
  fi
  if [ `ps -u $2 | grep $1 | wc -l` -gt 1 ]; then
    echo "El usuario $2 está ejecutando el proceso $1"
    return 1
  else
    return 2
  fi
}

existe root
cantidad
ejecuta atom root
