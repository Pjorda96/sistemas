read -p "Introduce tu nombre: " nom
read -p "Introduce el saldo a apostar: " saldo

#12*4=48 48/6=8       max 8 jugadas
cont=0

jugar=1
balance=0

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
	    cont=$((cont + 1))
	    balance=$((balance-1))
	    ;;
	
        *)
	    apuesta=$((apuesta + newApuesta))
	    saldo=$((saldo - newApuesta))
	    
	    echo "Las dos primeras cartas del crupier son:"
	    for i in `seq 1 6`;do
		x="cart${i}"
		y="palo${i}"
		p=${!y}
		if [ $i -ge 4 ] && [ $i -le 5 ]; then
		    if [ $p -eq 1 ]; then f="picas"; fi
		    if [ $p -eq 2 ]; then f="tréboles"; fi
		    if [ $p -eq 3 ]; then f="corazones"; fi
		    if [ $p -eq 4 ]; then f="diamantes"; fi
		    echo "${!x} $f"
		fi
		echo "${!x} ${!y}" >> registroCARTAS.txt
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
		    balance=$((balance - apuesta))
		    cont=$((cont + 1))
		    ;;

		"Si")
		    if [ $saldo -ge $apuesta ]; then
			saldo=$((saldo - apuesta))
			apuesta=$((apuesta + apuesta))
		    elif [ $saldo -ge 0 ] && [ $saldo -lt $apuesta ]; then
			apuesta=$((apuesta + saldo))
			saldo=0
		    fi

		    if [ $((cart1 + cart2 + cart3)) -gt $((cart4 + cart 5 + 12)) ]; then
			echo "¡¡HAS GANADO!!"
			echo "Se han sumado $((apuesta + apuesta)) unidades a tu saldo"
			apuesta=$((apuesta + apuesta))
			saldo=$((saldo + apuesta))
			balance=$((balance + apuesta))

			cont=$((cont + 1))
			echo "En la partida $cont el jugador ha ganado $apuesta unidades" >> registroJuego.txt
		    elif [ $((cart1 + cart2 + cart3)) -lt $((cart4 + cart 5 - 12)) ]; then
			echo "Has perdido"
			echo "Has perdido $apuesta unidades"
			balance=$((balance - apuesta))

			cont=$((cont + 1))
			echo "En la partida $cont el jugador ha perdido $apuesta unidades" >> registroJuego.txt
		    else

			diferencia=$((cart1 + cart2 + cart3 - (cart4 + cart 5)))
			corte=$((diferencia/2))
			rand=`echo $(($(($RANDOM%diferencia))+1))`
			
			if [ $rand -lt $corte ]; then
			    echo "¡¡HAS GANADO!!"
			    echo "El crupier se ha retirado"
			    echo "Se han sumado $((apuesta + apuesta)) unidades a tu saldo"
			    apuesta=$((apuesta + apuesta))
			    saldo=$((saldo + apuesta))
			    balance=$((balance + apuesta))

			    cont=$((cont + 1))
			    echo "En la partida $cont el jugador ha ganado $apuesta unidades" >> registroJuego.txt
			else
			    echo "Tus cartas son:"
			    for i in `seq 1 3`;do
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
			    
			    echo "Las cartas del crupier son:"
			    for i in `seq 4 6`;do
				x="cart${i}"
				y="palo${i}"
				p=${!y}
				if [ $i -ge 4 ] && [ $i -le 6 ]; then
				    if [ $p -eq 1 ]; then f="picas"; fi
				    if [ $p -eq 2 ]; then f="tréboles"; fi
				    if [ $p -eq 3 ]; then f="corazones"; fi
				    if [ $p -eq 4 ]; then f="diamantes"; fi
				    echo "${!x} $f"
				fi
			    done

			    if [ $((carta1 + carta2 + carta3)) -eq $((carta4 + carta5 + carta6)) ];then
				echo "Mala suerte, empate"
				echo "Se te han devuelto $apuesta unidades a tu saldo"
				saldo=$((saldo + apuesta))

				cont=$((cont + 1))
				echo "En la partida $cont el jugador ha empatado" >> registroJuego.txt
			    elif [ $((carta1 + carta2 + carta3)) -gt $((carta4 + carta5 + carta6)) ];then
				#Frase típica del blackjack
				echo "¡¡Winner, Winner Chicken Dinner!!"
				apuesta=$((apuesta + apuesta))
				echo "Se han sumado $apuesta unidades a tu saldo"
				saldo=$((saldo + apuesta))
				balance=$((balance + apuesta))

				cont=$((cont + 1))
				echo "En la partida $cont el jugador ha ganado $apuesta unidades" >> registroJuego.txt
			    elif [ $((carta1 + carta2 + carta3)) -lt $((carta4 + carta5 + carta6)) ];then
				echo "La banca siempre gana"
				echo "Has perdido $apuesta unidades"
				balance=$((balance - apuesta))

				cont=$((cont + 1))
				echo "En la partida $cont el jugador ha perdido $apuesta unidades" >> registroJuego.txt
			    fi
			fi
			
		    fi
		    ;;
	    esac
	    ;;
    esac

    if [ $saldo -gt 0 ]; then
	read -p "¿Jugar de nuevo? (Si/No): " repetir

	while [ "$repetir" != "SI" ] && [ "$repetir" != "No" ]; do
		echo "Escriba Si o No"
		read -p "¿Jugar de nuevo? (Si/No): " repetir

		if [ "$repetir" == "Si" ]; then
		    jugar=1
		else
		    jugar=0
		fi
		
	done
    fi
        
done

for i in `cat registroJUEGO.txt | wc -l`;do
    echo `cat registroJUEGO.txt | head -$i | tail -1`
done

echo "El balance ha sido de $balance"

rm registroCARTAS.txt
rm registroJUEGO.txt
