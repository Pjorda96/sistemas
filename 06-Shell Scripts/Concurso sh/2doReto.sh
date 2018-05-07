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
	    if [ $cent -eq 9 ];then cente="CM"; fi
	    if [ $cent -eq 8 ];then cente="DCCC"; fi
	    if [ $cent -eq 7 ];then cente="DCC"; fi
	    if [ $cent -eq 6 ];then cente="DC"; fi
	    if [ $cent -eq 5 ];then cente="D"; fi
	    if [ $cent -eq 4 ];then cente="CD"; fi
	    if [ $cent -eq 3 ];then cente="CCC"; fi
	    if [ $cent -eq 2 ];then cente="CC"; fi
	    if [ $cent -eq 1 ];then cente="C"; fi

	    rom=$rom$cente
	fi

	if [ $num -ge 10 ];then
	    for i in `seq 1 9`;do
		if [ $num -ge `expr $i \* 10` ];then
		    dec=$i
		    num=$((num - `expr $i \* 10`))
		fi
	    done
	    if [ $dec -eq 9 ];then dece="XC"; fi
	    if [ $dec -eq 8 ];then dece="LXXX"; fi
	    if [ $dec -eq 7 ];then dece="LXX"; fi
	    if [ $dec -eq 6 ];then dece="LX"; fi
	    if [ $dec -eq 5 ];then dece="L"; fi
	    if [ $dec -eq 4 ];then dece="XL"; fi
	    if [ $dec -eq 3 ];then dece="XXX"; fi
	    if [ $dec -eq 2 ];then dece="XX"; fi
	    if [ $dec -eq 1 ];then dece="X"; fi

	    rom=$rom$dece
	fi

	if [ $num -eq 9 ];then uni="IX"; fi
	if [ $num -eq 8 ];then uni="VIII"; fi
	if [ $num -eq 7 ];then uni="VII"; fi
	if [ $num -eq 6 ];then uni="VI"; fi
	if [ $num -eq 5 ];then uni="V"; fi
	if [ $num -eq 4 ];then uni="IV"; fi
	if [ $num -eq 3 ];then uni="III"; fi
	if [ $num -eq 2 ];then uni="II"; fi
	if [ $num -eq 1 ];then uni="I"; fi

	rom=$rom$uni

	echo "Es decimal y el número es $rom"
    else
	echo "Número fuera de rango."
    fi
elif [ `echo $num | grep [^M,D,C,L,X,V,I] | wc -l` -eq 0 ]; then
    convertir de romano a num
else
    echo "ERROR: Escribe las letras en mayuscula."
fi
