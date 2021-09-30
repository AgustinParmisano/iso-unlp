i=0

while [ $i -lt 10 ]
do
	i=$((i+1))
	if [ $i -eq 5 ]; then
		continue
	fi
	echo "Number: $i"
	if [ $i -eq 8 ]; then
		break
	fi
done

echo "Termino con i en $i"
