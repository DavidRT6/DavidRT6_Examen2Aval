#!/bin/bash


cantConsumos=`cat consumos.txt | tail -n+2 | wc -l`
mediaMenor=`cat consumos.txt | awk '{print $4}' | head -2 | tail -1`
ciudadMediaMenor=`cat consumos.txt | awk '{print $1}' | head -2 | tail -1`

for i in `seq 1 $cantConsumos`; do
i=$((i+1))
source cmedia.sh >> consumosMediaRegistros.txt
if [ $media -lt $mediaMenor ]
then
mediaMenor=$media
ciudadMediaMenor=$ciudad
fi
done


echo
echo "La ciudad con menor consumo de media es: "