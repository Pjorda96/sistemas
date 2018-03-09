usuariosL=0
usuariosW=0
procesosL=0
procesosW=0
num=`cat listado.txt | wc -l`

for i in `seq 1 $num`; do
    j=`cat listado.txt | head -$i | tail -1 | awk '{print $2}'`
#    echo $j
    if [  "$j" == "Linux" ]; then
       usuariosL=$((usuariosL+1))
       procesosL=$((procesosL+`cat listado.txt | head -$i | tail -1 | awk '{print $3}'`))
    else
       usuariosW=$((usuariosW+1))
       procesosW=$((procesosW+`cat listado.txt | head -$i | tail -1 | awk '{print $3}'`))
    fi
done

echo "Linux-> $usuariosL $procesosL"
echo "Windows-> $usuariosW $procesosW"
