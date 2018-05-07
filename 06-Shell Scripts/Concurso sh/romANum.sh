read -p "khgc" num

for i in 1 `echo $num | wc -c`;do
    arr[$i]=${num:$i:1}
done

cont=0
sum=0

for i in 1 `echo $num | wc -c`;do
    
    if [ arr[$i] == "C" ] && [ arr[`expr $i + 1`] == "M" ];then
	sum=-100
    fi
    if [ arr[$i] == "M" ];then
	sum=$((sum + 1000))
    fi
    if [ arr[$i] == "D" ];then
	sum=$((sum + 500))
    fi
    if [ arr[$i] == "X" ] && [ arr[`expr $i + 1`] == "C" ];then
	sum=$((sum - 10))
    fi
    if [ arr[$i] == "C" ] && [ arr[`expr $i + 1`] != "M" ];then
	sum=$((sum + 100))
    fi
    if [ arr[$i] == "L" ];then
	sum=$((sum + 50))
    fi
    if [ arr[$i] == "X" ] && [ arr[`expr $i + 1`] != "C" ];then
	sum=$((sum + 10))
    fi
    if [ arr[$i] == "I" ] && [ arr[`expr $i + 1`] == "V" ];then
	sum=$((sum - 1))
    fi
    if [ arr[$i] == "V" ];then
	sum=$((sum + 5))
    fi
    if [ arr[$i] == "I" ] && [ arr[`expr $i + 1`] != "V" ];then
	sum=$((sum + 1))
    fi
    
done

echo "El número es romano y el resultado es $sum"
