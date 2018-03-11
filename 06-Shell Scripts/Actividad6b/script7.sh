cont=0

if [ "$1" == "." ]; then
    1=""
fi

if [ -d "$1"  ]; then
    cont=$((cont+`ls -l $1*.txt | wc -l`))
    rm $1*[.txt]
    echo "Se han borrado $cont ficheros."
else
    echo "No existe la ruta seleccionada"
fi

