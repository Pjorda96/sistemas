for i in `seq 1 254`; do
	if [ `ping -c 1 -i 0.2 10.2.6.$i | grep "rtt" | wc -l` -eq 1  ]; then
		echo "10.2.6.$i"
	fi
done


