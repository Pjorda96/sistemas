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
	echo "${!x} ${!y}" >> registroDOCaux.txt
     done
}

repartir
