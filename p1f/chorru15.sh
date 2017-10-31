#!/bin/bash

usuarios=$(cat /etc/passwd | cut -d: -f1)
a=0
arreglo=()
for u in $usuarios;do
  let a=a+1
  arreglo[$a]=$u
done

function existe {
  #exist=0 #no es necesario
  for a in ${arreglo[@]}; do #puso $arreglo y es ${arreglo[@]}
    if [ $1 = $a ]; then
      echo $a #así solo se imprime el usuario, se debe imprimir el índice del mismo
      echo "El usuario $1 existe en el arreglo " # no estaba, es para testing
      #exist=$1 # no es necesario
      return 0
    fi
    #if [ $exist = 0 ]; then  --->>> No debe preguntar si no lo encuentra porque si hace return al no ser el usuario buscado, corta la busqueda
      #echo 1 #es echo, deben ser returns
    #  echo "El usuario $1 no existe en el arreglo" # no estaba, es para testing
    #  return 1
    #else
      #echo 0 #es echo, deben ser returns
      #return 0
    #fi
  done
  echo "El usuario $1 no existe en el arreglo" # no estaba, es para testing
  return 1 # no estaba
}

function elminar_usuario {
  echo "Se desea eliminar el usuaro $1" #esto no estaba, es para testing
  a=0; ok=0 #esta canchereando
  #for arch in $arreglo; do #por que arch? puso $arreglo y es ${arreglo[@]}
  for arch in ${arreglo[@]}; do
    let a=a+1
    if [ $1 = $arch ]; then
      unset arreglo[$a] #$arreglo[a]=$(rm $arch)  rm no, es unset arreglo[$arch]
      ok=1 #si lo logró borrar pone ok en 1 pero...
      echo "Se eliminó el usuario $1" # esto no estaba, es para testing
    fi
  done
  # estaba así if [ ok -eq 1 ]; then --->>>> le falta $ok
  #if [ $ok -eq 1 ]; then  # ... si lo logro borrar y ok esta en 1, tira código de error ... claramente no debería ser así
  if [ $ok -eq 0 ]; then
    echo "codigo de error 2" #echo NOOOOO!!! return!!!
  fi
}

function usuarios_con_patron {
  echo "Buscanco usuarios con patron $1" # esto no estaba, es para testing
  #for a in $arreglo; do --> todos los elementos del arreglo es con ${arreglo[@]}
  for a in ${arreglo[@]}; do
    # $(cat $a | grep $1) -->>>> algo hay que hacer con esto, guardarlo en una variable o hacer un echo
    if [ $(echo $a | grep -c $1) -ne 0 ]; then # éste if no estaba, es una manera de hacerlo
      echo "Existe un usuario con patron $1 y es $a" # no estaba, es para testing
    fi
  done
}

function cantidad { #  echo "la cantidad de usuarios en el arreglo es ${#arreglo[@]}"
  for a in ${arreglo[@]}; do
    let c=c+1
  done
  echo "la cantidad de usuarios en el arreglo es $c"
}

function usuarios { #echo ${arreglo[@]}
  #for u in $usuarios; do --->>> $usuarios no existe y debería ser ${usuarios[@]}
  for u in ${arreglo[@]}; do
    echo $u
  done
}

existe $1
elminar_usuario $2
existe $3
usuarios_con_patron $4
cantidad
usuarios
