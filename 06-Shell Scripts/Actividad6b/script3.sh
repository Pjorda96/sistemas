
for i in $(cat precipitaciones.txt | awk '{print $2}'); do
    if [ $i -eq 0 ]; then
	falta guardar los dias de la semana
	echo "El $dia dia $num llovió"
    fi
done
