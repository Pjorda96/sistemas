cont=0
dia=0
mesn=0
mes=""
usuario=""
num=`cat usuarios.txt | wc -l`

function Mesnum(){
     if [ "$1" = "enero" ]; then meslin=1; fi
     if [ "$1" = "febrero" ]; then meslin=2; fi
     if [ "$1" = "marzo" ]; then meslin=3; fi
     if [ "$1" = "abril" ]; then meslin=4; fi
     if [ "$1" = "mayo" ]; then meslin=5; fi
     if [ "$1" = "junio" ]; then meslin=6; fi
     if [ "$1" = "julio" ]; then meslin=7; fi
     if [ "$1" = "agosto" ]; then meslin=8; fi
     if [ "$1" = "septiembre" ]; then meslin=9; fi
     if [ "$1" = "octubre" ]; then meslin=10; fi
     if [ "$1" = "noviembre" ]; then meslin=11; fi
     if [ "$1" = "diciembre" ]; then meslin=12; fi
}

function Mestring(){
     if [ $1 = 1 ]; then mes="enero"; fi
     if [ $1 = 2 ]; then mes="febrero"; fi
     if [ $1 = 3 ]; then mes="marzo"; fi
     if [ $1 = 4 ]; then mes="abril"; fi
     if [ $1 = 5 ]; then mes="mayo"; fi
     if [ $1 = 6 ]; then mes="junio"; fi
     if [ $1 = 7 ]; then mes="julio"; fi
     if [ $1 = 8 ]; then mes="agosto"; fi
     if [ $1 = 9 ]; then mes="septiembre"; fi
     if [ $1 = 10 ]; then mes="octubre"; fi
     if [ $1 = 11 ]; then mes="noviembre"; fi
     if [ $1 = 12 ]; then mes="diciembre"; fi
}

echo -e "Elige operación: \n1) Usuarios logueados un dia. \n2) Veces logueado \n3) Último login"

read -p "Por favor, escribir solo 1, 2 o 3: " s

case $s in
    1)
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
	;;
    2)
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
	;;
    3)
        read -p "Introduce un usuario: " usuario
	
	for i in `seq 1 $num`; do
	    us=`cat usuarios.txt | head -$i | tail -1 | awk '{print $1}'`
	    Mesnum `cat usuarios.txt | head -$i | tail -1 | awk '{print $3}'`
	    dialin=`cat usuarios.txt | head -$i | tail -1 | awk '{print $2}'`
	    if [ $us =  $usuario ]; then
		if [ $meslin -gt $mesn ]; then
		    mesn=$meslin
		    if [ $dialin -gt $dia ]; then
			dia=$dialin
		    fi
		fi
	    fi
	done

	#pasar el mes de número a string
	Mestring $mesn
	
	if [ $dia -eq 0 ]; then
	    echo "El usuario $usuario no se ha logueado"
	else
	    echo "El último login del usuario $usuario es el día $dia de $mes"
	fi
        ;;
    
    *)
	echo "Por favor, escribir solo 1, 2 o 3"
	;;
esac
