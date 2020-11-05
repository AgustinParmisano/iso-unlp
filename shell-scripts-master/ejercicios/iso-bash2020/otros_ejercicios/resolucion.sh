#!/bin/bash

# Checkeamos que llegue un parametro solamente
if [ $# -ne 1 ]; then
	echo "Debe pasar al menos un parametro"
	exit 1
fi

if [ $1 -le 0 ]; then
	echo "El parametro debe ser mayor a 0"
	exit 2
fi

ganadores=()

for i in $(cat 2013_2020.csv); do 
	numeros=($(echo "$i" | cut -d, -f2-7 | tr "," " "))
	sumatoria=0
	for numero in ${numeros[*]}; do
		sumatoria=$(expr $numero + $sumatoria)
	done

	if [ $sumatoria -eq $1 ]; then
		fecha=$(echo $i | cut -d, -f1)
		ganadores+=($fecha)
	fi
done

cantidad=${#ganadores[*]}
echo "La cantidad de ganadores es $cantidad"
echo "El primer ganadore es ${ganadores[0]}"
echo "El ultime ganadore es ${ganadores[$cantidad-1]}"
