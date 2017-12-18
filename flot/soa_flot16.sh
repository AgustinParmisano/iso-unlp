#!/bin/bash

usuarios=$(cat /etc/passwd | cut -d: -f1)
max=-1

for user in $usuarios; do
	if [ -d /home/$user ]; then
		cantidad=$(ls -l /home/$user/* | wc -l)
		if [ $cantidad -ge $max ]; then
			max=$cantidad
			usu=$user
		fi
		echo "El usuario $user tiene $cantidad archivos"
	fi
done

echo "El usuario con mas archivos es $usu"
exit 7
