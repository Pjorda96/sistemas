read -p "Introduce un número: " x

menor=100000
echo $x

while [ $x -ne 0 ]; do
	if [ $x -lt $menor ] &&
	   [ $menor -ne 0 ]; then
		menor=$x
	fi

	read -p "Introduce un número: " x
done

echo "El número menor introducido es: " $menor
