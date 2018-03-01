read -p "Introduce una cantidad: " x

precio=0

if [ $x -le 50 ]; then
    precio=20
else
    precio=20
    x=$(echo "scale=2; $x - 50" | bc)

    if [ $x -le 200 ]; then
	precio=$(echo "scale=2; $precio + 0.20 * $x" | bc)
    else
	precio=$(echo "scale=2; $precio + 40" | bc)
	x=$(echo "scale=2; $x - 200" | bc)

        precio=$(echo "scale=2; $precio + 0.10 * $x" | bc)
    fi
fi

echo $precio
