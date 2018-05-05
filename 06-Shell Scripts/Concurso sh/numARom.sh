read -p "Escribe un número: " num

rom=""

if [ $num -ge 1000 ];then
    rom=M
    num=$((num - 1000))
fi

if [ $num -ge 100 ];then
    for i in `seq 1 9`;do
	if [ $num -ge `expr $i \* 100` ];then
	    cent=$i
	    num=$((num - `expr $i \* 100`))
	fi
    done
fi

