#!/bin/bash

pila=()

push () {
	if [ $# -ne 1 ]; then
		echo "Debe pasarse un parametro"
		return 1
	fi

	len_pila=${#pila[*]}
	pila[$len_pila]=$1
	echo "Se Pusheo el elemento $1 a la pila"

	return 0
}

vacia () {
        len_pila=${#pila[*]}
	if [ $len_pila -eq 0 ]; then
		echo "La pila está vacía"
		return 0
	fi

	echo "La pila no está vacía"
	return 1
}

cant_elem() {
	echo "La cantidad de elementos de la pila es: ${#pila[*]}"
}

pop () {
	vacia
	if  [ $? -eq 0 ]; then
		echo "No se puede hacer Pop la pila está vacía"
		return 2
	fi

	len_pila=${#pila[*]}
	let len_pila--
	aux=${pila[$len_pila]}
	echo "Pop Elemento : $aux"
	unset pila[$len_pila]

	return 0
}

top () {
	vacia
	if  [ $? -eq 0 ]; then
                echo "No se puede ver el tope. La pila está vacía"
                return 1
        fi

	len_pila=${#pila[*]}
	let len_pila--
	echo "El tope de la pila es: ${pila[$len_pila]}"

	return 0
}

cant_elem
pop
vacia
top
push $1 #OJO oara probar el push hay que pasar parametros
push $2
push $3
cant_elem
vacia
top
pop
pop
pop
pop
cant_elem
vacia
