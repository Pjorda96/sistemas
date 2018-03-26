lineas=`cat balance.txt | wc -l`

for i in `seq 1 $lineas`; do
    if [ `cat balance.txt | head -$i | tail -1 | awk '{print $3}'` -gt 100 ]; then
	echo `cat balance.txt | head -$i | tail -1 | awk '{print $1}'` " " `cat balance.txt | head -$i | tail -1 | awk '{print $3}'`
    fi
done
