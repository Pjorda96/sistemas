read -p "Introduce una cantidad" x

precio=0

if [ $x -lt 50 ]; then
    precio=20
else
    precio=20
    x=$x - 50

    if [ $x -lt 20 ]; then
	precio=$precio + 20
    else
	precio=$precio + 20
	x=$x - 200
