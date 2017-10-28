#!/bin/bash

echo "Ejemplo de comando cut mostrando los usuarios de /etc/passwd"
echo ""
echo "cat /etc/passwd | cut -d: -f1"
e=0
users=$(cut -d: -f1 < /etc/passwd) # cat /etc/passwd | cut -d -f1
for u in $users; do
	let e+=1
	echo "Usuario $e: $u"
done
echo ""
echo "El código es:"
echo ""
cat $(pwd)/15-cut.sh
exit 0
