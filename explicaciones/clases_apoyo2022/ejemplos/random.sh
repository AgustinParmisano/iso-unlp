#!/bin/bash

word="access"
directorios=$(ls /var/ | grep "$word" )
archivos=($(find /var/ -name "*$word*"))
arreglo=(a b c 1 2 3)
