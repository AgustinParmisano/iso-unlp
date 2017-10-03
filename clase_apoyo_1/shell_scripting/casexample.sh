#!/bin/bash

#listado=`ls`
#for var in (listado)
#	echo $(ls -l $var | cut -d' ' -f 3)
#done


case $1 in
	'hola')
		echo "Puso hola"
		;;
	'chau')
		echo "Puso chau"
		;;
	*)
		echo "Puso otra cosa"
esac


