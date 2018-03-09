pares=0
impares=0

for i in $(cat numeros.txt); do
    if [ $((i%2)) -eq 0 ]; then
	echo $i
	pares=$((pares+1))
    fi
done

echo "El total de números pares es $pares"

for i in $(cat numeros.txt); do
    if [ $((i%2)) -ne 0 ]; then
	echo $i
	impares=$((impares+1))
    fi
done

echo "El total de números impares es $impares"
