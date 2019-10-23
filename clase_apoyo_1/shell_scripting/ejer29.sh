#!/bin/bash

#Implemente un script que agregue a un arreglo todos los archivos del directorio /home cuya
#terminación sea .doc. Adicionalmente, implemente las siguientes funciones que le permitan
#acceder a la estructura creada:
#- verArchivo <nombre_de_archivo>: Imprime el archivo en pantalla si el mismo se
#encuentra en el arreglo. Caso contrario imprime el mensaje de error “Archivo no en-
#contrado” y devuelve como valor de retorno 5
#- cantidadArchivos: Imprime la cantidad de archivos del /home con terminación .doc
#- borrarArchivo <nombre_de_archivo>: Consulta al usuario si quiere eliminar el archi-
#vo lógicamente. Si el usuario responde Si, elimina el elemento solo del arreglo. Si el
#usuario responde No, elimina el archivo del arreglo y también del FileSystem. Debe
#validar que el archivo exista en el arreglo. En caso de no existir, imprime el mensaje
#de error “Archivo no encontrado” y devuelve como valor de retorno 10

arr=($(ls $HOME | grep ".doc$"))

ver_archivo(){
	echo "Ver Archivos"
	echo $1

	for i in ${arr[@]}; do

		if [ $1 == $i ]; then
			echo "El $1 esta en ${arr[*]}"
			return 0
		fi

	done

	echo "Archivo $1 no encontrado."
	return 5

}

echo ${arr[*]}

cantidadArchivos() {
	echo "Cantidad Archivos"
	cant=$(ls $HOME | grep -c ".doc$")
	return $cant
}

borrarArchivo(){
	echo "Borrar Archivo"
	echo "Ingrese una opcion y/n"
	read opcion
	echo $opcion

	if [ $opcion == "y" ];then
		echo "Eliminando logicamente el archivo $1 del arreglo ${arr[*]}"
		x=0
		for i in ${arr[@]}; do
			if [ $i == $1 ]; then
				unset arr[$x]
				echo "Se elimino logicamente el archivo $1 del arrelgo ${arr[*]}"
				return 0
			fi
			x=$((x + 1))
		done
		echo "Archivo $1 no encontrado en el arreglo ${arr[*]}"
		return 10

	fi

	if [ $opcion == "n" ]; then
               	echo "Eliminando logicamente el archivo $1 del arreglo ${arr[*]}"
               	x=0
               	for i in ${arr[@]}; do
                       	if [ $i == $1 ]; then
                               	unset arr[$x]
                               	rm $HOME/$1
				echo "Se elimino logica y fisicamente el archivo $1 del arrelgo ${arr[*]}"
                               	return 0
                       	fi
                        	x=$((x + 1))
                	done
                	echo "Archivo $1 no encontrado en el arreglo ${arr[*]}"
                return 10

        fi

}

ver_archivo e.doc
echo $?
cantidadArchivos
echo $?
borrarArchivo noseinundamas
echo $?
borrarArchivo a.doc
echo $?

exit 0
