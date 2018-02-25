read -p "Escribe un número mayor que 0: " x

while [ $x -lt 0 ]; do
    read -p "Escribe un número mayor que 0: " x
done

for i in `seq 1 $x`; do
    echo "$i "
done
