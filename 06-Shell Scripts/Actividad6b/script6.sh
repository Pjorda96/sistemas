cont=0

if [ "$1" == "." ] || [ "$1" == "" ]; then
    1=""
fi

cont=$((cont+`ls -l $1*.txt | wc -l`))

rm $1*[.txt]

echo "Se han borrado $cont ficheros."
