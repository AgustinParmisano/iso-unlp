#!/bin/bash

rellenar(){ #funciona
	if [ $# -eq 0 ]; then
		echo "Debe enviar un parametro"
		return 1
	else
		vector=()
		for (( i=0; i<$1; i++ )); do
			echo "Ingrese patron:	"
			read pat
			final=${#vector[*]}
			vector[$final]=$pat
		done
	fi
	return 0
	
}

delete_elemento(){ #funciona
	if [ $# -eq 0 ]; then
		echo "Parametro no enviado: "
		return 1
	else
		if [ "$1" == "*" ]; then
			for (( i=0; i<${#vector[*]}; i++ )); do
				unset vector[$i]
			done
		else
			for (( i=0; i<${#vector[*]}; i++ )); do
				if [ "$1" == "${vector[$i]}" ]; then
					unset vector[$i]
					eliminado=1
				fi
			done

			if [ $eliminado -eq 0 ]; then
				echo "Elemento $1 no encontrado" 
			fi
		fi
	fi
}

update_posicion_nuevo_elemento(){
	echo $*
	if [ $# -ne 2 ]; then
		echo "Parametros no enviados"
		return 1
	fi

	if [ $1 -le ${#vector[*]} ]; then
		delete_elemento $2
		vector[$1]=$2
		return 0
	else
		echo "Posicion $1 inválida"
		return 2
	fi
}

insertar_elemento(){ #funciona
	if [ $# -eq 0 ]; then
		echo "Parametro no enviado"
		return 1
	else
		final=${#vector[*]}
		vector[$final]=$1
		return 0
	fi
}

select_elemento(){ #funciona
	encontrado=0
	echo $1
	if [ $# -eq 0 ]; then
		echo "Parametro no enviado"
		return 1
	else
		if [ $1 == "o" ]; then
			for (( i=0; i<${#vector[*]}; i++ )); do
				echo ${vector[$i]}
			done
		else
			for (( i=0; i<${#vector[*]}; i++ )); do
				if [ "$1" == "${vector[$i]}" ]; then
					echo ${vector[$i]}
					encontrado=1
				fi
			done
			if [ $encontrado -eq 0 ]; then
				echo "Elemento $1 no encontrado"
			fi
		fi
		return 0
	fi
}

read -p "Ingrese la cantidad de elementos que desea insertar: " n
rellenar $n
read -p "Select Elemento (\* para todos): " s
select_elemento $s
#read -p "Delete Elemento (\* para todos):" d
#delete_elemento $d
read -p "Update Elemento (Posicion): " p
read -p "Update Elemento (Elemento): " e
update_posicion_nuevo_elemento $p $e
read -p "Insertar Elemento: " i
insertar_elemento $i
echo ${vector[*]}
