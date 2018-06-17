cont=0
dia=0
mesn=0
usuario=""
num=`cat usuarios.txt | wc -l`

read -p "Introduce un usuario: " usuario

	for i in `seq 1 $num`; do
	    us=`cat usuarios.txt | head -$i | tail -1 | awk '{print $1}'`
	    if [ $usuario = $us ]; then
		cont=$((cont + 1))
	    fi
	done
	
	if [ $cont -ne 0 ]; then
	    echo "El usuario $usuario se ha logueado $cont veces"
	else
	    echo "El usuario $usuario no se ha logueado"
	fi
