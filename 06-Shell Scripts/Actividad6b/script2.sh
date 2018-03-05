suma=0
cont=0

for i in $(cat precipitaciones.txt | awk '{print $2}'); do
    suma=$((suma+i))
    cont=$((cont + 1))
done

media=$((suma/cont))

echo "La media de precipitaciones es $media"
