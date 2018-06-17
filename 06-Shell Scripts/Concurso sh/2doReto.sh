read -p "Escriba un número: " num

#2003, primer primo mayor que 2000 para evitar errores de divisibilidad. con esto se calcula si es un número (wc -l = 1) o da un error (wc -l = 0)
if [ `echo $((2003 / num)) | wc -w` -eq 1 ]; then
    if [ $num -le 2000 ] && [ $num -ge 1 ]; then
	rom=""

	if [ $num -ge 1000 ];then
	    rom="M"
	    num=$((num - 1000))
	fi

	if [ $num -ge 100 ];then
	    for i in `seq 1 9`;do
		if [ $num -ge `expr $i \* 100` ];then
		    cent=$i
		    num=$((num - `expr $i \* 100`))
		fi
	    done
	    D="D"
	    M="M"
	    C="C"
	    if [ $cent -eq 9 ];then
		rom=$rom$C$M
	    fi
	    if [ $cent -eq 8 ];then
		rom=$rom$D$C
		rom=$rom$C
		rom=$rom$C
		rom=$rom$C
	    fi
	    if [ $cent -eq 7 ];then
		rom=$rom$D
		rom=$rom$C
		rom=$rom$C
	    fi
	    if [ $cent -eq 6 ];then
		rom=$rom$D
		rom=$rom$C
	    fi
	    if [ $cent -eq 5 ];then
		rom=$rom$D
	    fi
	    if [ $cent -eq 4 ];then
		rom=$rom$C
		rom=$rom$D
	    fi
	    if [ $cent -eq 3 ];then
		rom=$rom$C
		rom=$rom$C
		rom=$rom$C
	    fi
	    if [ $cent -eq 2 ];then
		rom=$rom$C
		rom=$rom$C
	    fi
	    if [ $cent -eq 1 ];then
		rom=$rom$C
	    fi
	fi

	if [ $num -ge 10 ];then
	    for i in `seq 1 9`;do
		if [ $num -ge `expr $i \* 10` ];then
		    dec=$i
		    num=$((num - `expr $i \* 10`))
		fi
	    done
	    L="L"
	    C="C"
	    X="X"
	    if [ $dec -eq 9 ];then
		rom=$rom$X
		rom=$rom$C
	    fi
	    if [ $dec -eq 8 ];then
		rom=$rom$L
		rom=$rom$X
		rom=$rom$X
		rom=$rom$X
	    fi
	    if [ $dec -eq 7 ];then
		rom=$rom$L
		rom=$rom$X
		rom=$rom$X
	    fi
	    if [ $dec -eq 6 ];then
		rom=$rom$L
		rom=$rom$X
	    fi
	    if [ $dec -eq 5 ];then
		rom=$rom$L
	    fi
	    if [ $dec -eq 4 ];then
		rom=$rom$X
		rom=$rom$L
	    fi
	    if [ $dec -eq 3 ];then
		rom=$rom$X
		rom=$rom$X
		rom=$rom$X
	    fi
	    if [ $dec -eq 2 ];then
		rom=$rom$X
		rom=$rom$X
	    fi
	    if [ $dec -eq 1 ];then
		rom=$rom$X
	    fi
	fi
	
	V="V"
	X="X"
	I="I"
	if [ $num -eq 9 ];then
            rom=$rom$I
            rom=$rom$X
	fi
	if [ $num -eq 8 ];then
            rom=$rom$V
            rom=$rom$I
            rom=$rom$I
            rom=$rom$I
	fi
	if [ $num -eq 7 ];then
            rom=$rom$V
            rom=$rom$I
            rom=$rom$I
	fi
	if [ $num -eq 6 ];then
            rom=$rom$V
            rom=$rom$I
	fi
	if [ $num -eq 5 ];then
            rom=$rom$V
	fi
	if [ $num -eq 4 ];then
            rom=$rom$I
            rom=$rom$V
	fi
	if [ $num -eq 3 ];then
            rom=$rom$I
            rom=$rom$I
            rom=$rom$I
	fi
	if [ $num -eq 2 ];then
            rom=$rom$I
            rom=$rom$I
	fi
	if [ $num -eq 1 ];then
            rom=$rom$I
	fi

	echo "Es decimal y el número es $rom"
    else
	echo "Número fuera de rango."
    fi
elif [ `echo $num | grep [^M,D,C,L,X,V,I] | wc -l` -eq 0 ]; then
    for i in 1 `echo $num | wc -c`;do
	arr[$i]=${num:$i:1}
    done

    cont=0
    sum=0

    for i in 1 `echo $num | wc -c`;do
	
	if [ ${arr[$i]} == "C" ] && [ arr[`expr $i + 1`] == "M" ];then
	    sum=-100
	fi
	if [ ${arr[$i]} == "M" ];then
	    sum=$((sum + 1000))
	fi
	if [ ${arr[$i]} == "D" ];then
	    sum=$((sum + 500))
	fi
	if [ ${arr[$i]} == "X" ] && [ arr[`expr $i + 1`] == "C" ];then
	    sum=$((sum - 10))
	fi
	if [ ${arr[$i]} == "C" ] && [ arr[`expr $i + 1`] != "M" ];then
	    sum=$((sum + 100))
	fi
	if [ ${arr[$i]} == "L" ];then
	    sum=$((sum + 50))
	fi
	if [ ${arr[$i]} == "X" ] && [ arr[`expr $i + 1`] != "C" ];then
	    sum=$((sum + 10))
	fi
	if [ ${arr[$i]} == "I" ] && [ arr[`expr $i + 1`] == "V" ];then
	    sum=$((sum - 1))
	fi
	if [ ${arr[$i]} == "V" ];then
	    sum=$((sum + 5))
	fi
	if [ ${arr[$i]} == "I" ] && [ arr[`expr $i + 1`] != "V" ];then
	    sum=$((sum + 1))
	fi
	
    done

    echo "El número es romano y el resultado es $sum"

else
    echo "ERROR: Escribe las letras en mayuscula."
fi
