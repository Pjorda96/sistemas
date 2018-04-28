cont=0
dia=0
mesn=0
usuario=""
num=`cat usuarios.txt | wc -l`

read -p "Introduce una fecha (dia mes): " dia mes

for i in `seq 1 $num`; do
    meslin=`cat usuarios.txt | head -$i | tail -1 | awk '{print $3}'`
    dialin=`cat usuarios.txt | head -$i | tail -1 | awk '{print $2}'`
    if [ $mes == $meslin ] && [ $dia -eq $dialin ]; then
	echo `cat usuarios.txt | head -$i | tail -1 | awk '{print $1}'`
	cont=$((cont + 1))
    fi
done

if [ $cont -eq 0 ]; then
    echo "No hay ningún login en esa fecha"
fi
