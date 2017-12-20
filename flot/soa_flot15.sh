#!/bin/bash

read -p "Ingrese un comando: " comando
while [ comando != "logout" ]; do
	if [ -x /bin/$comando ]; then
		echo $("$comando")
	else
		echo "Comando inválido"
	fi
	read -p "Ingrese un comando: " comando
done
exit 0
