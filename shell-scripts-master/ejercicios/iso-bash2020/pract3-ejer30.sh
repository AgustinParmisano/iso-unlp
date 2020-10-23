#!/bin/bash

#Si el directorio “bin” no existe,deberá ser creado.

if [ ! -d "./bin/" ]; then
	mkdir "./bin/"
fi

#mueva todos los programas del directorio actual (archivos ejecutables)
#hacia el subdirectorio “bin” del directorio HOME del usuario actualmente logueado. 

i=0
for file in $(ls); do
	if [ -x $file ] && [ -f $file ]; then
		echo "Copiando archivo ejecutable $file a /bin"
		cp $file "./bin/$file"

		#El script debe imprimir en pantalla los nombres de los que mueve, 
		let i++
	fi
done

#e indicar cuántos ha movido, o que no ha movido ninguno. 
echo "Se copiaron $i archivos ejecutables del usuario $whoami a ./bin"

exit 0
