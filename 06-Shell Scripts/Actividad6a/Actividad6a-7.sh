read -p "Introduce una dia del mes: " x

while [ $x -gt 30 ] || [ $x -lt 1 ]; do
    read -p "Introduce una dia del mes: " x
done

while [ $x -gt 7 ]; do
    x=`expr $x - 7`
done

if [ $x -eq 1 ]; then
    x="lunes"
elif [ $x -eq 2 ]; then
    x="martes"
elif [ $x -eq 3 ]; then
    x="miércoles"
elif [ $x -eq 4 ]; then
    x="jueves"
elif [ $x -eq 5 ]; then
    x="viernes"
elif [ $x -eq 6 ]; then
    x="sábado"
elif [ $x -eq 7 ]; then
    x="domingo"
fi

echo "El dia que buscas es el $x"
