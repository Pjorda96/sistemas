x=$1

for i in $(cat nombres.txt); do
    mkdir $i
    for j in `seq 1 $x`; do
	mkdir $i/$i$j
    done
done
