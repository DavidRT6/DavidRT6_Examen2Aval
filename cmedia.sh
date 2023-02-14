#!/bin/bash
cantConsumos=`cat consumos.txt | tail -n+2 | wc -l`
suma=0
media=0
registros=0

for i in `seq 1 $cantConsumos`; do
i=$((i+1))
ciudad=`cat consumos.txt | awk '{print $1}' | head -$i | tail -1`
consumo=`cat consumos.txt | awk '{print $4}' | head -$i | tail -1`

if [ $ciudad = $1 ]
then
suma=$((suma+consumo))
registros=$((registros+1))
fi
done

media=$((suma/registros))
echo
echo "La media del consumo de la ciudad $1 es: $media"