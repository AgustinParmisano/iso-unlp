#!/bin/bash

arreglo=()
posicion=1

for i in $(cat /etc/passwd|cut -d: -f1); do
  let pos=posicion-1
  arreglo[$pos]=$i
  let posicion=posicion+1
done

function existe {
  for (( i = 0; i < ${#arreglo[@]}; i++ )); do
    if [ "${arreglo[i]}" = "$1" ]; then
      echo "El indice en el arreglo donde esta el usuario $1 es $i"
      return 0
    fi
  done
  echo "El usuario $1 no existe"
  return 1
}

function eliminarUsuario {
  for (( i=0; i < ${#arreglo[@]}; i++ )); do
    if [ "${arreglo[i]}" = "$1" ]; then
      echo "Eliminando el usario ${arreglo[i]}"
      unset arreglo[$i]
      return 0
    fi
  done
  return 2
}

function usuariosConPatron {
  for ((i=0; i < ${#arreglo[@]}; i++)); do
    if [ $(echo ${arreglo[i]} | grep -c "$1") -ne 0 ]; then
      echo "Existe un usuario con el patron $1 y es ${arreglo[i]}"
    fi
  done
}

function cantidad {
  echo "la cantidad de usuarios en el arreglo es ${#arreglo[@]}"
}

function usuarios {
  for ((i=0; i < ${#arreglo[@]}; i++)); do
    echo "El nombre de usuario es ${arreglo[i]}"
  done
}

opciones="1:existe <usuario>, 2:eliminar <usuario>, 3:usuariosConPatron <patron>, 4:cantidad, 5:usuarios, 0:salir"

while [[ true ]]; do
  echo "Las opciones son:"
  echo $opciones
  #aprender a usar el select opcion in $opciones; do
  read opcion
  case "$opcion" in
    "existe"|"1")
      echo "Ingrese usuario: "
      read usuario
      existe $usuario
      ;;
    "eliminar"|"2")
      echo "Ingrese usuario: "
      read usuario
      eliminarUsuario $usuario
      ;;
    "usuariosConPatron"|"3")
      echo "Ingrese patron: "
      read patron
      usuariosConPatron $patron
      ;;
    "cantidad"|"4")
      cantidad
      ;;
    "usuarios"|"5")
      usuarios
      ;;
    "salir"|"0")
      echo "Saliendo"
      exit 0
      ;;
    "*" )
      echo "Las opciones son:"
      echo $opciones
      ;;
  esac
done
#usuarios
#cantidad
#usuariosConPatron o
#existe user
#eliminarUsuario user
#usuarios
#cantidad
#usuariosConPatron er
