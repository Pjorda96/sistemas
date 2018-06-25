lineas=`cat alumnos.txt | wc -l`

notCor=4

for i in `seq 1 $lineas`; do
	if [ `cat alumnos.txt | head -$i | tail -1 | awk '{print  $3}'` -gt $notCor ]; then
		echo "Los alumnos con nota mayor a 4 son " `cat alumnos.txt | head -$i | tail -1 | awk '{print $1}'` 
							`cat alumnos.txt | head -$i | tail -1 | awk '{print $2}'` 
	fi
done
