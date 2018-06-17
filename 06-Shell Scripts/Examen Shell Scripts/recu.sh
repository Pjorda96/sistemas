linEjec=`cat ejecucion.txt | wc -l`

comp=10000000

for  i in `seq 1 $linEjec`; do
	if  [ `cat ejecucion.txt | head -$i | tail -1 | awk '{print $4}'` -lt $comp ]; then
		comp=`cat ejecucion.txt | head -$i | tail -1 | awk '{print $4}'`
		alg1=`cat ejecucion.txt | head -$i | tail -1 | awk '{print $1}'`
		alg2=`cat ejecucion.txt | head -$i | tail -1 | awk '{print $2}'`
		alg3=`cat ejecucion.txt | head -$i | tail -1 | awk '{print $3}'`
	fi
done

echo "El grupo de tres algoritmos coyo tiempo es menor es $alg1 $alg2 $alg3"

