#!/bin/bash


echo $1
echo $2

if [ $1 == "hola"  ]; then
	echo "entro en simple corchete"
fi

if [[ $1 == "hola"  ]]; then
        echo "entro en doble corchete"
fi


if [ $2 == 2  ]; then
        echo "entro en simple corchete"
fi

if [[ $2 == 2  ]]; then
        echo "entro en doble corchete"
fi


