read -p "Escribe un número mayor que 0: " x

while [ $x -le 0 ]; do
    read -p "Escribe un número mayor que 0: " x
done

if [ `expr $x % 2` -eq 0 ]; then
    echo "El número $x es par"
else
    echo "El número $x es impar"
fi
