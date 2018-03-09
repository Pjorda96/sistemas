precipitaciones=$(cat precipitaciones.txt)
array[1]="LUNES"
array[2]="MARTES"
array[3]="MIERCOLES"
array[4]="JUEVES"
array[5]="VIERNES"
array[6]="SABADO"
array[7]="DOMINGO"

contador=1
echo $precipitaciones


for i in $precipitaciones;do

    if [ $i -eq 0 ]; then
	echo ${array[$contador]}
    fi


    contador=$((contador+1))

    if [ $contador -eq 8 ];then
	contador=1
    fi
    
	

done
