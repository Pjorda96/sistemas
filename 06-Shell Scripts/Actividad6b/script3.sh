
for i in $(cat precipitaciones.txt | awk '{print $2}'); do
    if [ $i -eq 0 ]; then
	
	echo "El $dia dia $num llovió"
    fi
done
