lineas=`cat procesos.txt | wc -l`

for i in `seq 1 $lineas`; do
    if [ `cat procesos.txt | head -$i | tail -1 | awk '{print $2}'` -eq $1 ]; then
	echo "El propietario es "`cat procesos.txt | head -$i | tail -1 | awk '{print $1}'`
    fi
done
