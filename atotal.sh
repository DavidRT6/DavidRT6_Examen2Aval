#!/bin/bash
cantConsumos=`cat consumos.txt | tail -n+2 | wc -l`
total=0

read -p "Introduce una ciudad: " ciudadElegida

while [ $total -eq 0 ]; do
for i in `seq 1 $cantConsumos`; do
i=$((i+1))
ciudad=`cat consumos.txt | awk '{print $1}' | head -$i | tail -1`
echo $ciudad
consumo=`cat consumos.txt | awk '{print $4}' | head -$i | tail -1`
if [ $ciudad = $ciudadElegida ]
then
total=$((total+consumo))
fi
done

if [ $total -eq 0 ]
then
echo "Esa ciudad no se encuentra en la lista."
read -p "Introduce otra: " ciudadElegida
fi
done

echo
echo "El consumo de la ciudad $ciudad es de: $total"