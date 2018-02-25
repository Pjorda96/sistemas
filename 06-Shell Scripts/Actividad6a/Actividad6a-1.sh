read -p "Introduce un valor para X: " x
read -p "Introduce un valor para Y: " y

if [ $x -gt $y ]; then
   echo "$x es mayor"
else
   if [ $x -lt $y ]; then
      echo "$y es mayor"
   else
      echo "Son iguales"
   fi
fi
