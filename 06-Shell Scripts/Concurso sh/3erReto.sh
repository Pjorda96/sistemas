read -p "Introduce tu nombre: " nom
read -p "Introduce el saldo a apostar: " saldo

#12*4=48 48/6=8       max 8 jugadas
cont=0

$jugar=1

function repartir(){
    cart1=`echo $(($(($RANDOM%11))+1))`
    cart2=`echo $(($(($RANDOM%11))+1))`
    cart3=`echo $(($(($RANDOM%11))+1))`
    cart4=`echo $(($(($RANDOM%11))+1))`
    cart5=`echo $(($(($RANDOM%11))+1))`
    cart6=`echo $(($(($RANDOM%11))+1))`
    
    palo1=`echo $(($(($RANDOM%3))+1))`
    palo2=`echo $(($(($RANDOM%3))+1))`
    palo3=`echo $(($(($RANDOM%3))+1))`
    palo4=`echo $(($(($RANDOM%3))+1))`
    palo5=`echo $(($(($RANDOM%3))+1))`
    palo6=`echo $(($(($RANDOM%3))+1))`

    for i in `seq 1 6`;do
	x="cart${i}"
	y="palo${i}"
	p=${!y}
	if [ $i -ge 1 ] && [ $i -le 3 ]; then
	    if [ $p -eq 1 ]; then f="picas"; fi
	    if [ $p -eq 2 ]; then f="tréboles"; fi
	    if [ $p -eq 3 ]; then f="corazones"; fi
	    if [ $p -eq 4 ]; then f="diamantes"; fi
	    echo "${!x} $f"
	fi
	echo "${!x} ${!y}" >> registroCARTAS.txt
     done
}

while [ $cont -le 8 ] && [ $jugar -eq 1 ]; do
    apuesta=1

    saldo=$((saldo - 1))

    repartir

    read -p "Introduce 0 para retirarse o la cantidad a apostar: " newApuesta

    while [ $newApuesta -lt 0 ]; do
	read -p "Introduce una cantidad mayor que 0: " newApuesta
	
	while [ $newApuesta -gt $saldo ]; do
	    echo "No se puede apostar más de los que tienes"
	    read -p "Tu saldo es $saldo: " newApuesta
	done
    done
    
    case $newApuesta in
	0)
	    echo "Te has retirado, has perdido."
	    echo "En la partida $cont el jugador ha perdido $apuesta unidades" >> registroJuego.txt
	    ;;
	
        *)
	    apuesta=$((apuesta + newApuesta))
	    saldo=$((saldo - newApuesta))
	    
	    echo "Las dos primeras cartas del crupier son:"
	    for i in `seq 4 5`;do
		x="cart${i}"
		y="palo${i}"
		p=${!y}
		if [ $i -ge 1 ] && [ $i -le 3 ]; then
		    if [ $p -eq 1 ]; then f="picas"; fi
		    if [ $p -eq 2 ]; then f="tréboles"; fi
		    if [ $p -eq 3 ]; then f="corazones"; fi
		    if [ $p -eq 4 ]; then f="diamantes"; fi
		    echo "${!x} $f"
		fi
	    done

	    echo "Para continuar debe doblar su apuesta"
	    read -p "¿Desea continuar? (Si/No): " doblar

	    while [ "$doblar" != "SI" ] && [ "$doblar" != "No" ]; do
		echo "Escriba Si o No"
		read -p "¿Desea continuar? (Si/No): " doblar
	    done

	    case $doblar in
		"No")
		    echo "Te has retirado, has perdido."
		    echo "En la partida $cont el jugador ha perdido $apuesta unidades" >> registroJuego.txt
		    ;;

		"Si")
		    if [ $saldo -ge $apuesta ]; then
			saldo=$((saldo - apuesta))
			apuesta=$((apuesta + apuesta))
		    elif [ $saldo -ge 0 ] && [ $saldo -lt $apuesta ]; then
			apuesta=$((apuesta + saldo))
			saldo=0
		    fi

		    IA para ver si se retira o sigue (punto 7)



		    
		    ;;
	    esac
	    ;;
	esac    
done

