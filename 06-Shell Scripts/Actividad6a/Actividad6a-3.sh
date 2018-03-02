read -p "Escribe tu nota: " x

#while [ $x -lt 0 ]; do
#    read -p "Escribe un número entre 0 y 10: " x
#done

#while [ $x -gt 10 ]; do
#    read -p "Escribe un número entre 0 y 10: " x
#done

while [ $x -gt 10 ] || [ $x -lt 0 ]; do
    read -p "Escribe un número entre 0 y 10: " x
done

if [ $x -lt 5 ]; then
    echo "Suspendido"
elif [ $x -lt 6 ]; then
    echo "Aprobado"
elif [ $x -lt 7 ]; then
    echo "Bien"
elif [ $x -lt 9 ]; then
    echo "Notable"
else
    echo "Sobresaliente"
fi
