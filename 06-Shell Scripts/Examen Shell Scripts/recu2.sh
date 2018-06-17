contVentas=`cat ventas_mensuales.txt | wc -l`

suma=0

for i in `seq 1 $contVentas`; do
	if [ `cat ventas_mensuales.txt | head -$i | tail -1 | awk '{print $1}'` == "distrito1" ] &&
	   [ `cat ventas_mensuales.txt | head -$i | tail -1 | awk '{print $2}'` != "enero" ] && 
	   [ `cat ventas_mensuales.txt | head -$i | tail -1 | awk '{print $2}'` != "septiembre" ]; then
		suma=$((suma + 	`cat ventas_mensuales.txt | head -$i | tail -1 | awk '{print $3}'`))
	fi
done

echo "La suma del distrito 1 es $suma"
