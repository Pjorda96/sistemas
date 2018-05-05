read -p "Escriba un número: " num

#2003, primer primo mayor que 2000 para evitar errores de divisibilidad. con esto se calcula si es un número (wc -l = 1) o da un error (wc -l = 0)
if [ `echo $((2003 / num)) | wc -w` -eq 1 ]; then
    if [ $num -le 2000 ] || [ $num -ge 1 ]; then
	convertir de num a romano
    else
	echo "Número fuera de rango."
    fi
elif [ `echo $num | grep [^M,D,C,L,X,V,I] | wc -l` -eq 0 ]; then
    convertir de romano a num
else
    echo "ERROR: Escribe las letras en mayuscula."
fi
